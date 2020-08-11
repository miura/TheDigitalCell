# 複数の測定を含む、複数のcsvファイルを処理するスクリプト
#
# 現在の作業ディレクトリ内にある全ての.csvファイルを検索する
my_files <- list.files("./data/",pattern='*.csv', full.names = T)
# 存在していなければ、出力用のディレクトリを作成する
if (dir.exists("output")==FALSE) dir.create("output")
# 関数の定義
calc_and_plot <- function(my_filename){
  # データのインポート
  my_raw_data <- read.csv(file=my_filename, header=TRUE, stringsAsFactors=FALSE)
  # 全ての列の名前を検索
  my_col_names <- colnames(my_raw_data)
  # ここでそれぞれのROIについてのMean*列を探す
  mean_columns <- my_col_names[grepl("^Mean",my_col_names)]
  # 平均値列のみを取り出す
  my_data <- subset(my_raw_data, select=mean_columns)
  # 行ごとの平均を計算する
  my_means <- rowMeans(my_data, na.rm=TRUE)
  # 完全パスからファイル名と拡張子を取り出す
  old_filename <- basename(my_filename)
  # 「out_*」が名前に付いたファイルを出力する
  my_output <- paste("out_",old_filename, sep = "")
  # *.csvと名前がついているものを*.pdfと変換する
  pdf_name <- paste(substr(my_output, 1, nchar(my_output)-4),".pdf",sep = "")
  # 出力ディレクトリへのパスを作成
  out_path <- file.path(getwd(),"output",pdf_name)
  # pdfファイルを開く
  pdf(out_path)
  # 結果を描画する
  plot(1:length(my_means), my_means, 
       type = "l", 
       col = "red", 
       lwd = 3,
       xlab = "Frames",
       ylab = "Mean Pixel Density")
  # pdfファイルを閉じる
  dev.off()
  # 平均値データを保存する
  out_path <- file.path(getwd(),"output",my_output)
  write.csv(my_means, file = out_path,row.names=FALSE)
}
# リスト内のそれぞれのファイルについて関数を呼び出す
for(i in 1:length(my_files)){
  my_filename <- my_files[i]
  calc_and_plot(my_filename)
}
