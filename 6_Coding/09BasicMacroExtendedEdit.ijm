/*
* このマクロは2値化したそれぞれの画像を新しいフォルダに保存する
*/
dir1 = getDirectory("Select the source directory");
// ここでユーザーは保存先のフォルダを指定する必要がある
dir2 = getDirectory("Select destination directory");
list = getFileList(dir1);
Array.sort(list);
setBatchMode(true);
for(i=0; i<list.length; i++){
	filename = dir1 + list[i];
	// tiff 形式のファイルを扱っていることを確認する	
	if (endsWith(filename, "tif")) {
		open(filename);
		// それぞれの画像への処理に関数を用いる
		processImage();
		// ここで変更した画像を保存用のフォルダに保存する
		saveAs("TIFF", dir2+list[i]);
		close();
		}
	}
function processImage() {
	setAutoThreshold("Otsu");
	setOption("BlackBackground", false);
	run("Convert to Mask");
	}
