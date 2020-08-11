/*
 * テスト画像と比較するためのグランドトゥルース画像を作成する 
 * 灰色のノイズあり背景に10 の点 
 */
setBatchMode(true);
imageDim=512;	// 画像のxy次元をピクセルで
// ノイズ画像の作成
newImage("TestImg", "8-bit random", imageDim, imageDim, 1);
// 平均値フィルターを適用
run("Mean...", "radius=2");
// TestImgウィンドウのIDを取得
Tid = getImageID();
// 黒背景のグランドトゥルース画像を作成
newImage("GTImg", "8-bit grayscale-mode black", imageDim, imageDim, 1);
// GTImgウィンドウのIDを取得
GTid = getImageID();
// 前景色を白に設定
setColor(255);
// ループではそれぞれの画像におけるスポット位置を設定
for (i=0;i<10;i++){
	// 画像内のランダムな位置
	posX=floor(random*imageDim);
	posY=floor(random*imageDim);
	selectImage(Tid);
	// この位置を5ピクセルの円で埋める
	fillOval(posX, posY, 3, 3);
	selectImage(GTid);
	// グランドトゥルース画像でも同じ位置で円を埋める
	fillOval(posX, posY, 3, 3);
}
selectImage(Tid);
// テスト画像の全体をぼかす
run("Gaussian Blur...", "sigma=2 stack");
setBatchMode("exit and display");