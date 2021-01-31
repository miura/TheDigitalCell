/*
 * このマクロはブラインド解析のためにTIFFファイルのディレクトリを準備する 
 * そして解析最後に元に戻すため、元ファイルとブラインド解析ファイルの対応をログに記録する 
*/
macro "Blind Analysis" {
	dirPath = getDirectory("Select a directory");
	// ファイル名の取得
	allNames = getFileList(dirPath);
	// 出力フォルダの作成
	outputDir = dirPath+"blind"+File.separator;
	File.makeDirectory(outputDir);
	// 配列を作成し、それを*.tifという名前だけに拡張<<（訳注：つまりtif画像のみ選択）>>
	imNames = newArray(0);
	for (i = 0; i < allNames.length; i ++) {
		if (endsWith(allNames[i], ".tif")) {
			imNames = append(imNames, allNames[i]);
		}
	}
	imNum = imNames.length;
	// imNumの長さと同じ、並べ替えた配列を生成
	imPerm = newArray(imNum);
	for(i = 0; i < imNum; i ++) {
		imPerm[i] = i + 1;
	}
	// 配列を順不同に入れ替える
	for(i = 0; i < imNum; i ++) {
		j = floor(random * imNum);
		swap = imPerm[i];
		imPerm[i] = imPerm[j];
		imPerm[j] = swap;
	}
	//  画像名と連続して順不同にした位置と画像名を関連づける
	imPermNames = newArray(imNum);
	for(i = 0; i < imNum; i ++){
		imPermNames[i] = "blind_" + IJ.pad(imPerm[i],4); // 9999より多くの画像の場合、幅を変える
	}
	// 画像を開き、メタデータを剥がし、ブラインド名を使って保存フォルダに保存する。
	// 保存先のフォルダに生成されたlog.txtに両方の名前を記録する。	
	setBatchMode(true);
	f = File.open(outputDir+"log.txt");
	print(f, "Original_Name\tBlinded_Name"); // タブ区切り
	for(i = 0; i < imNum; i ++){
		inputPath = dirPath+imNames[i];
		outputPathPerm = outputDir+imPermNames[i];
		open(inputPath);
		totalSlices = nSlices;
		if(totalSlices > 1)  {
			stripFrameByFrame(totalSlices);
		} else  {
			setMetadata("Label", ""); // 目隠しのため画像からラベルデータを剥がす
		}
		save(outputPathPerm);
		print(f,imNames[i]+"\t"+imPermNames[i]);
		close();
	}
	setBatchMode("exit and display");
	showStatus("finished");
}

// それぞれの画像スライスからラベルデータを剥がす
function stripFrameByFrame(totalSlices)  {
	for(i = 0; i < totalSlices; i ++){
		setSlice(i+1);
		setMetadata("Label", "");
	}
}

// 配列に変数を加える関数
function append(arr, value) {
	arr2 = newArray(arr.length + 1);
	for (i = 0; i < arr.length; i ++)
		arr2[i] = arr[i];
		arr2[arr.length] = value;
	return arr2;
}
