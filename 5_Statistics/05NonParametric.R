#  例えばいくつかのシミューレートしたデータについて
set.seed(1)
data3 <- rbeta(40,5,1)
data4 <- rbeta(40,2,1)
wilcox.test(data3,data4)
# 対応づけのあるデータについては追加パラメータを利用する
wilcox.test(data3,data4,paired=TRUE)
# data3とdata4を比較するコルモゴロフ-スミルノフ検定
ks.test(data3,data4)
# 累積密度関数を生成
cdf3 <- ecdf(data3)
cdf4 <- ecdf(data4)
# pdfファイルを開く
pdf("ksplot.pdf")
# 結果をプロットする
plot(0, 0, type="l", xlim=c(0,1), ylim=c(0,1), xlab="Circularity", ylab="Cumulative probability")
lines(cdf3, lwd=2)
lines(cdf4, col="gray", lwd=2)
legend("topleft",legend=c("data3", "data4"), bty = "o", col=c("black", "gray"), lwd=2, bg = "white")
dev.off()