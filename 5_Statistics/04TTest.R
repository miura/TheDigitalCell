# 例えばそれぞれの群でn=8のシミューレートしたデータ 
set.seed(1)
data1 <- rnorm(8, mean = 1, sd = 0.3)
data2 <- rnorm(8, mean = 3, sd = 0.9)
# data1は対照群、data2は薬剤処理したもの
t.test(data1,data2)
# 対応のあるデータでは、追加パラメータを使用する
t.test(data1,data2,paired=TRUE)