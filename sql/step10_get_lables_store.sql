
-- 创建训练数据集的的labels
-- 生成表格TC_CN_TRAIN_LABELS]


-- -----------------------------------------
-- FOR TRAINING
DROP TABLE TC_CN_LABELS_TRAIN_ST;
CREATE TABLE TC_CN_LABELS_TRAIN_ST AS
SELECT A.ITEM_ID AS ITEM_ID,A.STORE_CODE AS STORE_CODE,ROUND(A.SALES*14/A.RECORDS,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,STORE_CODE,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_TRAIN_20141121_0304_ST
  WHERE TIME>='20150219' AND TIME <='20150304'
  GROUP BY ITEM_ID,STORE_CODE
)A;

-- ----------------------------------------
-- FOR TESTING
DROP TABLE TC_CN_LABELS_TEST_ST;
CREATE TABLE TC_CN_LABELS_TEST_ST AS
SELECT A.ITEM_ID AS ITEM_ID,A.STORE_CODE AS STORE_CODE,ROUND(A.SALES*14/A.RECORDS,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,STORE_CODE,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_TEST_20150305_0616_ST
  WHERE TIME>='20150603' AND TIME <='20150616'
  GROUP BY ITEM_ID,STORE_CODE
)A;

-- --------------------------------------
-- FOR EVALIATING
DROP TABLE TC_CN_LABELS_EVAL_ST;
CREATE TABLE TC_CN_LABELS_EVAL_ST AS
SELECT A.ITEM_ID AS ITEM_ID,A.STORE_CODE AS STORE_CODE,ROUND(A.SALES*14/A.RECORDS,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,STORE_CODE,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_EVAL_20150617_0928_ST
  WHERE TIME>='20150915' AND TIME <='20150928'
  GROUP BY ITEM_ID,STORE_CODE
)A;


-- --------------------------------------
-- FOR VALIDATION
DROP TABLE TC_CN_LABELS_VALIDAT_ST;
CREATE TABLE TC_CN_LABELS_VALIDAT_ST AS
SELECT A.ITEM_ID AS ITEM_ID,A.STORE_CODE AS STORE_CODE,ROUND(A.SALES*14/A.RECORDS,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,STORE_CODE,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_VALIDAT_20150929_1227_ST
  WHERE TIME>='20151214' AND TIME <='20151227'
  GROUP BY ITEM_ID,STORE_CODE
)A;

