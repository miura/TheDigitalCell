data7 <- data.frame(
  response = c(6.0, 9.7, 5.8,
    6.0, 8.8, 6.5,
    5.7, 8.5, 5.9,
    5.6, 9.2, 6.0,
    5.9, 8.5, 5.6,
    5.9, 9.0, 6.1,
    6.3, 9.1, 5.9,
    6.0, 9.3, 5.0,
    6.5, 9.0, 6.0,
    5.7, 9.3, 6.3),
  treatment = factor(rep(c("vehicle", "cpd1", "cpd2"), 10)))
kruskal.test(response ~ treatment, data7)
# dunn.testを読み込む。インストールされていない場合はinstall.packagesを利用する。
library(dunn.test)
dunn.test(data7$response,data7$treatment)