package com.bxlt.generator;

import javafx.scene.control.Tab;
import org.h2.api.ErrorCode;
import org.h2.command.Command;
import org.h2.command.ddl.CreateView;
import org.h2.command.dml.NoOperation;
import org.h2.command.dml.Select;
import org.h2.engine.Constants;
import org.h2.expression.Parameter;
import org.h2.java.lang.Integer;
import org.h2.message.DbException;
import org.h2.util.StatementBuilder;
import org.h2.util.StringUtils;
import org.h2.value.*;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Handler;

/**
 * Created by wangjw on 2016/6/30.
 */
public class SqlParser {


    // used during the tokenizer phase
    private static final int CHAR_END = 1, CHAR_VALUE = 2, CHAR_QUOTED = 3;
    private static final int CHAR_NAME = 4, CHAR_SPECIAL_1 = 5,
            CHAR_SPECIAL_2 = 6;
    private static final int CHAR_STRING = 7, CHAR_DOT = 8,
            CHAR_DOLLAR_QUOTED_STRING = 9;

    // this are token types
    private static final int KEYWORD = 1, IDENTIFIER = 2, PARAMETER = 3,
            END = 4, VALUE = 5;
    private static final int EQUAL = 6, BIGGER_EQUAL = 7, BIGGER = 8;
    private static final int SMALLER = 9, SMALLER_EQUAL = 10, NOT_EQUAL = 11,
            AT = 12;
    private static final int MINUS = 13, PLUS = 14, STRING_CONCAT = 15;
    private static final int OPEN = 16, CLOSE = 17, NULL = 18, TRUE = 19,
            FALSE = 20;
    private static final int CURRENT_TIMESTAMP = 21, CURRENT_DATE = 22,
            CURRENT_TIME = 23, ROWNUM = 24;
    private static final int SPATIAL_INTERSECTS = 25;
    private Value currentValue;
    /** indicates character-type for each char in sqlCommand */
    private int[] characterTypes;
    private int currentTokenType;
    private String currentToken;
    private boolean currentTokenQuoted;
    private String originalSQL;
    /** copy of originalSQL, with comments blanked out */
    private String sqlCommand;
    /** cached array if chars from sqlCommand */
    private char[] sqlCommandChars;
    /** index into sqlCommand of previous token */
    private int lastParseIndex;
    /** index into sqlCommand of current token */
    private int parseIndex;
    private String schemaName;
    private ArrayList<String> expectedList;
    private boolean rightsChecked;
    private boolean recompileAlways;
    private int orderInFrom;


    private  boolean identifiersToUpper = true;
    /*
   *将sql转为char数组，解析为types的数组，后续解析时
    */
    private void initialize(String sql) {
        if (sql == null) {
            sql = "";
        }
        originalSQL = sql;
        sqlCommand = sql;
        int len = sql.length() + 1;
        char[] command = new char[len];
        int[] types = new int[len];
        len--;
        sql.getChars(0, len, command, 0);
        boolean changed = false;
        command[len] = ' ';
        int startLoop = 0;
        int lastType = 0;
        for (int i = 0; i < len; i++) {
            char c = command[i];
            int type = 0;
            switch (c) {
                case '/'://跳过多行注释
                    if (command[i + 1] == '*') {
                        // block comment
                        changed = true;
                        command[i] = ' ';
                        command[i + 1] = ' ';
                        startLoop = i;
                        i += 2;
                        checkRunOver(i, len, startLoop);
                        while (command[i] != '*' || command[i + 1] != '/') {
                            command[i++] = ' ';
                            checkRunOver(i, len, startLoop);
                        }
                        command[i] = ' ';
                        command[i + 1] = ' ';
                        i++;
                    } else if (command[i + 1] == '/') {
                        // single line comment
                        changed = true;
                        startLoop = i;
                        while (true) {
                            c = command[i];
                            if (c == '\n' || c == '\r' || i >= len - 1) {
                                break;
                            }
                            command[i++] = ' ';
                            checkRunOver(i, len, startLoop);
                        }
                    } else {
                        type = CHAR_SPECIAL_1;
                    }
                    break;
                case '-'://单行注释
                    if (command[i + 1] == '-') {
                        // single line comment
                        changed = true;
                        startLoop = i;
                        while (true) {
                            c = command[i];
                            if (c == '\n' || c == '\r' || i >= len - 1) {
                                break;
                            }
                            command[i++] = ' ';
                            checkRunOver(i, len, startLoop);
                        }
                    } else {
                        type = CHAR_SPECIAL_1;
                    }
                    break;
                case '$':
                    if (command[i + 1] == '$' && (i == 0 || command[i - 1] <= ' ')) {
                        // dollar quoted string
                        changed = true;
                        command[i] = ' ';
                        command[i + 1] = ' ';
                        startLoop = i;
                        i += 2;
                        checkRunOver(i, len, startLoop);
                        while (command[i] != '$' || command[i + 1] != '$') {
                            types[i++] = CHAR_DOLLAR_QUOTED_STRING;
                            checkRunOver(i, len, startLoop);
                        }
                        command[i] = ' ';
                        command[i + 1] = ' ';
                        i++;
                    } else {
                        if (lastType == CHAR_NAME || lastType == CHAR_VALUE) {
                            // $ inside an identifier is supported
                            type = CHAR_NAME;
                        } else {
                            // but not at the start, to support PostgreSQL $1
                            type = CHAR_SPECIAL_1;
                        }
                    }
                    break;
                case '(':
                case ')':
                case '{':
                case '}':
                case '*':
                case ',':
                case ';':
                case '+':
                case '%':
                case '?':
                case '@':
                case ']':
                    type = CHAR_SPECIAL_1;
                    break;
                case '!':
                case '<':
                case '>':
                case '|':
                case '=':
                case ':':
                case '&':
                case '~':
                    type = CHAR_SPECIAL_2;
                    break;
                case '.':
                    type = CHAR_DOT;
                    break;
                case '\'':
                    type = types[i] = CHAR_STRING;
                    startLoop = i;
                    while (command[++i] != '\'') {
                        checkRunOver(i, len, startLoop);
                    }
                    break;
                case '[':
                    if (true) {
                        // SQL Server alias for "
                        command[i] = '"';
                        changed = true;
                        type = types[i] = CHAR_QUOTED;
                        startLoop = i;
                        while (command[++i] != ']') {
                            checkRunOver(i, len, startLoop);
                        }
                        command[i] = '"';
                    } else {
                        type = CHAR_SPECIAL_1;
                    }
                    break;
                case '`':
                    // MySQL alias for ", but not case sensitive
                    command[i] = '"';
                    changed = true;
                    type = types[i] = CHAR_QUOTED;
                    startLoop = i;
                    while (command[++i] != '`') {
                        checkRunOver(i, len, startLoop);
                        c = command[i];
                        command[i] = Character.toUpperCase(c);
                    }
                    command[i] = '"';
                    break;
                case '\"':
                    type = types[i] = CHAR_QUOTED;
                    startLoop = i;
                    while (command[++i] != '\"') {
                        checkRunOver(i, len, startLoop);
                    }
                    break;
                case '_':
                    type = CHAR_NAME;
                    break;
                case '#':
                    if (true) {
                        type = CHAR_NAME;
                        break;
                    }
                default:
                    if (c >= 'a' && c <= 'z') {
                        if (identifiersToUpper) {
                            command[i] = (char) (c - ('a' - 'A'));
                            changed = true;
                        }
                        type = CHAR_NAME;
                    } else if (c >= 'A' && c <= 'Z') {
                        type = CHAR_NAME;
                    } else if (c >= '0' && c <= '9') {
                        type = CHAR_VALUE;
                    } else {
                        if (c <= ' ' || Character.isSpaceChar(c)) {
                            // whitespace
                        } else if (Character.isJavaIdentifierPart(c)) {
                            type = CHAR_NAME;
                            if (identifiersToUpper) {
                                char u = Character.toUpperCase(c);
                                if (u != c) {
                                    command[i] = u;
                                    changed = true;
                                }
                            }
                        } else {
                            type = CHAR_SPECIAL_1;
                        }
                    }
            }
            types[i] = type;
            lastType = type;
        }
        sqlCommandChars = command;
        types[len] = CHAR_END;
        characterTypes = types;
        if (changed) {
            sqlCommand = new String(command);
        }
        parseIndex = 0;
    }

    private DbException getSyntaxError() {
        if (expectedList == null || expectedList.size() == 0) {
            return DbException.getSyntaxError(sqlCommand, parseIndex);
        }
        StatementBuilder buff = new StatementBuilder();
        for (String e : expectedList) {
            buff.appendExceptFirst(", ");
            buff.append(e);
        }
        return DbException.getSyntaxError(sqlCommand, parseIndex,
                buff.toString());
    }

    private void checkRunOver(int i, int len, int startLoop) {
        if (i >= len) {
            parseIndex = startLoop;
            throw getSyntaxError();
        }
    }


    public SqlParser(String sql)
    {
        this.originalSQL = sql;
        initialize(sql);
        read();
    }

    public HashMap<String,List<Comment>> parseComment(String sql)
    {
        HashMap<String,List<Comment>> list  = new HashMap<String, List<Comment>>();

        int start = lastParseIndex;
        Prepared c = null;
        String token = currentToken;
        if (token.length() == 0) {
//            c = new NoOperation(session);
        } else {

            while(parseIndex < originalSQL.length()) {
                char first = currentToken.charAt(0);
                switch (first) {
                    case 'C':
                    case 'c':
                        if (readIf("CREATE")) {
                            while(!readIf(";"))
                                read();
                        }
                        else if (readIf("COMMENT"))
                        {
                            Comment cmt = parseSingleComment();
                            List<Comment>  cmtList  = list.get(cmt.getTable());
                            if (cmtList == null)
                            {
                                cmtList = new ArrayList<Comment>();
                                cmtList.add(cmt);
                                list.put(cmt.getTable(),cmtList);
                            }
                            else
                            {
                                cmtList.add(cmt);
                            }
                        }
                    default:
                        while(!readIf(";"))
                            read();

                }
            }
        }
        return list;
    }

    private  Comment parseSingleComment()
    {
        readIf("ON");
        if (readIf("COLUMN"))
        {
            String tableName  = currentToken;
            read();
            readIf(".");
            String column = currentToken;
            read();
            readIf("IS");
            String colComment  = currentValue.getString();
            Comment cmt = new Comment();
            cmt.setTable(tableName);
            cmt.setName(column);
            cmt.setComment(colComment);
            readIf(";");
            return cmt;
        }
        else if(readIf("table"))
        {
            while(!readIf(";"))
                read();
        }
        return null;
    }

    public HashMap<String,Table> parse(String sql)
    {
        HashMap<String,Table> list  = new HashMap<String, Table>();
        int start = lastParseIndex;
        Prepared c = null;
        String token = currentToken;
        if (token.length() == 0) {
//            c = new NoOperation(session);
        } else {

            while(parseIndex < originalSQL.length()) {
                char first = currentToken.charAt(0);
                switch (first) {
                    case 'C':
                    case 'c':
                        if (readIf("CREATE")) {
                            c = parseCreate();
                            if (c instanceof  Table)
                            {
                                Table t = (Table)c;
                                list.put(t.getName(),t);
                            }

                        }
                       else if (readIf("COMMENT"))
                        {
                            while(!readIf(";"))
                            {
                                read();
                            }
                        }
                        default:
                            while(!readIf(";"))
                                read();

                }
            }
        }
        return list;
    }

    public  Prepared parseCreate()
    {
        if (readIf("TABLE"))
        {
            return parseCreateTable();
        }
        else if (readIf("INDEX"))
        {
            while(!readIf(";"))
                read();
        }
        return null;
    }

    public Prepared parseCreateTable()
    {
        Table t = new Table();
        String name = currentToken;
        read();
        if(readIf("(")) {
            do{
                Column col = parseColumn();
                t.addColumn(col);
//                readIf(")");
//                if (readIf("TABLESPACE")) {
//                    while (!readIf(";")) {
//                        read();
//                    }
//                }
            }while(readIfMore());

        }
        t.setName(name);
        return t;
    }

    private  Column parseColumn()
    {
        String colName = currentToken;
        read();
        Class<?> type = null;
        int len = 0;
        boolean empty = true;
        if (readIf("NUMBER"))
        {
            if(readIf("("))
            {
                len = readInt();
                if (readIf(","))
                {
                    type = double.class;
                    readInt();
                }
                else
                {
                    type = int.class;
                }
                read(")");//此时必须是),否则报错
            }

        }else if(readIf("VARCHAR2") || readIf("VARCHAR"))
        {
            type = String.class;
            if(readIf("("))
            {
                len =  readInt();
                read(")");
            }
        }
        else if(readIf("DATE"))
        {
            type = Date.class;
            readIf("DEFAULT");
            readIf("SYSDATE");
        }


        if (readIf("NOT") && readIf("NULL"))
        {
            empty = false;
        }

        return new Column(colName,empty,type,"",len);
    }


    private boolean readIfMore() {
        if (readIf(",")) {
            return !readIf(")");
        }
        read(")");
        return false;
    }

    private int readInt() {
        boolean minus = false;
        if (currentTokenType == MINUS) {
            minus = true;
            read();
        } else if (currentTokenType == PLUS) {
            read();
        }
        if (currentTokenType != VALUE) {
            throw DbException.getSyntaxError(sqlCommand, parseIndex, "integer");
        }
        if (minus) {
            // must do that now, otherwise Integer.MIN_VALUE would not work
            currentValue = currentValue.negate();
        }
        int i = currentValue.getInt();
        read();
        return i;
    }

    private boolean equalsToken(String a, String b) {
        if (a == null) {
            return b == null;
        } else if (a.equals(b)) {
            return true;
        } else if (!identifiersToUpper && a.equalsIgnoreCase(b)) {
            return true;
        }
        return false;
    }

    private  boolean readIf(String token)
    {
        if (!currentTokenQuoted && equalsToken(token, currentToken)) {
            read();
            return true;
        }
        addExpected(token);
        return false;
    }

    private long readLong() {
        boolean minus = false;
        if (currentTokenType == MINUS) {
            minus = true;
            read();
        } else if (currentTokenType == PLUS) {
            read();
        }
        if (currentTokenType != VALUE) {
            throw DbException.getSyntaxError(sqlCommand, parseIndex, "long");
        }
        if (minus) {
            // must do that now, otherwise Long.MIN_VALUE would not work
            currentValue = currentValue.negate();
        }
        long i = currentValue.getLong();
        read();
        return i;
    }

    private void addExpected(String token) {
        if (expectedList != null) {
            expectedList.add(token);
        }
    }

    private static int getKeywordOrIdentifier(String s1, String s2,
                                              int keywordType) {
        if (s1.equals(s2)) {
            return keywordType;
        }
        return IDENTIFIER;
    }

    private static int getSaveTokenType(String s, boolean supportOffsetFetch) {
        switch (s.charAt(0)) {
            case 'C':
                if (s.equals("CURRENT_TIMESTAMP")) {
                    return CURRENT_TIMESTAMP;
                } else if (s.equals("CURRENT_TIME")) {
                    return CURRENT_TIME;
                } else if (s.equals("CURRENT_DATE")) {
                    return CURRENT_DATE;
                }
                return getKeywordOrIdentifier(s, "CROSS", KEYWORD);
            case 'D':
                return getKeywordOrIdentifier(s, "DISTINCT", KEYWORD);
            case 'E':
                if ("EXCEPT".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "EXISTS", KEYWORD);
            case 'F':
                if ("FROM".equals(s)) {
                    return KEYWORD;
                } else if ("FOR".equals(s)) {
                    return KEYWORD;
                } else if ("FULL".equals(s)) {
                    return KEYWORD;
                } else if (supportOffsetFetch && "FETCH".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "FALSE", FALSE);
            case 'G':
                return getKeywordOrIdentifier(s, "GROUP", KEYWORD);
            case 'H':
                return getKeywordOrIdentifier(s, "HAVING", KEYWORD);
            case 'I':
                if ("INNER".equals(s)) {
                    return KEYWORD;
                } else if ("INTERSECT".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "IS", KEYWORD);
            case 'J':
                return getKeywordOrIdentifier(s, "JOIN", KEYWORD);
            case 'L':
                if ("LIMIT".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "LIKE", KEYWORD);
            case 'M':
                return getKeywordOrIdentifier(s, "MINUS", KEYWORD);
            case 'N':
                if ("NOT".equals(s)) {
                    return KEYWORD;
                } else if ("NATURAL".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "NULL", NULL);
            case 'O':
                if ("ON".equals(s)) {
                    return KEYWORD;
                } else if (supportOffsetFetch && "OFFSET".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "ORDER", KEYWORD);
            case 'P':
                return getKeywordOrIdentifier(s, "PRIMARY", KEYWORD);
            case 'R':
                return getKeywordOrIdentifier(s, "ROWNUM", ROWNUM);
            case 'S':
                if (s.equals("SYSTIMESTAMP")) {
                    return CURRENT_TIMESTAMP;
                } else if (s.equals("SYSTIME")) {
                    return CURRENT_TIME;
                } else if (s.equals("SYSDATE")) {
                    return CURRENT_TIMESTAMP;
                }
                return getKeywordOrIdentifier(s, "SELECT", KEYWORD);
            case 'T':
                if ("TODAY".equals(s)) {
                    return CURRENT_DATE;
                }
                return getKeywordOrIdentifier(s, "TRUE", TRUE);
            case 'U':
                if ("UNIQUE".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "UNION", KEYWORD);
            case 'W':
                if ("WITH".equals(s)) {
                    return KEYWORD;
                }
                return getKeywordOrIdentifier(s, "WHERE", KEYWORD);
            default:
                return IDENTIFIER;
        }
    }

    private int getTokenType(String s) {
        int len = s.length();
        if (len == 0) {
            throw getSyntaxError();
        }
        if (!identifiersToUpper) {
            // if not yet converted to uppercase, do it now
            s = StringUtils.toUpperEnglish(s);
        }
        return getSaveTokenType(s, false);
    }

    private int getSpecialType(String s) {
        char c0 = s.charAt(0);
        if (s.length() == 1) {
            switch (c0) {
                case '?':
                case '$':
                    return PARAMETER;
                case '@':
                    return AT;
                case '+':
                    return PLUS;
                case '-':
                    return MINUS;
                case '{':
                case '}':
                case '*':
                case '/':
                case '%':
                case ';':
                case ',':
                case ':':
                case '[':
                case ']':
                case '~':
                    return KEYWORD;
                case '(':
                    return OPEN;
                case ')':
                    return CLOSE;
                case '<':
                    return SMALLER;
                case '>':
                    return BIGGER;
                case '=':
                    return EQUAL;
                default:
                    break;
            }
        } else if (s.length() == 2) {
            switch (c0) {
                case ':':
                    if ("::".equals(s)) {
                        return KEYWORD;
                    } else if (":=".equals(s)) {
                        return KEYWORD;
                    }
                    break;
                case '>':
                    if (">=".equals(s)) {
                        return BIGGER_EQUAL;
                    }
                    break;
                case '<':
                    if ("<=".equals(s)) {
                        return SMALLER_EQUAL;
                    } else if ("<>".equals(s)) {
                        return NOT_EQUAL;
                    }
                    break;
                case '!':
                    if ("!=".equals(s)) {
                        return NOT_EQUAL;
                    } else if ("!~".equals(s)) {
                        return KEYWORD;
                    }
                    break;
                case '|':
                    if ("||".equals(s)) {
                        return STRING_CONCAT;
                    }
                    break;
                case '&':
                    if ("&&".equals(s)) {
                        return SPATIAL_INTERSECTS;
                    }
                    break;
            }
        }
        throw getSyntaxError();
    }


    private void checkLiterals(boolean text) {

    }

    private void readHexDecimal(int start, int i) {
        char[] chars = sqlCommandChars;
        char c;
        do {
            c = chars[++i];
        } while ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'F'));
        parseIndex = i;
        String sub = sqlCommand.substring(start, i);
        BigDecimal bd = new BigDecimal(new BigInteger(sub, 16));
        checkLiterals(false);
        currentValue = ValueDecimal.get(bd);
        currentTokenType = VALUE;
    }

    private void readDecimal(int start, int i) {
        char[] chars = sqlCommandChars;
        int[] types = characterTypes;
        // go until the first non-number
        while (true) {
            int t = types[i];
            if (t != CHAR_DOT && t != CHAR_VALUE) {
                break;
            }
            i++;
        }
        boolean containsE = false;
        if (chars[i] == 'E' || chars[i] == 'e') {
            containsE = true;
            i++;
            if (chars[i] == '+' || chars[i] == '-') {
                i++;
            }
            if (types[i] != CHAR_VALUE) {
                throw getSyntaxError();
            }
            while (types[++i] == CHAR_VALUE) {
                // go until the first non-number
            }
        }
        parseIndex = i;
        String sub = sqlCommand.substring(start, i);
        checkLiterals(false);
        if (!containsE && sub.indexOf('.') < 0) {
            BigInteger bi = new BigInteger(sub);
            if (bi.compareTo(ValueLong.MAX) <= 0) {
                // parse constants like "10000000L"
                if (chars[i] == 'L') {
                    parseIndex++;
                }
                currentValue = ValueLong.get(bi.longValue());
                currentTokenType = VALUE;
                return;
            }
        }
        BigDecimal bd;
        try {
            bd = new BigDecimal(sub);
        } catch (NumberFormatException e) {
            throw DbException.get(ErrorCode.DATA_CONVERSION_ERROR_1, e, sub);
        }
        currentValue = ValueDecimal.get(bd);
        currentTokenType = VALUE;
    }

    private void read(String expected) {
        if (currentTokenQuoted || !equalsToken(expected, currentToken)) {
            addExpected(expected);
            throw getSyntaxError();
        }
        read();
    }

    private void read() {
        currentTokenQuoted = false;
        if (expectedList != null) {
            expectedList.clear();
        }
        int[] types = characterTypes;
        lastParseIndex = parseIndex;
        int i = parseIndex;
        int type = types[i];
        while (type == 0) {
            type = types[++i];
        }
        int start = i;
        char[] chars = sqlCommandChars;
        char c = chars[i++];
        currentToken = "";
        switch (type) {
            case CHAR_NAME:
                while (true) {
                    type = types[i];
                    //除了CHAR_NAME和CHAR_VALUE之外都是token的分割字符
                    if (type != CHAR_NAME && type != CHAR_VALUE) {
                        break;
                    }
                    i++;
                }
                currentToken = StringUtils.fromCacheOrNew(sqlCommand.substring(
                        start, i));
                currentTokenType = getTokenType(currentToken);
                parseIndex = i;
                return;
            case CHAR_QUOTED: {
                String result = null;
                while (true) {
                    for (int begin = i;; i++) {
                        if (chars[i] == '\"') {
                            if (result == null) {
                                result = sqlCommand.substring(begin, i);
                            } else {
                                result += sqlCommand.substring(begin - 1, i);
                            }
                            break;
                        }
                    }
                    if (chars[++i] != '\"') {
                        break;
                    }
                    i++;
                }
                currentToken = StringUtils.fromCacheOrNew(result);
                parseIndex = i;
                currentTokenQuoted = true;
                currentTokenType = IDENTIFIER;
                return;
            }
            case CHAR_SPECIAL_2:
                if (types[i] == CHAR_SPECIAL_2) {
                    i++;
                }
                currentToken = sqlCommand.substring(start, i);
                currentTokenType = getSpecialType(currentToken);
                parseIndex = i;
                return;
            case CHAR_SPECIAL_1:
                currentToken = sqlCommand.substring(start, i);
                currentTokenType = getSpecialType(currentToken);
                parseIndex = i;
                return;
            case CHAR_VALUE:
                if (c == '0' && chars[i] == 'X') {
                    // hex number
                    long number = 0;
                    start += 2;
                    i++;
                    while (true) {
                        c = chars[i];
                        if ((c < '0' || c > '9') && (c < 'A' || c > 'F')) {
                            checkLiterals(false);
                            currentValue = ValueInt.get((int) number);
                            currentTokenType = VALUE;
                            currentToken = "0";
                            parseIndex = i;
                            return;
                        }
                        number = (number << 4) + c -
                                (c >= 'A' ? ('A' - 0xa) : ('0'));
                        if (number > Integer.MAX_VALUE) {
                            readHexDecimal(start, i);
                            return;
                        }
                        i++;
                    }
                }
                long number = c - '0';
                while (true) {
                    c = chars[i];
                    if (c < '0' || c > '9') {
                        if (c == '.' || c == 'E' || c == 'L') {
                            readDecimal(start, i);
                            break;
                        }
                        checkLiterals(false);
                        currentValue = ValueInt.get((int) number);
                        currentTokenType = VALUE;
                        currentToken = "0";
                        parseIndex = i;
                        break;
                    }
                    number = number * 10 + (c - '0');
                    if (number > Integer.MAX_VALUE) {
                        readDecimal(start, i);
                        break;
                    }
                    i++;
                }
                return;
            case CHAR_DOT:
                if (types[i] != CHAR_VALUE) {
                    currentTokenType = KEYWORD;
                    currentToken = ".";
                    parseIndex = i;
                    return;
                }
                readDecimal(i - 1, i);
                return;
            case CHAR_STRING: {
                String result = null;
                while (true) {
                    for (int begin = i;; i++) {
                        if (chars[i] == '\'') {
                            if (result == null) {
                                result = sqlCommand.substring(begin, i);
                            } else {
                                result += sqlCommand.substring(begin - 1, i);
                            }
                            break;
                        }
                    }
                    if (chars[++i] != '\'') {
                        break;
                    }
                    i++;
                }
                currentToken = "'";
                checkLiterals(true);
                currentValue = ValueString.get(StringUtils.fromCacheOrNew(result),
                        false);
                parseIndex = i;
                currentTokenType = VALUE;
                return;
            }
            case CHAR_DOLLAR_QUOTED_STRING: {
                String result = null;
                int begin = i - 1;
                while (types[i] == CHAR_DOLLAR_QUOTED_STRING) {
                    i++;
                }
                result = sqlCommand.substring(begin, i);
                currentToken = "'";
                checkLiterals(true);
                currentValue = ValueString.get(StringUtils.fromCacheOrNew(result),
                        false);
                parseIndex = i;
                currentTokenType = VALUE;
                return;
            }
            case CHAR_END:
                currentToken = "";
                currentTokenType = END;
                parseIndex = i;
                return;
            default:
                throw getSyntaxError();
        }
    }

}
