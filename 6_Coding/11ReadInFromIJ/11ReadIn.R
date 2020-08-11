# スクリプトの目的を記述したコメントから始める
# このコードはImageJの複数測定結果を解析する
# データをインポートする
my_raw_data <- read.csv(file='Results.csv', header=TRUE, stringsAsFactors=FALSE)
# 全ての列の名前を得る
my_col_names <- colnames(my_raw_data)
# それぞれのROIについてMean* と名前のついた列を見つける
mean_columns <- my_col_names[grepl("^Mean",my_col_names)]
# 平均値列だけのデータフレームを作成する
my_data <- subset(my_raw_data, select=mean_columns)
# それぞれのROIの値を眺める
matplot(1:length(my_means), my_data,
        type = "l",
        lty = 1,
        col = "grey",
        xlab = "Frames",
        ylab = "Mean Pixel Density")
# 行ごとの平均値を計算する
my_means <- rowMeans(my_data, na.rm=TRUE)
# pdf ファイルを開く
pdf("plot.pdf")
# 結果を描画する
plot(1:length(my_means), my_means, 
     type = "l", 
     col = "red", 
     lwd = 3,
     xlab = "Frames",
     ylab = "Mean Pixel Density")
# pdfファイルを閉じる
dev.off()
# 平均値のデータを保存する
write.csv(my_means, file = "output.csv",row.names=FALSE)