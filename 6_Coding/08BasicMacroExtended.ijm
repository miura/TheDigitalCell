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
		// この部分はそれぞれの画像への操作を含む
		setAutoThreshold("Otsu");
		setOption("BlackBackground", false);
		run("Convert to Mask");
		// ここで改変した画像を保存先のフォルダに保存する
		saveAs("TIFF", dir2+list[i]);
		close();
		}
	}
