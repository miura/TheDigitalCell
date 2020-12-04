set.seed(1)
m <- 80 # rows
n <- 200 # columns
# rnormの初期設定は平均=0、標準偏差=1
data0 <- replicate(n, rnorm(m))
# data0をを使う、例えばそれぞれの列の平均を探す
colMeans(data0)
