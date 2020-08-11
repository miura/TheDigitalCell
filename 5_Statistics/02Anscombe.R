library(ggplot2)
library(gridExtra)
# データの読み込み
data(anscombe)
# 統計値を表示して類似性を確認
summary(anscombe)
# xとyの組み合わせについて相関を表示
sapply(1:4, function(x) cor(anscombe[, x], anscombe[, x+4]))
# データの分散も表示して類似性を確認
sapply(5:8, function(x) var(anscombe[, x]))
# x1とy1について線形回帰を行う
lm(y1 ~ x1, data = anscombe)
# 切片が3、傾き0.5となる
# 以下を使って他の組み合わせデータについて確認
# lm(y2 ~ x2, data = anscombe)
# そしてデータをプロットし、違いを眺めてみる
p1 <- ggplot(anscombe) + geom_point(aes(x1, y1))
p2 <- ggplot(anscombe) + geom_point(aes(x2, y2))
p3 <- ggplot(anscombe) + geom_point(aes(x3, y3))
p4 <- ggplot(anscombe) + geom_point(aes(x4, y4))
# この本の図はもう少し手の込んだコードで生成している
grid.arrange(p1, p2, p3, p4)
#-----------------------------------------------
p1 <- ggplot(anscombe) + geom_point(aes(x1, y1)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 1")
p2 <- ggplot(anscombe) + geom_point(aes(x2, y2)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 2")
p3 <- ggplot(anscombe) + geom_point(aes(x3, y3)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 3")
p4 <- ggplot(anscombe) + geom_point(aes(x4, y4)) + theme_bw() + scale_x_continuous(breaks = seq(0, 20, 5)) + scale_y_continuous(breaks = seq(0, 20, 5)) + geom_abline(intercept = 3, slope = 0.5, color = "darkgray") + expand_limits(x = c(0,20), y = c(0,20)) + labs(title = "Data set 4")
grid.arrange(p1, p2, p3, p4)
