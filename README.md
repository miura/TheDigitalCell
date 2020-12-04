# デジタル細胞生物学

## データベース化、ImageJ、R、コマンドライン、Git

本で扱っているコンピュータプログラム、サンプル画像のリポジトリ

<!--
[![DOI](https://zenodo.org/badge/180952157.svg)](https://zenodo.org/badge/latestdoi/180952157)
-->

In each of the folders in this repo, you will find code examples that are featured in the corresponding book chapter.
The code examples are organized in numerical order that they are encountered in the book.
They are either:

1. ImageJ Macros to run in FIJI/ImageJ
2. R scripts to run in RStudio/R
3. Bash scripts to run on the command line

## Errata

During the Japanese translation of "The Digital Cell" a few errors were found in the text or code. My thanks go to Kota Miura and Yuki Tsukada for spotting them.

1. In **Chapter 4** section *How to analyze an image*, the text should read: “You can calculate the number of pixels in the ROI of a calibrated image by *dividing* the Area by the pixel size of the image (if you know it), or by dividing RawIntDen by the Mean.”
2. In **Chapter 5** section **Power analysis for cell biologists**, the example given contains two errors. It should read "Assuming the standard deviation increases proportionally (to *2400*)". The code example should therefore be `power.t.test(n = NULL, delta = 2000, sd = 2400, sig.level = 0.05, power = 0.9)` This gives n = 31.3 which should be "rounded up" to 32". The code example in this repo has now been updated.