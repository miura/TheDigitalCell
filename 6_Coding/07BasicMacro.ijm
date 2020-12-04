/*
* この位置に書くコメントはマクロ自体の説明に有用である
* このマクロはフォルダ内のそれぞれの画像について平均値を測定する
*/
// ユーザーに画像の入っているフォルダの選択を促す
dir = getDirectory("Select the source directory");
// このディレクトリに含まれる全ファイルのリストを作成する
list = getFileList(dir);
// 作成したファイルのリストをアルファベット順に並べる
Array.sort(list);
// バッチモードの利用により実行スピードを速める。
setBatchMode(true);
// 測定したい値を定義する
run("Set Measurements...", "display area mean redirect=None decimal=3");
// それぞれの画像でコマンドを実行するためループを用いる
for(i=0; i<list.length; i++){
	// 作成したリスト内のi番目のファイルを定義し、開く
	filename = dir + list[i];
	open(filename);
	// それぞれの画像に対してこれらのコマンドを実行する
	run("Select All");
	run("Measure");
	run("Close All");
	}
