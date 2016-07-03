create table AIMS_PLC_POLICY
(
  actualid             NUMBER(19) not null,
  topactualid          NUMBER(19),
  parentactualid       NUMBER(19),
  replacedactualid     NUMBER(19),
  product_code         VARCHAR2(20),
  branch_code          VARCHAR2(7),
  customer_no          VARCHAR2(20),
  proposal_no          VARCHAR2(30),
  policy_no            VARCHAR2(30),
  application_no       VARCHAR2(30),
  endorsement_no       VARCHAR2(30),
  renewal_policy_no    VARCHAR2(30),
  handler_code         VARCHAR2(20),
  organization_code    VARCHAR2(255),
  intermediary_code    VARCHAR2(20),
  input_method         VARCHAR2(20),
  proposal_date        DATE,
  signing_date         DATE,
  start_date           DATE,
  start_time           VARCHAR2(10),
  effective_date       DATE,
  end_date             DATE,
  end_time             VARCHAR2(10),
  short_term_method    VARCHAR2(20),
  payment_method       VARCHAR2(10),
  issuer_code          VARCHAR2(20),
  development_method   VARCHAR2(20),
  selling_expense_rate NUMBER(6,2),
  dispute_resolution   VARCHAR2(20),
  arbitration          VARCHAR2(50),
  policy_status        VARCHAR2(20),
  underwriting_opcode  VARCHAR2(50),
  underwriting_opname  VARCHAR2(200),
  underwriting_time    DATE,
  jurisdiction         VARCHAR2(20),
  risk_type            VARCHAR2(20),
  special_risk         VARCHAR2(1),
  agricultural         VARCHAR2(1),
  special_business     VARCHAR2(1),
  cross_selling        VARCHAR2(1),
  pay_issuing          VARCHAR2(1),
  auto_underwriting    VARCHAR2(1),
  beneficiary_org      VARCHAR2(255),
  print_opname         VARCHAR2(200),
  print_time           DATE,
  issue_date           DATE,
  document_no          VARCHAR2(20),
  inputer              VARCHAR2(20),
  issue_deadline       DATE,
  apply_type           VARCHAR2(10),
  main_clause_code     VARCHAR2(30),
  related_transaction  VARCHAR2(1),
  create_time          DATE default SYSDATE,
  update_time          DATE default SYSDATE,
  request_date         DATE,
  autopolicy_flag      VARCHAR2(1),
  endorsement_type     VARCHAR2(20),
  product_version      VARCHAR2(20),
  belongnature         VARCHAR2(3),
  lifesalesman         VARCHAR2(20),
  midcompany           VARCHAR2(1),
  preinvoice           VARCHAR2(1),
  bancassurance        VARCHAR2(10),
  payment_date         DATE,
  bill_no              VARCHAR2(22),
  print_opcode         VARCHAR2(30),
  i09_payment_method   VARCHAR2(10),
  datasource           VARCHAR2(10),
  tax_effective_flag   VARCHAR2(1),
  invoicetype          VARCHAR2(10)
);

comment on table AIMS_PLC_POLICY
  is '事实-保单基本信息';
comment on column AIMS_PLC_POLICY.actualid
  is '事实id';
comment on column AIMS_PLC_POLICY.topactualid
  is '根节点';
comment on column AIMS_PLC_POLICY.parentactualid
  is '父节点';
comment on column AIMS_PLC_POLICY.replacedactualid
  is '被替换节点';
comment on column AIMS_PLC_POLICY.product_code
  is '产品代码；险种';
comment on column AIMS_PLC_POLICY.branch_code
  is '分公司代码(即二级机构代码)';
comment on column AIMS_PLC_POLICY.customer_no
  is '客户号(I09专用)';
comment on column AIMS_PLC_POLICY.proposal_no
  is '投保单号';
comment on column AIMS_PLC_POLICY.policy_no
  is '保单号';
comment on column AIMS_PLC_POLICY.application_no
  is '批单申请号';
comment on column AIMS_PLC_POLICY.endorsement_no
  is '批单号';
comment on column AIMS_PLC_POLICY.renewal_policy_no
  is '续保单号';
comment on column AIMS_PLC_POLICY.handler_code
  is '主经办人代码';
comment on column AIMS_PLC_POLICY.organization_code
  is '承保机构';
comment on column AIMS_PLC_POLICY.intermediary_code
  is '主中介代码';
comment on column AIMS_PLC_POLICY.input_method
  is '录入方式';
comment on column AIMS_PLC_POLICY.proposal_date
  is '投保日期(客户有意向投保的初次日期)';
comment on column AIMS_PLC_POLICY.signing_date
  is '签单日期';
comment on column AIMS_PLC_POLICY.start_date
  is '保险起期';
comment on column AIMS_PLC_POLICY.start_time
  is '起期时刻';
comment on column AIMS_PLC_POLICY.effective_date
  is '生效日期';
comment on column AIMS_PLC_POLICY.end_date
  is '保险止期';
comment on column AIMS_PLC_POLICY.end_time
  is '终止时刻';
comment on column AIMS_PLC_POLICY.short_term_method
  is '短期费率计算方法';
comment on column AIMS_PLC_POLICY.payment_method
  is '支付方式';
comment on column AIMS_PLC_POLICY.issuer_code
  is '出单点';
comment on column AIMS_PLC_POLICY.development_method
  is '展业方式';
comment on column AIMS_PLC_POLICY.selling_expense_rate
  is '业务销售费用率';
comment on column AIMS_PLC_POLICY.dispute_resolution
  is '争议解决方式';
comment on column AIMS_PLC_POLICY.arbitration
  is '仲裁机构';
comment on column AIMS_PLC_POLICY.policy_status
  is '保单状态：300400，初始状态；300401，暂存待提交；300402，提交待初审；300403，初审退回待修改；300404，初审通过待核保；300405，核保通过待支付；300406，核保重置待修改；300407，核保退回待修改；300408，核保拒绝；300409，已签发；300410，支付重置待修改；300411，已删除';
comment on column AIMS_PLC_POLICY.underwriting_opcode
  is '核保人（最新值）';
comment on column AIMS_PLC_POLICY.underwriting_opname
  is '核保人名称（最新值）';
comment on column AIMS_PLC_POLICY.underwriting_time
  is '核保时间';
comment on column AIMS_PLC_POLICY.jurisdiction
  is '司法管辖';
comment on column AIMS_PLC_POLICY.risk_type
  is '风险类别';
comment on column AIMS_PLC_POLICY.special_risk
  is '是否特险';
comment on column AIMS_PLC_POLICY.agricultural
  is '是否涉农';
comment on column AIMS_PLC_POLICY.special_business
  is '是否特殊业务';
comment on column AIMS_PLC_POLICY.cross_selling
  is '是否总对总交叉销售渠道';
comment on column AIMS_PLC_POLICY.pay_issuing
  is '是否见费出单';
comment on column AIMS_PLC_POLICY.auto_underwriting
  is '是否自动核保';
comment on column AIMS_PLC_POLICY.beneficiary_org
  is '受益金融机构';
comment on column AIMS_PLC_POLICY.print_opname
  is '打印人（最新值）';
comment on column AIMS_PLC_POLICY.print_time
  is '打印日期';
comment on column AIMS_PLC_POLICY.issue_date
  is '签发日期';
comment on column AIMS_PLC_POLICY.document_no
  is '单证号';
comment on column AIMS_PLC_POLICY.inputer
  is '录入员';
comment on column AIMS_PLC_POLICY.issue_deadline
  is '签发截止日期';
comment on column AIMS_PLC_POLICY.apply_type
  is '投保方式';
comment on column AIMS_PLC_POLICY.main_clause_code
  is '主条款代码';
comment on column AIMS_PLC_POLICY.related_transaction
  is '是否关联交易';
comment on column AIMS_PLC_POLICY.create_time
  is '创建时间';
comment on column AIMS_PLC_POLICY.update_time
  is '最后修改时间';
comment on column AIMS_PLC_POLICY.request_date
  is '批改日期';
comment on column AIMS_PLC_POLICY.autopolicy_flag
  is '判断是否需要走自动出单流程：0: 非共保、1: 共保自动出单的主单、2: 共保自动出单生成的跟单 3:共保份额调整的批单';
comment on column AIMS_PLC_POLICY.endorsement_type
  is '批改类型';
comment on column AIMS_PLC_POLICY.product_version
  is '产品版本';
comment on column AIMS_PLC_POLICY.belongnature
  is '所属业态';
comment on column AIMS_PLC_POLICY.lifesalesman
  is '寿险营销员代码';
comment on column AIMS_PLC_POLICY.midcompany
  is '中小企业客户';
comment on column AIMS_PLC_POLICY.preinvoice
  is '预开发票';
comment on column AIMS_PLC_POLICY.bancassurance
  is '银保项目';
comment on column AIMS_PLC_POLICY.payment_date
  is '付费日期';
comment on column AIMS_PLC_POLICY.bill_no
  is '打印单证号';
comment on column AIMS_PLC_POLICY.print_opcode
  is '打印人代码';
comment on column AIMS_PLC_POLICY.i09_payment_method
  is 'i09支付方式';
comment on column AIMS_PLC_POLICY.datasource
  is '数据来源';
comment on column AIMS_PLC_POLICY.tax_effective_flag
  is '是否营改增:0否(税送空),1是(税送0)';
create index IDX_AIMS_PLC_POLICY_01 on AIMS_PLC_POLICY (START_DATE, END_DATE)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_02 on AIMS_PLC_POLICY (CUSTOMER_NO, PROPOSAL_NO, POLICY_NO)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_03 on AIMS_PLC_POLICY (APPLICATION_NO, ENDORSEMENT_NO)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_04 on AIMS_PLC_POLICY (POLICY_STATUS, PAY_ISSUING)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_05 on AIMS_PLC_POLICY (TOPACTUALID)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_06 on AIMS_PLC_POLICY (REPLACEDACTUALID)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_07 on AIMS_PLC_POLICY (BRANCH_CODE)
  tablespace PCIS_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_08 on AIMS_PLC_POLICY (POLICY_NO)
  tablespace PCIS_IDX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_AIMS_PLC_POLICY_09 on AIMS_PLC_POLICY (MAIN_CLAUSE_CODE, ORGANIZATION_CODE)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AIMS_PLC_POLICY
  add constraint PK_AIMS_PLC_POLICY primary key (ACTUALID)
  using index 
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
  

  
  
  create table AIMS_PLC_APPLICANT
(
  actualid         NUMBER(19) not null,
  topactualid      NUMBER(19),
  parentactualid   NUMBER(19),
  replacedactualid NUMBER(19),
  applicant_code   VARCHAR2(22),
  applicant_name   VARCHAR2(500),
  blanket_customer VARCHAR2(1),
  vip_customer     VARCHAR2(1),
  blanket_code     VARCHAR2(20),
  vip_code         VARCHAR2(20),
  opportunity_no   VARCHAR2(20),
  applicant_type   VARCHAR2(10),
  certificate_type VARCHAR2(10),
  certificate_no   VARCHAR2(20),
  area             VARCHAR2(23),
  address          VARCHAR2(140),
  post_code        VARCHAR2(10),
  contact          VARCHAR2(200),
  telephone        VARCHAR2(20),
  mobile_phone     VARCHAR2(20),
  bank             VARCHAR2(100),
  bank_account     VARCHAR2(50),
  create_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
tablespace PCIS_TBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table AIMS_PLC_APPLICANT
  is '事实-投保人信息';
comment on column AIMS_PLC_APPLICANT.actualid
  is '事实id';
comment on column AIMS_PLC_APPLICANT.topactualid
  is '根节点';
comment on column AIMS_PLC_APPLICANT.parentactualid
  is '父节点';
comment on column AIMS_PLC_APPLICANT.replacedactualid
  is '被替换节点';
comment on column AIMS_PLC_APPLICANT.applicant_code
  is '投保人代码';
comment on column AIMS_PLC_APPLICANT.applicant_name
  is '投保人名称';
comment on column AIMS_PLC_APPLICANT.blanket_customer
  is '是否统保客户';
comment on column AIMS_PLC_APPLICANT.vip_customer
  is '是否重大客户';
comment on column AIMS_PLC_APPLICANT.blanket_code
  is '统保客户代码';
comment on column AIMS_PLC_APPLICANT.vip_code
  is '重大客户代码';
comment on column AIMS_PLC_APPLICANT.opportunity_no
  is '商机号';
comment on column AIMS_PLC_APPLICANT.applicant_type
  is '投保人类别';
comment on column AIMS_PLC_APPLICANT.certificate_type
  is '证件类型';
comment on column AIMS_PLC_APPLICANT.certificate_no
  is '证件号';
comment on column AIMS_PLC_APPLICANT.area
  is '区域';
comment on column AIMS_PLC_APPLICANT.address
  is '地址';
comment on column AIMS_PLC_APPLICANT.post_code
  is '邮政编码';
comment on column AIMS_PLC_APPLICANT.contact
  is '联系人';
comment on column AIMS_PLC_APPLICANT.telephone
  is '联系电话';
comment on column AIMS_PLC_APPLICANT.mobile_phone
  is '联系手机';
comment on column AIMS_PLC_APPLICANT.bank
  is '开户行';
comment on column AIMS_PLC_APPLICANT.bank_account
  is '银行账号';
comment on column AIMS_PLC_APPLICANT.create_time
  is '创建时间';
comment on column AIMS_PLC_APPLICANT.update_time
  is '最后修改时间';
create index IDX_AIMS_PLC_APPLICANT_01 on AIMS_PLC_APPLICANT (TOPACTUALID)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AIMS_PLC_APPLICANT
  add constraint PK_AIMS_PLC_APPLICANT primary key (ACTUALID)
  using index 
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


  
  
  
  
  create table AIMS_PLC_VIRTUAL_INSURED
(
  actualid         NUMBER(19) not null,
  topactualid      NUMBER(19),
  parentactualid   NUMBER(19),
  replacedactualid NUMBER(19),
  insured_code     VARCHAR2(22),
  insured_name     VARCHAR2(500),
  insured_type     VARCHAR2(10),
  certificate_type VARCHAR2(10),
  certificate_no   VARCHAR2(20),
  area             VARCHAR2(23),
  address          VARCHAR2(140),
  main_insured     VARCHAR2(1),
  group_insured    VARCHAR2(1),
  post_code        VARCHAR2(10),
  mobile_phone     VARCHAR2(20),
  bank             VARCHAR2(100),
  bank_account     VARCHAR2(50),
  units_insured    NUMBER(16,2),
  sum_insured      NUMBER(16,2),
  premium          NUMBER(16,2),
  print_opname     VARCHAR2(200),
  print_num        NUMBER(8),
  print_time       DATE,
  create_time      DATE default SYSDATE,
  update_time      DATE default SYSDATE
)
tablespace PCIS_TBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table AIMS_PLC_VIRTUAL_INSURED
  is '虚拟被保人';
comment on column AIMS_PLC_VIRTUAL_INSURED.actualid
  is '事实id';
comment on column AIMS_PLC_VIRTUAL_INSURED.topactualid
  is '根节点';
comment on column AIMS_PLC_VIRTUAL_INSURED.parentactualid
  is '父节点';
comment on column AIMS_PLC_VIRTUAL_INSURED.replacedactualid
  is '被替换节点';
comment on column AIMS_PLC_VIRTUAL_INSURED.insured_code
  is '被保险人代码';
comment on column AIMS_PLC_VIRTUAL_INSURED.insured_name
  is '被保险人名称';
comment on column AIMS_PLC_VIRTUAL_INSURED.insured_type
  is '被保险人类别';
comment on column AIMS_PLC_VIRTUAL_INSURED.certificate_type
  is '证件类型';
comment on column AIMS_PLC_VIRTUAL_INSURED.certificate_no
  is '证件号';
comment on column AIMS_PLC_VIRTUAL_INSURED.area
  is '区域';
comment on column AIMS_PLC_VIRTUAL_INSURED.address
  is '地址';
comment on column AIMS_PLC_VIRTUAL_INSURED.main_insured
  is '是否主被保险人';
comment on column AIMS_PLC_VIRTUAL_INSURED.group_insured
  is '是否集体被保险人';
comment on column AIMS_PLC_VIRTUAL_INSURED.post_code
  is '邮政编码';
comment on column AIMS_PLC_VIRTUAL_INSURED.mobile_phone
  is '联系手机';
comment on column AIMS_PLC_VIRTUAL_INSURED.bank
  is '开户行';
comment on column AIMS_PLC_VIRTUAL_INSURED.bank_account
  is '银行账号';
comment on column AIMS_PLC_VIRTUAL_INSURED.units_insured
  is '承保数量';
comment on column AIMS_PLC_VIRTUAL_INSURED.sum_insured
  is '保额';
comment on column AIMS_PLC_VIRTUAL_INSURED.premium
  is '保费';
comment on column AIMS_PLC_VIRTUAL_INSURED.print_opname
  is '打印人（最新值）';
comment on column AIMS_PLC_VIRTUAL_INSURED.print_num
  is '打印次数';
comment on column AIMS_PLC_VIRTUAL_INSURED.print_time
  is '打印日期';
comment on column AIMS_PLC_VIRTUAL_INSURED.create_time
  is '创建时间';
comment on column AIMS_PLC_VIRTUAL_INSURED.update_time
  is '最后修改时间';
create index IDX_AIMS_PLC_VIRTUAL_INSURED on AIMS_PLC_VIRTUAL_INSURED (TOPACTUALID, REPLACEDACTUALID)
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AIMS_PLC_VIRTUAL_INSURED
  add constraint PK_AIMS_PLC_VIRTUAL_INSURED primary key (ACTUALID)
  using index 
  tablespace PCIS_TBS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

  
  
  
  
  
   create table AIMS_PLC_INSURED
 (
   actualid               NUMBER(19) not null,
   topactualid            NUMBER(19),
   parentactualid         NUMBER(19),
   replacedactualid       NUMBER(19),
   insured_code           VARCHAR2(22),
   insured_name           VARCHAR2(500),
   insured_type           VARCHAR2(10),
   certificate_type       VARCHAR2(10),
   certificate_no         VARCHAR2(20),
   area                   VARCHAR2(23),
   address                VARCHAR2(140),
   main_insured           NUMBER(1),
   group_insured          VARCHAR2(1),
   post_code              VARCHAR2(10),
   mobile_phone           VARCHAR2(20),
   bank                   VARCHAR2(100),
   bank_account           VARCHAR2(50),
   units_insured          NUMBER(16,2),
   sum_insured            NUMBER(16,2),
   premium                NUMBER(16,2),
   print_opname           VARCHAR2(200),
   print_num              NUMBER(8),
   print_time             DATE,
   create_time            DATE default SYSDATE,
   update_time            DATE default SYSDATE,
   updatestatus           VARCHAR2(1),
   start_date             DATE,
   end_date               DATE,
   import_flag            NUMBER(1),
   affirm_flag            NUMBER(1) default 0,
   estimate_units_insured NUMBER(16,2) default 0
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_INSURED
   is '事实-被保险人信息';
 comment on column AIMS_PLC_INSURED.actualid
   is '事实id';
 comment on column AIMS_PLC_INSURED.topactualid
   is '根节点';
 comment on column AIMS_PLC_INSURED.parentactualid
   is '父节点';
 comment on column AIMS_PLC_INSURED.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_INSURED.insured_code
   is '被保险人代码';
 comment on column AIMS_PLC_INSURED.insured_name
   is '被保险人名称';
 comment on column AIMS_PLC_INSURED.insured_type
   is '被保险人类别';
 comment on column AIMS_PLC_INSURED.certificate_type
   is '证件类型';
 comment on column AIMS_PLC_INSURED.certificate_no
   is '证件号';
 comment on column AIMS_PLC_INSURED.area
   is '区域';
 comment on column AIMS_PLC_INSURED.address
   is '地址';
 comment on column AIMS_PLC_INSURED.main_insured
   is '是否主被保险人';
 comment on column AIMS_PLC_INSURED.group_insured
   is '是否集体被保险人';
 comment on column AIMS_PLC_INSURED.post_code
   is '邮政编码';
 comment on column AIMS_PLC_INSURED.mobile_phone
   is '联系手机';
 comment on column AIMS_PLC_INSURED.bank
   is '开户行';
 comment on column AIMS_PLC_INSURED.bank_account
   is '银行账号';
 comment on column AIMS_PLC_INSURED.units_insured
   is '承保数量';
 comment on column AIMS_PLC_INSURED.sum_insured
   is '保额';
 comment on column AIMS_PLC_INSURED.premium
   is '保费';
 comment on column AIMS_PLC_INSURED.print_opname
   is '打印人（最新值）';
 comment on column AIMS_PLC_INSURED.print_num
   is '打印次数';
 comment on column AIMS_PLC_INSURED.print_time
   is '打印日期';
 comment on column AIMS_PLC_INSURED.create_time
   is '创建时间';
 comment on column AIMS_PLC_INSURED.update_time
   is '最后修改时间';
 comment on column AIMS_PLC_INSURED.updatestatus
   is '修改状态:1新增2修改3作废';
 comment on column AIMS_PLC_INSURED.start_date
   is '保险起期';
 comment on column AIMS_PLC_INSURED.end_date
   is '保险止期';
 comment on column AIMS_PLC_INSURED.import_flag
   is '是否是后台清单导入标识 。0前台录入或修改，1清单导入';
 comment on column AIMS_PLC_INSURED.affirm_flag
   is '清单数据确认状态 默认为0';
 create index IDX_AIMS_PLC_INSURED_01 on AIMS_PLC_INSURED (TOPACTUALID)
   tablespace PCIS_IDX
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_INSURED_02 on AIMS_PLC_INSURED (REPLACEDACTUALID)
   tablespace PCIS_IDX
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_INSURED_03 on AIMS_PLC_INSURED (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_INSURED_04 on AIMS_PLC_INSURED (PARENTACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_INSURED_05 on AIMS_PLC_INSURED (CERTIFICATE_NO)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_INSURED_06 on AIMS_PLC_INSURED (INSURED_NAME)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_INSURED
   add constraint PK_AIMS_PLC_INSURED primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 
 
 
  create table AIMS_PLC_AGRI_SUBJECT
 (
   actualid                    NUMBER(19) not null,
   topactualid                 NUMBER(19),
   parentactualid              NUMBER(19),
   replacedactualid            NUMBER(19),
   plan_serial_no              NUMBER(6),
   mark_code                   VARCHAR2(100),
   units_insured               NUMBER(16,2),
   units_insured_chg           NUMBER(16,2),
   age                         NUMBER(5),
   area                        VARCHAR2(23),
   address                     VARCHAR2(200),
   longitude                   NUMBER(16,5),
   latitude                    NUMBER(16,5),
   memo                        VARCHAR2(2000),
   start_date                  DATE,
   end_date                    DATE,
   create_time                 DATE default SYSDATE,
   update_time                 DATE default SYSDATE,
   updatestatus                VARCHAR2(1),
   import_flag                 NUMBER(1),
   forest_right_certificate_no VARCHAR2(500),
   affirm_flag                 NUMBER(1) default 0,
   age_lower                   NUMBER(5),
   age_upper                   NUMBER(5),
   product_type                VARCHAR2(30),
   power                       VARCHAR2(30),
   dimensions                  VARCHAR2(30),
   purchase_price              NUMBER(16,2),
   permitted_weight            NUMBER(16,2),
   agricultural_subsidy_sum    NUMBER(16,2),
   agricultural_subsidy_agency VARCHAR2(255),
   production_date             DATE,
   engine_no                   VARCHAR2(30),
   mark_name                   VARCHAR2(200),
   mark_type                   VARCHAR2(10),
   end_longitude               NUMBER(16,5),
   end_latitude                NUMBER(16,5),
   birth_times                 VARCHAR2(10),
   kinds                       VARCHAR2(50)
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_AGRI_SUBJECT
   is '农业险标的物清单';
 comment on column AIMS_PLC_AGRI_SUBJECT.actualid
   is '事实id';
 comment on column AIMS_PLC_AGRI_SUBJECT.topactualid
   is '根节点';
 comment on column AIMS_PLC_AGRI_SUBJECT.parentactualid
   is '父节点';
 comment on column AIMS_PLC_AGRI_SUBJECT.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_AGRI_SUBJECT.plan_serial_no
   is '计划序号';
 comment on column AIMS_PLC_AGRI_SUBJECT.mark_code
   is '标的识别码 ：地块号/耳标号';
 comment on column AIMS_PLC_AGRI_SUBJECT.units_insured
   is '承保数量';
 comment on column AIMS_PLC_AGRI_SUBJECT.units_insured_chg
   is '数量变化值';
 comment on column AIMS_PLC_AGRI_SUBJECT.age
   is '年龄（树龄、畜龄）';
 comment on column AIMS_PLC_AGRI_SUBJECT.area
   is '标的所在区域';
 comment on column AIMS_PLC_AGRI_SUBJECT.address
   is '标的所在地址';
 comment on column AIMS_PLC_AGRI_SUBJECT.longitude
   is '经度';
 comment on column AIMS_PLC_AGRI_SUBJECT.latitude
   is '纬度';
 comment on column AIMS_PLC_AGRI_SUBJECT.memo
   is '备注';
 comment on column AIMS_PLC_AGRI_SUBJECT.start_date
   is '保险起期';
 comment on column AIMS_PLC_AGRI_SUBJECT.end_date
   is '保险止期';
 comment on column AIMS_PLC_AGRI_SUBJECT.create_time
   is '创建时间';
 comment on column AIMS_PLC_AGRI_SUBJECT.update_time
   is '最后修改时间';
 comment on column AIMS_PLC_AGRI_SUBJECT.updatestatus
   is '修改状态:1新增2修改3作废';
 comment on column AIMS_PLC_AGRI_SUBJECT.import_flag
   is '是否后台清单导入标识。0前台导入或修改，1后台清单导入';
 comment on column AIMS_PLC_AGRI_SUBJECT.forest_right_certificate_no
   is '林权证号';
 comment on column AIMS_PLC_AGRI_SUBJECT.affirm_flag
   is '清单数据确认状态';
 comment on column AIMS_PLC_AGRI_SUBJECT.age_lower
   is '树龄下限';
 comment on column AIMS_PLC_AGRI_SUBJECT.age_upper
   is '树龄上限';
 comment on column AIMS_PLC_AGRI_SUBJECT.product_type
   is '产品型号';
 comment on column AIMS_PLC_AGRI_SUBJECT.power
   is '动力/功率';
 comment on column AIMS_PLC_AGRI_SUBJECT.dimensions
   is '外形尺寸(长宽高)';
 comment on column AIMS_PLC_AGRI_SUBJECT.purchase_price
   is '购置价值';
 comment on column AIMS_PLC_AGRI_SUBJECT.permitted_weight
   is '核定载质量(kg)';
 comment on column AIMS_PLC_AGRI_SUBJECT.agricultural_subsidy_sum
   is '农机补贴金额';
 comment on column AIMS_PLC_AGRI_SUBJECT.agricultural_subsidy_agency
   is '农机补贴机构';
 comment on column AIMS_PLC_AGRI_SUBJECT.production_date
   is '出厂日期';
 comment on column AIMS_PLC_AGRI_SUBJECT.engine_no
   is '发动机号';
 comment on column AIMS_PLC_AGRI_SUBJECT.mark_name
   is '地块俗称';
 comment on column AIMS_PLC_AGRI_SUBJECT.mark_type
   is '地块类型';
 comment on column AIMS_PLC_AGRI_SUBJECT.end_longitude
   is '终止经度';
 comment on column AIMS_PLC_AGRI_SUBJECT.end_latitude
   is '终止纬度';
 comment on column AIMS_PLC_AGRI_SUBJECT.birth_times
   is '胎次（奶牛）';
 comment on column AIMS_PLC_AGRI_SUBJECT.kinds
   is '品种';
 create index IDX_AIMS_PLC_AGRI_SUBJECT_01 on AIMS_PLC_AGRI_SUBJECT (TOPACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_AGRI_SUBJECT_02 on AIMS_PLC_AGRI_SUBJECT (REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_AGRI_SUBJECT_03 on AIMS_PLC_AGRI_SUBJECT (PARENTACTUALID)
   tablespace PCIS_IDX
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_AGRI_SUBJECT_04 on AIMS_PLC_AGRI_SUBJECT (MARK_CODE)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_AGRI_SUBJECT
   add constraint PK_AIMS_PLC_AGRI_SUBJECT primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 
 
 
 
 
 
  create table AIMS_PLC_BUSINESS_HANDLER
 (
   actualid         NUMBER(19) not null,
   topactualid      NUMBER(19),
   parentactualid   NUMBER(19),
   replacedactualid NUMBER(19),
   handler_code     VARCHAR2(8),
   handler_name     VARCHAR2(200),
   license_no       VARCHAR2(50),
   branch_code      VARCHAR2(7),
   business_percent NUMBER(6,4),
   main_handler     NUMBER(1),
   salesman         NUMBER(1),
   org_code         VARCHAR2(50),
   create_time      DATE default SYSDATE,
   update_time      DATE default SYSDATE
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_BUSINESS_HANDLER
   is '事实-经办人';
 comment on column AIMS_PLC_BUSINESS_HANDLER.actualid
   is '事实id';
 comment on column AIMS_PLC_BUSINESS_HANDLER.topactualid
   is '根节点';
 comment on column AIMS_PLC_BUSINESS_HANDLER.parentactualid
   is '父节点';
 comment on column AIMS_PLC_BUSINESS_HANDLER.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_BUSINESS_HANDLER.handler_code
   is '经办人代码';
 comment on column AIMS_PLC_BUSINESS_HANDLER.handler_name
   is '经办人名称';
 comment on column AIMS_PLC_BUSINESS_HANDLER.license_no
   is '执业证号';
 comment on column AIMS_PLC_BUSINESS_HANDLER.branch_code
   is '经办人所在公司';
 comment on column AIMS_PLC_BUSINESS_HANDLER.business_percent
   is '展业比例';
 comment on column AIMS_PLC_BUSINESS_HANDLER.main_handler
   is '是否主经办人';
 comment on column AIMS_PLC_BUSINESS_HANDLER.salesman
   is '是否销售人员';
 comment on column AIMS_PLC_BUSINESS_HANDLER.org_code
   is '所属机构代码';
 comment on column AIMS_PLC_BUSINESS_HANDLER.create_time
   is '创建时间';
 comment on column AIMS_PLC_BUSINESS_HANDLER.update_time
   is '最后修改时间';
 create index IDX_AIMS_BUSINESS_HANDLER_01 on AIMS_PLC_BUSINESS_HANDLER (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_BUSINESS_HANDLER
   add constraint PK_AIMS_PLC_BUSINESS_HANDLER primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
   
   
   
   
   
   
  create table AIMS_PLC_SPECIAL_CLAUSE
 (
   actualid         NUMBER(19) not null,
   topactualid      NUMBER(19),
   parentactualid   NUMBER(19),
   replacedactualid NUMBER(19),
   insurance_code   VARCHAR2(8),
   comments         VARCHAR2(2000),
   create_time      DATE default SYSDATE,
   update_time      DATE default SYSDATE,
   spe_clause_code  VARCHAR2(32)
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_SPECIAL_CLAUSE
   is '事实-特别约定';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.actualid
   is '事实id';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.topactualid
   is '根节点';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.parentactualid
   is '父节点';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.insurance_code
   is '险种';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.comments
   is '备注';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.create_time
   is '创建时间';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.update_time
   is '最后修改时间';
 comment on column AIMS_PLC_SPECIAL_CLAUSE.spe_clause_code
   is '特别约定代码';
 create index IDX_AIMS_SPECIAL_CLAUSE_01 on AIMS_PLC_SPECIAL_CLAUSE (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_SPECIAL_CLAUSE
   add constraint PK_AIMS_SPECIAL_CLAUSE primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 

 
 
  create table AIMS_PLC_POLICY_PREMIUM
 (
   actualid          NUMBER(19) not null,
   topactualid       NUMBER(19),
   parentactualid    NUMBER(19),
   replacedactualid  NUMBER(19),
   currency_code     VARCHAR2(20),
   rmb_exchange_rate NUMBER(12,6),
   sum_insured       NUMBER(16,2),
   sum_insured_chg   NUMBER(16,2),
   premium           NUMBER(16,2),
   premium_chg       NUMBER(16,2),
   original_premium  NUMBER(16,2),
   installment       NUMBER(5),
   create_time       DATE default SYSDATE,
   update_time       DATE default SYSDATE
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_POLICY_PREMIUM
   is '事实-保费信息';
 comment on column AIMS_PLC_POLICY_PREMIUM.actualid
   is '事实id';
 comment on column AIMS_PLC_POLICY_PREMIUM.topactualid
   is '根节点';
 comment on column AIMS_PLC_POLICY_PREMIUM.parentactualid
   is '父节点';
 comment on column AIMS_PLC_POLICY_PREMIUM.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_POLICY_PREMIUM.currency_code
   is '币种';
 comment on column AIMS_PLC_POLICY_PREMIUM.rmb_exchange_rate
   is '折人民币汇率';
 comment on column AIMS_PLC_POLICY_PREMIUM.sum_insured
   is '保单保额/保单限额';
 comment on column AIMS_PLC_POLICY_PREMIUM.sum_insured_chg
   is '保单保额变化值/保单限额变化值';
 comment on column AIMS_PLC_POLICY_PREMIUM.premium
   is '保单保费';
 comment on column AIMS_PLC_POLICY_PREMIUM.premium_chg
   is '保单保费变化值';
 comment on column AIMS_PLC_POLICY_PREMIUM.original_premium
   is '原保费';
 comment on column AIMS_PLC_POLICY_PREMIUM.installment
   is '分期交费次数';
 comment on column AIMS_PLC_POLICY_PREMIUM.create_time
   is '创建时间';
 comment on column AIMS_PLC_POLICY_PREMIUM.update_time
   is '最后修改时间';
 create index IDX_AIMS_POLICY_PREMIUM_01 on AIMS_PLC_POLICY_PREMIUM (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_POLICY_PREMIUM
   add constraint PK_AIMS_PLC_POLICY_PREMIUM primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 
 
 
  create table AIMS_PLC_PAYMENT_SCHEDULE
 (
   actualid         NUMBER(19) not null,
   topactualid      NUMBER(19),
   parentactualid   NUMBER(19),
   replacedactualid NUMBER(19),
   serial_no        NUMBER(5),
   payment_date     DATE,
   payment_percent  NUMBER(6,4),
   payment_premium  NUMBER(16,2),
   currency_code    VARCHAR2(20),
   pay_status       VARCHAR2(1),
   create_time      DATE default SYSDATE,
   update_time      DATE default SYSDATE
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_PAYMENT_SCHEDULE
   is '事实-缴费计划';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.actualid
   is '事实id';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.topactualid
   is '根节点';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.parentactualid
   is '父节点';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.serial_no
   is '序号';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.payment_date
   is '计划缴费日期';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.payment_percent
   is '缴费比例';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.payment_premium
   is '计划缴费金额';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.currency_code
   is '币种代码';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.pay_status
   is '支付状态:1 已支付 2 未支付';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.create_time
   is '创建时间';
 comment on column AIMS_PLC_PAYMENT_SCHEDULE.update_time
   is '最后修改时间';
 create index IDX_AIMS_PAYMENT_SCHEDULE_01 on AIMS_PLC_PAYMENT_SCHEDULE (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_PAYMENT_SCHEDULE
   add constraint PK_AIMS_PLC_PAYMENT_SCHEDULE primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 
 
 

  create table AIMS_PLC_AUDIT
 (
   actualid                 NUMBER(19) not null,
   topactualid              NUMBER(19),
   parentactualid           NUMBER(19),
   replacedactualid         NUMBER(19),
   faculative_flag          NUMBER(1),
   facultative_requirement  VARCHAR2(4000),
   reinsurance_flag         NUMBER(1),
   reinsurance_type         VARCHAR2(6),
   rein_treaty_no           VARCHAR2(30),
   rein_facultative_demand  VARCHAR2(4000),
   coinsurance_flag         NUMBER(1),
   coin_treaty_no           VARCHAR2(30),
   coin_external_policy_no  VARCHAR2(30),
   subject_verfier          VARCHAR2(250),
   create_time              DATE default SYSDATE,
   update_time              DATE default SYSDATE,
   non_local                NUMBER(1),
   subject_verfication_flag VARCHAR2(10),
   abroa_flag               NUMBER(1),
   rawmaterial              VARCHAR2(200),
   majorproduct             VARCHAR2(200),
   productflow              VARCHAR2(500),
   profitlossadded          VARCHAR2(1),
   fullinsurance            VARCHAR2(1),
   settledcases             NUMBER(8),
   pendingcases             NUMBER(8),
   premiumpaidoff           VARCHAR2(1),
   thryearsaverecrate       NUMBER(6,2),
   underwriteingright       VARCHAR2(20),
   urgent                   VARCHAR2(1),
   noclaimrefund            NUMBER(5,2),
   amount                   NUMBER(16,2),
   currencycode             VARCHAR2(20),
   grossrate                NUMBER(9,6),
   netrate                  NUMBER(9,6),
   retentionselection       VARCHAR2(3),
   retentionratio           NUMBER(6,2),
   retentionamount          NUMBER(16,2),
   retentioncurrencycode    VARCHAR2(3),
   highrisk                 VARCHAR2(1),
   faculative               VARCHAR2(1),
   reinsuranceadvice        VARCHAR2(200),
   proportion               NUMBER(5,2),
   ifsurvey                 VARCHAR2(1),
   surveyor                 VARCHAR2(50),
   allotback                VARCHAR2(1),
   comments                 VARCHAR2(240),
   riskcustomer             VARCHAR2(1),
   sampl_flag               NUMBER(1),
   sys_agreement_flag       NUMBER(1),
   operation_mode           VARCHAR2(1),
   inform                   VARCHAR2(1),
   inform_detail            VARCHAR2(2000)
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 16K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on column AIMS_PLC_AUDIT.reinsurance_flag
   is '是否分保';
 comment on column AIMS_PLC_AUDIT.reinsurance_type
   is '分保类型：01临时分保facultative，02合约分保treaty';
 comment on column AIMS_PLC_AUDIT.rein_treaty_no
   is '合约分保协议号';
 comment on column AIMS_PLC_AUDIT.rein_facultative_demand
   is '临时分保要求';
 comment on column AIMS_PLC_AUDIT.coinsurance_flag
   is '是否共保';
 comment on column AIMS_PLC_AUDIT.coin_treaty_no
   is '共保协议号';
 comment on column AIMS_PLC_AUDIT.coin_external_policy_no
   is '司外主共保单号';
 comment on column AIMS_PLC_AUDIT.subject_verfier
   is '验标人';
 comment on column AIMS_PLC_AUDIT.non_local
   is '是否一地承保';
 comment on column AIMS_PLC_AUDIT.subject_verfication_flag
   is '是否已验标';
 comment on column AIMS_PLC_AUDIT.abroa_flag
   is '是否境外业务';
 comment on column AIMS_PLC_AUDIT.rawmaterial
   is '主要原材料';
 comment on column AIMS_PLC_AUDIT.majorproduct
   is '主要产品或商品';
 comment on column AIMS_PLC_AUDIT.productflow
   is '生产流程';
 comment on column AIMS_PLC_AUDIT.profitlossadded
   is '是否附加利损';
 comment on column AIMS_PLC_AUDIT.fullinsurance
   is '是否足额投保';
 comment on column AIMS_PLC_AUDIT.settledcases
   is '已决赔案件数';
 comment on column AIMS_PLC_AUDIT.pendingcases
   is '未决赔案件数';
 comment on column AIMS_PLC_AUDIT.premiumpaidoff
   is '上一年度保费是否付清';
 comment on column AIMS_PLC_AUDIT.thryearsaverecrate
   is '三年赔付平均赔付率';
 comment on column AIMS_PLC_AUDIT.underwriteingright
   is '核保权限';
 comment on column AIMS_PLC_AUDIT.urgent
   is '急件标记';
 comment on column AIMS_PLC_AUDIT.noclaimrefund
   is '无赔款退费';
 comment on column AIMS_PLC_AUDIT.amount
   is '赔付金额';
 comment on column AIMS_PLC_AUDIT.currencycode
   is '币种代码';
 comment on column AIMS_PLC_AUDIT.grossrate
   is '毛费率';
 comment on column AIMS_PLC_AUDIT.netrate
   is '净费率';
 comment on column AIMS_PLC_AUDIT.retentionselection
   is '自留选择';
 comment on column AIMS_PLC_AUDIT.retentionratio
   is '自留比例';
 comment on column AIMS_PLC_AUDIT.retentionamount
   is '自留额';
 comment on column AIMS_PLC_AUDIT.retentioncurrencycode
   is '自留额币种';
 comment on column AIMS_PLC_AUDIT.highrisk
   is '是否属大保额高风险业务';
 comment on column AIMS_PLC_AUDIT.faculative
   is '是否临分';
 comment on column AIMS_PLC_AUDIT.reinsuranceadvice
   is '分保建议';
 comment on column AIMS_PLC_AUDIT.proportion
   is '成数分保';
 comment on column AIMS_PLC_AUDIT.ifsurvey
   is '是否已查勘';
 comment on column AIMS_PLC_AUDIT.surveyor
   is '查勘人';
 comment on column AIMS_PLC_AUDIT.allotback
   is '回分要求';
 comment on column AIMS_PLC_AUDIT.comments
   is '特殊业务注解';
 comment on column AIMS_PLC_AUDIT.riskcustomer
   is '是否风险客户：0否；1是。默认为否';
 comment on column AIMS_PLC_AUDIT.sampl_flag
   is '是否抽取送总公司核保，0为否，1为是';
 comment on column AIMS_PLC_AUDIT.sys_agreement_flag
   is '是否系统审批的共保协议号';
 comment on column AIMS_PLC_AUDIT.operation_mode
   is '经营模式';
 comment on column AIMS_PLC_AUDIT.inform
   is '核保规则是否告知';
 comment on column AIMS_PLC_AUDIT.inform_detail
   is '核保规则是否告知，问题明细';
 create index IDX_AIMS_PLC_AUDIT_BAK_01 on AIMS_PLC_AUDIT (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_AUDIT
   add constraint PK_AIMS_PLC_AUDIT_INFO_BAK primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
  create table AIMS_PLC_SUBJECT_LOCATION
 (
   actualid          NUMBER(19) not null,
   topactualid       NUMBER(19),
   parentactualid    NUMBER(19),
   replacedactualid  NUMBER(19),
   address_type      VARCHAR2(3),
   area              VARCHAR2(23),
   insured_name      VARCHAR2(500),
   post_code         VARCHAR2(20),
   address           VARCHAR2(200),
   longitude         NUMBER(16,5),
   latitude          NUMBER(16,5),
   breeding_no       VARCHAR2(50),
   breeding_num      NUMBER(16,2),
   main_address_flag NUMBER(1),
   create_time       DATE default SYSDATE,
   update_time       DATE default SYSDATE,
   profession        VARCHAR2(40),
   quantity          NUMBER(8),
   quantity_chg      NUMBER(8),
   month_salary      NUMBER(16,2),
   salary_chg        NUMBER(16,2),
   total_salary      NUMBER(16,2),
   salary_currency   VARCHAR2(6),
   comments          VARCHAR2(100),
   end_longitude     NUMBER(16,5),
   end_latitude      NUMBER(16,5),
   objectname        VARCHAR2(255),
   accounttype       VARCHAR2(255)
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_SUBJECT_LOCATION
   is '标的位置';
 comment on column AIMS_PLC_SUBJECT_LOCATION.actualid
   is '事实id';
 comment on column AIMS_PLC_SUBJECT_LOCATION.topactualid
   is '根节点';
 comment on column AIMS_PLC_SUBJECT_LOCATION.parentactualid
   is '父节点';
 comment on column AIMS_PLC_SUBJECT_LOCATION.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_SUBJECT_LOCATION.address_type
   is '地址类型（001：保单地址，002：标的地址）';
 comment on column AIMS_PLC_SUBJECT_LOCATION.area
   is '区域';
 comment on column AIMS_PLC_SUBJECT_LOCATION.insured_name
   is '被保险人名称';
 comment on column AIMS_PLC_SUBJECT_LOCATION.post_code
   is '邮编';
 comment on column AIMS_PLC_SUBJECT_LOCATION.address
   is '具体地址';
 comment on column AIMS_PLC_SUBJECT_LOCATION.longitude
   is '经度';
 comment on column AIMS_PLC_SUBJECT_LOCATION.latitude
   is '纬度';
 comment on column AIMS_PLC_SUBJECT_LOCATION.breeding_no
   is '养殖证号';
 comment on column AIMS_PLC_SUBJECT_LOCATION.breeding_num
   is '养殖数量';
 comment on column AIMS_PLC_SUBJECT_LOCATION.main_address_flag
   is '是否主地址';
 comment on column AIMS_PLC_SUBJECT_LOCATION.create_time
   is '创建时间';
 comment on column AIMS_PLC_SUBJECT_LOCATION.update_time
   is '最后修改时间';
 comment on column AIMS_PLC_SUBJECT_LOCATION.profession
   is '工种';
 comment on column AIMS_PLC_SUBJECT_LOCATION.quantity
   is '人数';
 comment on column AIMS_PLC_SUBJECT_LOCATION.quantity_chg
   is '人数变化值';
 comment on column AIMS_PLC_SUBJECT_LOCATION.month_salary
   is '月工资';
 comment on column AIMS_PLC_SUBJECT_LOCATION.salary_chg
   is '(月工资/人)变化值';
 comment on column AIMS_PLC_SUBJECT_LOCATION.total_salary
   is '总工资';
 comment on column AIMS_PLC_SUBJECT_LOCATION.salary_currency
   is '工资币种';
 comment on column AIMS_PLC_SUBJECT_LOCATION.comments
   is '备注';
 comment on column AIMS_PLC_SUBJECT_LOCATION.end_longitude
   is '终止经度';
 comment on column AIMS_PLC_SUBJECT_LOCATION.end_latitude
   is '终止纬度';
 comment on column AIMS_PLC_SUBJECT_LOCATION.objectname
   is '开户机构';
 comment on column AIMS_PLC_SUBJECT_LOCATION.accounttype
   is '账户类型:001	存折账户	002	银行卡账户	003	手机银行账户	004	网上银行账户	005	第三方支付账户	006	微信银行	';
 create index IDX_AIMS_SUBJECT_LOCATION_01 on AIMS_PLC_SUBJECT_LOCATION (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_SUBJECT_LOCATION
   add constraint PK_AIMS_PLC_SUBJECT_LOCATION primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 
 
 
 
  create table AIMS_PLC_AGRI_POLICY
 (
   actualid                 NUMBER(19) not null,
   topactualid              NUMBER(19),
   parentactualid           NUMBER(19),
   replacedactualid         NUMBER(19),
   farm_num                 NUMBER(10),
   farm_num_chg             NUMBER(10),
   unit                     VARCHAR2(10),
   unit_cost                NUMBER(16,2),
   unit_weight              NUMBER(16,2),
   unit_price               NUMBER(16,2),
   applicat_divide          NUMBER(16,2),
   breed_method             VARCHAR2(30),
   average_density          VARCHAR2(30),
   forest_species           VARCHAR2(30),
   management_model         VARCHAR2(30),
   data_basis               VARCHAR2(200),
   responsibility_point     VARCHAR2(1024),
   insured_agreed_price     NUMBER(16,2),
   annual_pig_benchmark     VARCHAR2(30),
   extended_period          VARCHAR2(30),
   slaughter_batches        VARCHAR2(30),
   create_time              DATE default SYSDATE,
   update_time              DATE default SYSDATE,
   each_slaughter_batch_num NUMBER(19),
   picking_day              DATE,
   machine_type             VARCHAR2(100),
   daily_temperature        VARCHAR2(20),
   station_preferred        VARCHAR2(100),
   station_bak              VARCHAR2(100),
   town_type                VARCHAR2(10),
   machine_actual_price     NUMBER(16,2),
   licese_no                VARCHAR2(30)
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_AGRI_POLICY
   is '农业险特性信息表';
 comment on column AIMS_PLC_AGRI_POLICY.actualid
   is '事实id';
 comment on column AIMS_PLC_AGRI_POLICY.topactualid
   is '根节点';
 comment on column AIMS_PLC_AGRI_POLICY.parentactualid
   is '父节点';
 comment on column AIMS_PLC_AGRI_POLICY.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_AGRI_POLICY.farm_num
   is '农户数';
 comment on column AIMS_PLC_AGRI_POLICY.farm_num_chg
   is '人数变化值';
 comment on column AIMS_PLC_AGRI_POLICY.unit
   is '单位';
 comment on column AIMS_PLC_AGRI_POLICY.unit_cost
   is '单位生产成本（元）';
 comment on column AIMS_PLC_AGRI_POLICY.unit_weight
   is '单位保险产量（公斤）；单位约定重量（KG）';
 comment on column AIMS_PLC_AGRI_POLICY.unit_price
   is '约定单价（元/公斤）';
 comment on column AIMS_PLC_AGRI_POLICY.applicat_divide
   is '投保成数（%）';
 comment on column AIMS_PLC_AGRI_POLICY.breed_method
   is '养殖方式养殖方式';
 comment on column AIMS_PLC_AGRI_POLICY.average_density
   is '平均密度（株/亩）';
 comment on column AIMS_PLC_AGRI_POLICY.forest_species
   is '保险林木种类';
 comment on column AIMS_PLC_AGRI_POLICY.management_model
   is '经营模式';
 comment on column AIMS_PLC_AGRI_POLICY.data_basis
   is '数据采集依据';
 comment on column AIMS_PLC_AGRI_POLICY.responsibility_point
   is '责任触发点';
 comment on column AIMS_PLC_AGRI_POLICY.insured_agreed_price
   is '约定投保价格（元）';
 comment on column AIMS_PLC_AGRI_POLICY.annual_pig_benchmark
   is '年度猪粮比调整基准';
 comment on column AIMS_PLC_AGRI_POLICY.extended_period
   is '观察期/延展期';
 comment on column AIMS_PLC_AGRI_POLICY.slaughter_batches
   is '出栏批次';
 comment on column AIMS_PLC_AGRI_POLICY.create_time
   is '创建时间';
 comment on column AIMS_PLC_AGRI_POLICY.update_time
   is '最后修改时间';
 comment on column AIMS_PLC_AGRI_POLICY.each_slaughter_batch_num
   is '每批次出栏数量';
 comment on column AIMS_PLC_AGRI_POLICY.picking_day
   is '开采日';
 comment on column AIMS_PLC_AGRI_POLICY.machine_type
   is '农业机械类型';
 comment on column AIMS_PLC_AGRI_POLICY.daily_temperature
   is ' 触发日均温度（℃）';
 comment on column AIMS_PLC_AGRI_POLICY.station_preferred
   is ' 首选气象台站名称及编号';
 comment on column AIMS_PLC_AGRI_POLICY.station_bak
   is ' 备选气象台站名称及编号';
 comment on column AIMS_PLC_AGRI_POLICY.town_type
   is '农村乡镇财产险类型';
 comment on column AIMS_PLC_AGRI_POLICY.machine_actual_price
   is '农业机械实际价值';
 comment on column AIMS_PLC_AGRI_POLICY.licese_no
   is '农业机械_号码号牌';
 create index IDX_AIMS_AGRI_POLICY_01 on AIMS_PLC_AGRI_POLICY (TOPACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_AGRI_POLICY
   add constraint PK_AIMS_PLC_AGRI_POLICY primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 
 
 
  create table AIMS_PLC_COVERAGE_PLAN
 (
   actualid         NUMBER(19) not null,
   topactualid      NUMBER(19),
   parentactualid   NUMBER(19),
   replacedactualid NUMBER(19),
   plan_serial_no   NUMBER(6),
   name             VARCHAR2(500),
   description      VARCHAR2(1000),
   quantity         NUMBER(16,2),
   quantity_chg     NUMBER(16,2),
   create_time      DATE default SYSDATE,
   update_time      DATE default SYSDATE
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_COVERAGE_PLAN
   is '保险责任计划';
 comment on column AIMS_PLC_COVERAGE_PLAN.actualid
   is '事实id';
 comment on column AIMS_PLC_COVERAGE_PLAN.topactualid
   is '根节点';
 comment on column AIMS_PLC_COVERAGE_PLAN.parentactualid
   is '父节点';
 comment on column AIMS_PLC_COVERAGE_PLAN.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_COVERAGE_PLAN.plan_serial_no
   is '计划序号';
 comment on column AIMS_PLC_COVERAGE_PLAN.name
   is '计划名称';
 comment on column AIMS_PLC_COVERAGE_PLAN.description
   is '计划详解';
 comment on column AIMS_PLC_COVERAGE_PLAN.quantity
   is '数量';
 comment on column AIMS_PLC_COVERAGE_PLAN.quantity_chg
   is '数量变化值';
 comment on column AIMS_PLC_COVERAGE_PLAN.create_time
   is '创建时间';
 comment on column AIMS_PLC_COVERAGE_PLAN.update_time
   is '最后修改时间';
 create index IDX_AIMS_PLC_COVERAGE_PLAN_01 on AIMS_PLC_COVERAGE_PLAN (TOPACTUALID)
   tablespace PCIS_IDX
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_COVERAGE_PLAN
   add constraint PK_AIMS_PLC_COVERAGE_PLAN primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 
 
 
 
  create table AIMS_PLC_COVERAGE
 (
   actualid                  NUMBER(19) not null,
   topactualid               NUMBER(19),
   parentactualid            NUMBER(19),
   replacedactualid          NUMBER(19),
   subject_code              VARCHAR2(20),
   subject_name              VARCHAR2(560),
   insured_value_mode        VARCHAR2(30),
   sum_insured_mode          VARCHAR2(10),
   coverage_code             VARCHAR2(20),
   currency_code             VARCHAR2(20),
   premium                   NUMBER(16,2),
   premium_chg               NUMBER(16,2),
   original_premium_chg      NUMBER(16,2),
   premium_rate              NUMBER(12,6),
   quantity                  NUMBER(16,2),
   quantity_chg              NUMBER(16,2),
   sum_insured               NUMBER(16,2),
   sum_insured_chg           NUMBER(16,2),
   unit_sum_insured          NUMBER(20,6),
   unit_sum_insured_chg      NUMBER(20,6),
   unit_premium              NUMBER(20,6),
   unit_premium_chg          NUMBER(20,6),
   limit_per_accident        NUMBER(16,2),
   limit_per_accident_chg    NUMBER(16,2),
   aggr_limit_per_person     NUMBER(16,2),
   aggr_limit_per_person_chg NUMBER(16,2),
   premium_per_person        NUMBER(16,2),
   premium_per_person_chg    NUMBER(16,2),
   months                    NUMBER(8),
   months_chg                NUMBER(8),
   outpatient_times          NUMBER(8),
   start_date                DATE,
   end_date                  DATE,
   formula_sum_insured       NUMBER(1),
   formula_premium           NUMBER(1),
   create_time               DATE default SYSDATE,
   update_time               DATE default SYSDATE,
   updatestatus              VARCHAR2(1),
   parent_subject_code       VARCHAR2(20),
   rating_code               VARCHAR2(20),
   agreed_price              NUMBER(20,6),
   agreed_production         NUMBER(20,6),
   riskratio                 NUMBER(6,2),
   formulamode               VARCHAR2(3),
   claimweek                 NUMBER,
   dailyamount               NUMBER(16,2),
   aggregatelimit            NUMBER(16,2),
   aggregatelimitchg         NUMBER(16,2),
   totalpremium              NUMBER(16,2),
   totalamount               NUMBER(16,2),
   cpicamount                NUMBER(16,2),
   cpicpremium               NUMBER(16,2),
   mainlyamount              NUMBER(16,2),
   mainlypremium             NUMBER(16,2)
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_COVERAGE
   is '保险责任';
 comment on column AIMS_PLC_COVERAGE.actualid
   is '事实id';
 comment on column AIMS_PLC_COVERAGE.topactualid
   is '根节点';
 comment on column AIMS_PLC_COVERAGE.parentactualid
   is '父节点';
 comment on column AIMS_PLC_COVERAGE.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_COVERAGE.subject_code
   is '标的代码';
 comment on column AIMS_PLC_COVERAGE.subject_name
   is '标的名称';
 comment on column AIMS_PLC_COVERAGE.insured_value_mode
   is '保险价值确定方式';
 comment on column AIMS_PLC_COVERAGE.sum_insured_mode
   is '保险金额确定方式';
 comment on column AIMS_PLC_COVERAGE.coverage_code
   is '险别';
 comment on column AIMS_PLC_COVERAGE.currency_code
   is '币种';
 comment on column AIMS_PLC_COVERAGE.premium
   is '总保费';
 comment on column AIMS_PLC_COVERAGE.premium_chg
   is '总保费变化值';
 comment on column AIMS_PLC_COVERAGE.original_premium_chg
   is '原总保费变化值（计算得到的保费的变化值，用于计算保费偏差率）';
 comment on column AIMS_PLC_COVERAGE.premium_rate
   is '费率';
 comment on column AIMS_PLC_COVERAGE.quantity
   is '数量';
 comment on column AIMS_PLC_COVERAGE.quantity_chg
   is '数量变化值';
 comment on column AIMS_PLC_COVERAGE.sum_insured
   is '总保额\累计赔偿限额';
 comment on column AIMS_PLC_COVERAGE.sum_insured_chg
   is '总保额变化值\累计赔偿限额变化值';
 comment on column AIMS_PLC_COVERAGE.unit_sum_insured
   is '单位保额';
 comment on column AIMS_PLC_COVERAGE.unit_sum_insured_chg
   is '单位保额变化值';
 comment on column AIMS_PLC_COVERAGE.unit_premium
   is '单位保费';
 comment on column AIMS_PLC_COVERAGE.unit_premium_chg
   is '单位保费变化值';
 comment on column AIMS_PLC_COVERAGE.limit_per_accident
   is '每次事故赔偿限额';
 comment on column AIMS_PLC_COVERAGE.limit_per_accident_chg
   is '每次事故赔偿限额变化值';
 comment on column AIMS_PLC_COVERAGE.aggr_limit_per_person
   is '每人累计赔偿限额';
 comment on column AIMS_PLC_COVERAGE.aggr_limit_per_person_chg
   is '每人累计赔偿限额变化值';
 comment on column AIMS_PLC_COVERAGE.premium_per_person
   is '每人保费';
 comment on column AIMS_PLC_COVERAGE.premium_per_person_chg
   is '每人保费变化值';
 comment on column AIMS_PLC_COVERAGE.months
   is '月份';
 comment on column AIMS_PLC_COVERAGE.months_chg
   is '月份变化数据';
 comment on column AIMS_PLC_COVERAGE.outpatient_times
   is '门诊限制次数';
 comment on column AIMS_PLC_COVERAGE.start_date
   is '责任起期';
 comment on column AIMS_PLC_COVERAGE.end_date
   is '责任止期';
 comment on column AIMS_PLC_COVERAGE.formula_sum_insured
   is '计算保额';
 comment on column AIMS_PLC_COVERAGE.formula_premium
   is '计算保费';
 comment on column AIMS_PLC_COVERAGE.create_time
   is '创建时间';
 comment on column AIMS_PLC_COVERAGE.update_time
   is '最后修改时间';
 comment on column AIMS_PLC_COVERAGE.updatestatus
   is '修改状态:1新增2修改3作废';
 comment on column AIMS_PLC_COVERAGE.parent_subject_code
   is '上层承保项目';
 comment on column AIMS_PLC_COVERAGE.rating_code
   is '对应承保项目配置';
 comment on column AIMS_PLC_COVERAGE.agreed_price
   is '约定价格（元/公斤）';
 comment on column AIMS_PLC_COVERAGE.agreed_production
   is '约定产量（公斤/亩）';
 comment on column AIMS_PLC_COVERAGE.riskratio
   is '附加险比例';
 comment on column AIMS_PLC_COVERAGE.formulamode
   is '附加险计算方式';
 comment on column AIMS_PLC_COVERAGE.claimweek
   is '最高赔偿期(天)';
 comment on column AIMS_PLC_COVERAGE.dailyamount
   is '每日补偿金额';
 comment on column AIMS_PLC_COVERAGE.aggregatelimit
   is '累计赔偿限额';
 comment on column AIMS_PLC_COVERAGE.aggregatelimitchg
   is '累计赔偿限额变化值';
 comment on column AIMS_PLC_COVERAGE.totalpremium
   is '总保费';
 comment on column AIMS_PLC_COVERAGE.totalamount
   is '太保保额';
 comment on column AIMS_PLC_COVERAGE.cpicpremium
   is '太保保费';
 comment on column AIMS_PLC_COVERAGE.mainlyamount
   is '本司保额';
 comment on column AIMS_PLC_COVERAGE.mainlypremium
   is '本司保费';
 create index IDX_AIMS_PLC_COVERAGE_01 on AIMS_PLC_COVERAGE (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 create index IDX_AIMS_PLC_COVERAGE_02 on AIMS_PLC_COVERAGE (PARENTACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_COVERAGE
   add constraint PK_AIMS_PLC_COVERAGE primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
   
   
   
   
   
    create table AIMS_PLC_DEDUCTIBLE
 (
   actualid          NUMBER(19) not null,
   topactualid       NUMBER(19),
   parentactualid    NUMBER(19),
   replacedactualid  NUMBER(19),
   deductible_code   VARCHAR2(10),
   deductible_name   VARCHAR2(150),
   liability         VARCHAR2(10),
   currency_code     VARCHAR2(20),
   deductible_method VARCHAR2(20),
   deductible_rate   NUMBER(6,4),
   deductible_amount NUMBER(16,2),
   deductible_num    NUMBER(5),
   deductible_point  NUMBER(16,2),
   extended_period   NUMBER(16,2),
   create_time       DATE default SYSDATE,
   update_time       DATE default SYSDATE,
   deductibletype    VARCHAR2(1),
   selectionmethod   VARCHAR2(20),
   calculationmethod VARCHAR2(20)
 )
 tablespace PCIS_TBS
   pctfree 10
   initrans 1
   maxtrans 255
   storage
   (
     initial 64K
     next 8K
     minextents 1
     maxextents unlimited
   );
 comment on table AIMS_PLC_DEDUCTIBLE
   is '事实-免赔';
 comment on column AIMS_PLC_DEDUCTIBLE.actualid
   is '事实id';
 comment on column AIMS_PLC_DEDUCTIBLE.topactualid
   is '根节点:保单关系ID';
 comment on column AIMS_PLC_DEDUCTIBLE.parentactualid
   is '父节点：财产险为保单关系ID责任险为标的ID';
 comment on column AIMS_PLC_DEDUCTIBLE.replacedactualid
   is '被替换节点';
 comment on column AIMS_PLC_DEDUCTIBLE.deductible_code
   is '免赔类型';
 comment on column AIMS_PLC_DEDUCTIBLE.deductible_name
   is '免赔名称';
 comment on column AIMS_PLC_DEDUCTIBLE.liability
   is '保险责任';
 comment on column AIMS_PLC_DEDUCTIBLE.currency_code
   is '币种';
 comment on column AIMS_PLC_DEDUCTIBLE.deductible_method
   is '计算方式';
 comment on column AIMS_PLC_DEDUCTIBLE.deductible_rate
   is '免赔率';
 comment on column AIMS_PLC_DEDUCTIBLE.deductible_amount
   is '免赔额';
 comment on column AIMS_PLC_DEDUCTIBLE.deductible_num
   is '免赔数量';
 comment on column AIMS_PLC_DEDUCTIBLE.deductible_point
   is '起赔点';
 comment on column AIMS_PLC_DEDUCTIBLE.extended_period
   is '观察期';
 comment on column AIMS_PLC_DEDUCTIBLE.create_time
   is '创建时间';
 comment on column AIMS_PLC_DEDUCTIBLE.update_time
   is '最后修改时间';
 comment on column AIMS_PLC_DEDUCTIBLE.deductibletype
   is 'sme免赔类型';
 comment on column AIMS_PLC_DEDUCTIBLE.selectionmethod
   is 'sme免赔率选择';
 comment on column AIMS_PLC_DEDUCTIBLE.calculationmethod
   is 'sme免赔率计算方式';
 create index IDX_AIMS_DEDUCTIBLE_01 on AIMS_PLC_DEDUCTIBLE (TOPACTUALID, REPLACEDACTUALID)
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 alter table AIMS_PLC_DEDUCTIBLE
   add constraint PK_AIMS_PLC_DEDUCTIBLE primary key (ACTUALID)
   using index 
   tablespace PCIS_TBS
   pctfree 10
   initrans 2
   maxtrans 255
   storage
   (
     initial 64K
     next 1M
     minextents 1
     maxextents unlimited
   );
 
 