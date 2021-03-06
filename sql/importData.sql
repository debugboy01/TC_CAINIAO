DROP TABLE TC_CAINIAO_ITEM_FEATURE;
CREATE TABLE TC_CAINIAO_ITEM_FEATURE(
  time VARCHAR2(8),
  ITEM_ID VARCHAR2(12),
  CATE_ID VARCHAR2(12),
  CATE_LEVEL_ID VARCHAR2(12),
  BRAND_ID VARCHAR2(12),
  SUPPLIER_ID VARCHAR2(20),
  PV_IPV NUMBER(12,3),
  PV_UV NUMBER(12,3),
  CART_IPV NUMBER(12,3),
  CART_UV  NUMBER(12,3),
  COLLECT_UV NUMBER(12,3),
  NUM_GMV NUMBER(12,3),
  AMT_GMV NUMBER(12,3),
  QTY_GMV NUMBER(12,3),
  UNUM_GMV NUMBER(12,3),
  AMT_ALIPAY NUMBER(12,3),
  NUM_APLIPAY NUMBER(12,3),
  QTY_APIPAY NUMBER(12,3),
  UNUM_ALIPAY NUMBER(12,3),
  ZTC_PV_IPV NUMBER(12,3),
  TBK_PV_IPV NUMBER(12,3),
  SS_PV_IPV NUMBER(12,3),
  JHS_PV_IPV NUMBER(12,3),
  ZTC_PV_UV NUMBER(12,3),
  TBK_PV_UV NUMBER(12,3),
  SS_PV_UV NUMBER(12,3),
  JHS_PV_UV NUMBER(12,3),
  NUM_AIPAY_HJHS NUMBER(12,3),
  AMT_APLIPAY_NJHS NUMBER(12,3),
  QTY_ALIPAY_NJHS NUMBER(12,3),
  UNUM_ALIPAY_NJHS NUMBER(12,3)
);


DROP TABLE TC_CAINIAO_ITEM_STORE_FEATURE;
CREATE TABLE TC_CAINIAO_ITEM_STORE_FEATURE(
  time VARCHAR2(8),
  ITEM_ID VARCHAR2(12),
  STORE_CODE VARCHAR2(12),
  CATE_ID VARCHAR2(12),
  CATE_LEVEL_ID VARCHAR2(12),
  BRAND_ID VARCHAR2(12),
  SUPPLIER_ID VARCHAR2(20),
  PV_IPV NUMBER(12,3),
  PV_UV NUMBER(12,3),
  CART_IPV NUMBER(12,3),
  CART_UV  NUMBER(12,3),
  COLLECT_UV NUMBER(12,3),
  NUM_GMV NUMBER(12,3),
  AMT_GMV NUMBER(12,3),
  QTY_GMV NUMBER(12,3),
  UNUM_GMV NUMBER(12,3),
  AMT_ALIPAY NUMBER(12,3),
  NUM_APLIPAY NUMBER(12,3),
  QTY_APIPAY NUMBER(12,3),
  UNUM_ALIPAY NUMBER(12,3),
  ZTC_PV_IPV NUMBER(12,3),
  TBK_PV_IPV NUMBER(12,3),
  SS_PV_IPV NUMBER(12,3),
  JHS_PV_IPV NUMBER(12,3),
  ZTC_PV_UV NUMBER(12,3),
  TBK_PV_UV NUMBER(12,3),
  SS_PV_UV NUMBER(12,3),
  JHS_PV_UV NUMBER(12,3),
  NUM_AIPAY_NJHS NUMBER(12,3),
  AMT_APLIPAY_NJHS NUMBER(12,3),
  QTY_ALIPAY_NJHS NUMBER(12,3),
  UNUM_ALIPAY_NJHS NUMBER(12,3)
);

