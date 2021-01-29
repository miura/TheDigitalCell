#!/usr/bin/env bash
set -x
trap read debug
# このbashスクリプトは一行ずつ実行する
# デクストップへ移動
cd ~/Desktop
# make a directory
# ディレクトリの作成
mkdir my_folder
# 作ったものはあるか？
ls -d */
# my_folderへ移動
cd my_folder
# 何をしているかを確認するために、my_folderをファインダーやそれと同等のもので表示
# 二つのテキストファイルを作成
echo "Is this the real life?" > a.txt
echo "Is this just fantasy?" > b.txt
# a.txtとb.txtの二つのファイルが作成できたことを確認
ls
# それら二つを結合
cat a.txt b.txt > c.txt
# 結合したファイルの中身をlsで見てから、qで中身の表示を終了
less c.txt
# ファイルをnanoというエディタで編集することも可能で、その場合ctrl+xで終了
nano c.txt
# 作ったファイルを現在いるディレクトリ外のデスクトップへコピーし、名前を変更
cp c.txt ../d.txt
# こんどはデスクトップ上のファイルを作成したフォルダへ移動
mv ../d.txt d.txt
# rmコマンドでファイルを削除することも可能
rm a.txt
# また全てのファイルを削除し、フォルダを削除することも可能
cd ~/Desktop
rm my_folder/*
rmdir my_folder/
