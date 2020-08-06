# EBImageのパッケージを使う
library(EBImage)
# EBImage は次の2つのコマンドでインストールできる（インストール済みの場合は不要）。
install.packages("BiocManager")
BiocManager::install("EBImage")
# EBImageを使って、各チャネルをインポート
c1 <- readImage("c1.tif")
c2 <- readImage("c2.tif")
# フレーム数を変数として取得
fr = dim(c1)[3]
# SRCCの結果を格納する空のベクトルをふたつ用意する
r1 <- rep(NA, fr)
r2 <- rep(NA, fr)
# 各フレームにおけるSRCCをループを回して計算
for (i in 1:fr ){
  r1[i] <- cor(as.vector(c1[,,i]), as.vector(c2[,,i]), method="spearman")
  r2[i] <- cor(sample(as.vector(c1[,,i])), as.vector(c2[,,i]), method="spearman")
}
# Rのベース関数を使ってプロット
png("corr.png")
par(cex = 1.5, mar = c(4, 4, 1, 1))
plot(0,0, type="l", xlim=c(0,fr), ylim=c(-0.1,1.2), xlab="Frame", ylab="SRCC")
lines(1:fr, r1, lwd=2)
lines(1:fr, r2, col="gray", lwd=2)
legend("topleft",legend=c("c1 vs c2", "randomized"), bty = "n", col=c("black", "gray"), lwd=2)
dev.off()

