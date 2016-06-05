
-- 创建训练数据集的的labels
-- 生成表格TC_CN_TRAIN_LABELS


DROP TABLE TC_CN_LABELS_TRAIN;
CREATE TABLE TC_CN_LABELS_TRAIN AS
SELECT A.ITEM_ID AS ITEM_ID,ROUND(A.SALES,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_TRAIN_20141121_0304 
  WHERE TIME>='20150219' AND TIME <='20150304'
  GROUP BY ITEM_ID
)A;

DROP TABLE TC_CN_LABELS_TEST;
CREATE TABLE TC_CN_LABELS_TEST AS
SELECT A.ITEM_ID AS ITEM_ID,ROUND(A.SALES,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_TEST_20150305_0616
  WHERE TIME>='20150603' AND TIME <='20150616'
  GROUP BY ITEM_ID
)A;

-- --------------------------------------
-- FOR TESING DATA
DROP TABLE TC_CN_LABELS_EVAL;
CREATE TABLE TC_CN_LABELS_EVAL AS
SELECT A.ITEM_ID AS ITEM_ID,ROUND(A.SALES,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_EVAL_20150617_0928
  WHERE TIME>='20150915' AND TIME <='20150928'
  GROUP BY ITEM_ID
)A;


-- --------------------------------------
-- FOR VALIDATION
DROP TABLE TC_CN_LABELS_VALIDATION;
CREATE TABLE TC_CN_LABELS_VALIDATION AS
SELECT A.ITEM_ID AS ITEM_ID,ROUND(A.SALES,2) AS SALES 
FROM 
( 
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(QTY_ALIPAY_NJHS) AS SALES FROM TC_CN_VALIDATION_20151015_1227
  WHERE TIME>='20151213' AND TIME <='20151227'
  GROUP BY ITEM_ID
)A;




