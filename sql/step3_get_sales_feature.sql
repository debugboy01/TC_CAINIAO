﻿
-- 提取预测之前3,5,7,14,30,60,90的销量情况
-- 销量统计的是非聚划算的支付件数,qty_alipay_njhs
-- 由于商品并不是每天都有记录信息，先取平均，在乘以天数，大概估计总的销量情况
-- 生成表格TC_SALES_FEATURE

DROP TABLE TC_SALES_FEATURE_TRAIN;
CREATE TABLE TC_SALES_FEATURE_TRAIN AS
SELECT T90.ITEM_ID,
  ROUND(T3.SALES,2) AS SALES3,
  ROUND(T5.SALES,2) AS SALES5,
  ROUND(T7.SALES,2) AS SALES7,
  ROUND(T14.SALES,2) AS SALES14,
  ROUND(T30.SALES,2) AS SALES30,
  ROUND(T60.SALES,2) AS SALES60,
  ROUND(T90.SALES,2) AS SALES90
FROM
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TRAIN_20141121_0304 
    WHERE TIME>='20141121' AND TIME <='20150218' GROUP BY ITEM_ID
)T90
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TRAIN_20141121_0304 
    WHERE TIME>='20141221' AND TIME <='20150218' GROUP BY ITEM_ID
)T60
ON T90.ITEM_ID = T60.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TRAIN_20141121_0304 
    WHERE TIME>='20150120' AND TIME <='20150218' GROUP BY ITEM_ID
)T30
ON T90.ITEM_ID = T30.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TRAIN_20141121_0304 
    WHERE TIME>='20150205' AND TIME <='20150218' GROUP BY ITEM_ID
)T14
ON T90.ITEM_ID = T14.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TRAIN_20141121_0304 
    WHERE TIME>='20150212' AND TIME <='20150218' GROUP BY ITEM_ID
)T7
ON T90.ITEM_ID = T7.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TRAIN_20141121_0304 
    WHERE TIME>='20150214' AND TIME <='20150218' GROUP BY ITEM_ID
)T5
ON T90.ITEM_ID  = T5.ITEM_ID
LEFT JOIN
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TRAIN_20141121_0304 
    WHERE TIME>='20150216' AND TIME <='20150218' GROUP BY ITEM_ID
)T3
ON T90.ITEM_ID = T3.ITEM_ID;
-- 用平均值填补null
UPDATE TC_SALES_FEATURE_TRAIN SET SALES60 = 0 WHERE SALES60 IS NULL;
UPDATE TC_SALES_FEATURE_TRAIN SET SALES30 = 0 WHERE SALES30 IS NULL;
UPDATE TC_SALES_FEATURE_TRAIN SET SALES14 = 0 WHERE SALES14 IS NULL;
UPDATE TC_SALES_FEATURE_TRAIN SET SALES7 = 0 WHERE SALES7 IS NULL;
UPDATE TC_SALES_FEATURE_TRAIN SET SALES5 = 0 WHERE SALES5 IS NULL;
UPDATE TC_SALES_FEATURE_TRAIN SET SALES3 = 0 WHERE SALES3 IS NULL;




-- ------------------------------------------------
-- FOR TEST
DROP TABLE TC_SALES_FEATURE_TEST;
CREATE TABLE TC_SALES_FEATURE_TEST AS
SELECT T90.ITEM_ID,
  ROUND(T3.SALES,2) AS SALES3,
  ROUND(T5.SALES,2) AS SALES5,
  ROUND(T7.SALES,2) AS SALES7,
  ROUND(T14.SALES,2) AS SALES14,
  ROUND(T30.SALES,2) AS SALES30,
  ROUND(T60.SALES,2) AS SALES60,
  ROUND(T90.SALES,2) AS SALES90
FROM
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TEST_20150305_0616 
    WHERE TIME>='20150305' AND TIME <='20150602' GROUP BY ITEM_ID
)T90
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TEST_20150305_0616 
    WHERE TIME>='20150404' AND TIME <='20150602' GROUP BY ITEM_ID
)T60
ON T90.ITEM_ID = T60.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TEST_20150305_0616 
    WHERE TIME>='20150504' AND TIME <='20150602' GROUP BY ITEM_ID
)T30
ON T90.ITEM_ID = T30.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TEST_20150305_0616 
    WHERE TIME>='20150520' AND TIME <='20150602' GROUP BY ITEM_ID
)T14
ON T90.ITEM_ID = T14.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TEST_20150305_0616 
    WHERE TIME>='20150527' AND TIME <='20150602' GROUP BY ITEM_ID
)T7
ON T90.ITEM_ID = T7.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TEST_20150305_0616 
    WHERE TIME>='20150529' AND TIME <='20150602' GROUP BY ITEM_ID
)T5
ON T90.ITEM_ID  = T5.ITEM_ID
LEFT JOIN
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_TEST_20150305_0616 
    WHERE TIME>='20150531' AND TIME <='20150602' GROUP BY ITEM_ID
)T3
ON T90.ITEM_ID = T3.ITEM_ID;


-- 用平均值填补null
UPDATE TC_SALES_FEATURE_TEST SET SALES60 = 0 WHERE SALES60 IS NULL;
UPDATE TC_SALES_FEATURE_TEST SET SALES30 = 0 WHERE SALES30 IS NULL;
UPDATE TC_SALES_FEATURE_TEST SET SALES14 = 0 WHERE SALES14 IS NULL;
UPDATE TC_SALES_FEATURE_TEST SET SALES7 = 0 WHERE SALES7 IS NULL;
UPDATE TC_SALES_FEATURE_TEST SET SALES5 = 0 WHERE SALES5 IS NULL;
UPDATE TC_SALES_FEATURE_TEST SET SALES3 = 0 WHERE SALES3 IS NULL;



-------------------------------------------------------------------------------------------------------------------------------
-- FOR EVALUATING
DROP TABLE TC_SALES_FEATURE_EVAL;
CREATE TABLE TC_SALES_FEATURE_EVAL AS
SELECT T90.ITEM_ID,
  ROUND(T3.SALES,2) AS SALES3,
  ROUND(T5.SALES,2) AS SALES5,
  ROUND(T7.SALES,2) AS SALES7,
  ROUND(T14.SALES,2) AS SALES14,
  ROUND(T30.SALES,2) AS SALES30,
  ROUND(T60.SALES,2) AS SALES60,
  ROUND(T90.SALES,2) AS SALES90
FROM
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_EVAL_20150617_0928 
    WHERE TIME>='20150617' AND TIME <='20150914' GROUP BY ITEM_ID
)T90
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_EVAL_20150617_0928 
    WHERE TIME>='20150717' AND TIME <='20150914' GROUP BY ITEM_ID
)T60
ON T90.ITEM_ID = T60.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_EVAL_20150617_0928 
    WHERE TIME>='20150816' AND TIME <='20150914' GROUP BY ITEM_ID
)T30
ON T90.ITEM_ID = T30.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_EVAL_20150617_0928 
    WHERE TIME>='20150901' AND TIME <='20150914' GROUP BY ITEM_ID
)T14
ON T90.ITEM_ID = T14.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_EVAL_20150617_0928 
    WHERE TIME>='20150908' AND TIME <='20150914' GROUP BY ITEM_ID
)T7
ON T90.ITEM_ID = T7.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_EVAL_20150617_0928 
    WHERE TIME>='20150910' AND TIME <='20150914' GROUP BY ITEM_ID
)T5
ON T90.ITEM_ID  = T5.ITEM_ID
LEFT JOIN
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_EVAL_20150617_0928 
    WHERE TIME>='20150912' AND TIME <='20150914' GROUP BY ITEM_ID
)T3
ON T90.ITEM_ID = T3.ITEM_ID;


-- 用平均值填补null
UPDATE TC_SALES_FEATURE_EVAL SET SALES60 = 0 WHERE SALES60 IS NULL;
UPDATE TC_SALES_FEATURE_EVAL SET SALES30 = 0 WHERE SALES30 IS NULL;
UPDATE TC_SALES_FEATURE_EVAL SET SALES14 = 0 WHERE SALES14 IS NULL;
UPDATE TC_SALES_FEATURE_EVAL SET SALES7 = 0 WHERE SALES7 IS NULL;
UPDATE TC_SALES_FEATURE_EVAL SET SALES5 = 0 WHERE SALES5 IS NULL;
UPDATE TC_SALES_FEATURE_EVAL SET SALES3 = 0 WHERE SALES3 IS NULL;


-------------------------------------------------------------------------------------------------------------------------------
-- FOR SUBMISSION
DROP TABLE TC_SALES_FEATURE_SUB;
CREATE TABLE TC_SALES_FEATURE_SUB AS
SELECT T90.ITEM_ID,
  ROUND(T3.SALES,2) AS SALES3,
  ROUND(T5.SALES,2) AS SALES5,
  ROUND(T7.SALES,2) AS SALES7,
  ROUND(T14.SALES,2) AS SALES14,
  ROUND(T30.SALES,2) AS SALES30,
  ROUND(T60.SALES,2) AS SALES60,
  ROUND(T90.SALES,2) AS SALES90
FROM
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_SUB_20150929_1227
    WHERE TIME>='20150929' AND TIME <='20151227' GROUP BY ITEM_ID
)T90
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_SUB_20150929_1227
    WHERE TIME>='20151029' AND TIME <='20151227' GROUP BY ITEM_ID
)T60
ON T90.ITEM_ID = T60.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_SUB_20150929_1227
    WHERE TIME>='20151128' AND TIME <='20151227' GROUP BY ITEM_ID
)T30
ON T90.ITEM_ID = T30.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_SUB_20150929_1227
    WHERE TIME>='20151214' AND TIME <='20151227' GROUP BY ITEM_ID
)T14
ON T90.ITEM_ID = T14.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_SUB_20150929_1227
    WHERE TIME>='20151221' AND TIME <='20151227' GROUP BY ITEM_ID
)T7
ON T90.ITEM_ID = T7.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_SUB_20150929_1227
    WHERE TIME>='20151223' AND TIME <='20151227' GROUP BY ITEM_ID
)T5
ON T90.ITEM_ID  = T5.ITEM_ID
LEFT JOIN
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_SUB_20150929_1227
    WHERE TIME>='20151225' AND TIME <='20151227' GROUP BY ITEM_ID
)T3
ON T90.ITEM_ID = T3.ITEM_ID;


-- 用平均值填补null
UPDATE TC_SALES_FEATURE_SUB SET SALES60 = 0 WHERE SALES60 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES30 = 0 WHERE SALES30 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES14 = 0 WHERE SALES14 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES7 = 0 WHERE SALES7 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES5 = 0 WHERE SALES5 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES3 = 0 WHERE SALES3 IS NULL;



-------------------------------------------------------------------------------------------------------------------------------
-- FOR VALIDATION
DROP TABLE TC_SALES_FEATURE_VALIDATION;
CREATE TABLE TC_SALES_FEATURE_VALIDATION AS
SELECT T90.ITEM_ID,
  ROUND(T3.SALES,2) AS SALES3,
  ROUND(T5.SALES,2) AS SALES5,
  ROUND(T7.SALES,2) AS SALES7,
  ROUND(T14.SALES,2) AS SALES14,
  ROUND(T30.SALES,2) AS SALES30,
  ROUND(T60.SALES,2) AS SALES60,
  ROUND(T90.SALES,2) AS SALES90
FROM
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_VALIDATION_20151015_1227
    WHERE TIME>='20151015' AND TIME <='20151213' GROUP BY ITEM_ID
)T90
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_VALIDATION_20151015_1227
    WHERE TIME>='20151015' AND TIME <='20151213' GROUP BY ITEM_ID
)T60
ON T90.ITEM_ID = T60.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_VALIDATION_20151015_1227
    WHERE TIME>='20151114' AND TIME <='20151213' GROUP BY ITEM_ID
)T30
ON T90.ITEM_ID = T30.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_VALIDATION_20151015_1227
    WHERE TIME>='20151130' AND TIME <='20151213' GROUP BY ITEM_ID
)T14
ON T90.ITEM_ID = T14.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_VALIDATION_20151015_1227
    WHERE TIME>='20151207' AND TIME <='20151213' GROUP BY ITEM_ID
)T7
ON T90.ITEM_ID = T7.ITEM_ID
LEFT JOIN 
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_VALIDATION_20151015_1227
    WHERE TIME>='20151209' AND TIME <='20151213' GROUP BY ITEM_ID
)T5
ON T90.ITEM_ID  = T5.ITEM_ID
LEFT JOIN
(
  SELECT ITEM_ID,COUNT(*) AS RECORDS,SUM(qty_alipay_njhs) AS SALES FROM TC_CN_VALIDATION_20151015_1227
    WHERE TIME>='20151210' AND TIME <='20151213' GROUP BY ITEM_ID
)T3
ON T90.ITEM_ID = T3.ITEM_ID;


-- 用平均值填补null
UPDATE TC_SALES_FEATURE_SUB SET SALES60 = 0 WHERE SALES60 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES30 = 0 WHERE SALES30 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES14 = 0 WHERE SALES14 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES7 = 0 WHERE SALES7 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES5 = 0 WHERE SALES5 IS NULL;
UPDATE TC_SALES_FEATURE_SUB SET SALES3 = 0 WHERE SALES3 IS NULL;

