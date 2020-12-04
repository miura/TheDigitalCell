# 分散分析(ANOVA)の実行
data6 <- data.frame(
  gfp = c(294.9, 287.6, 195.2,
    290.3, 309.7, 201.2,
    291.1, 322.7, 203.7,
    325.7, 301.7, 205.5,
    302.2, 310.1, 196.4,
    303.8, 297.5, 211.8,
    297.1, 298.2, 209.8,
    287.9, 292.5, 201.3,
    311.9, 312.2, 191.5,
    294.8, 284.8, 195.9),
  rnai = factor(rep(c("ctrl", "sirna1", "sirna2"), 10)))
# データフレームの中身を閲覧
View(data6)
# 分散分析(ANOVA)の実行
data6_av <- aov(gfp ~ rnai, data6)
summary(data6_av)
# チューキー検定の実行
data6_tukey <- TukeyHSD(data6_av)
# 結果の参照
data6_tukey
# もしくは違いをプロットしてみる
plot(data6_tukey)
# ダネットの検定。multicompパッケージを使うのでインストールされていなかったら install.packagesを利用する。
library(multcomp)
summary(glht(data6_av, linfct = mcp(rnai = "Dunnett")))