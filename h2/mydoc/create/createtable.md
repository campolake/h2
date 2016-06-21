###如何创建表

Connection conn = getConnection("initDb;");
Statement stat = conn.createStatement();
stat.executeUpdate("create table test(id int identity, name varchar);");


#1、

Parser parser = new Parser(this);
-Prepared parsePrepared()
调用init方法，解析出字符的类型，存储到type数组中，索引跟字符的索引相对应。类型分为
CommandContainer
Command.executeUpdate

创建表时，只保存元数据吗？如果表不存在时，是否需要开辟表空间？
索引和主键除了保存元数据，还需要做哪些操作。




