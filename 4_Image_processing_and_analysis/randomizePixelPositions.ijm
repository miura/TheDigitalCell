/**
Kota Miura, Nov.20.2020
A supplementary code for "The Digital Cell"
For experiental trials to shuffle the position of pixels
License: MIT 
**/

// if you want to also do the actual measurement, following three lines can be uncommented to load an example image and to set a rectangular ROI
//run("Blobs (25K)");
//run("Set Measurements...", "area mean redirect=None decimal=3");
//makeRectangle(111, 45, 105, 104);

getBoundingRect(x, y, width, height);
randomizePxelPositions(x, y, width, height);

//run("Select All");


function randomizePxelPositions(x, y, width, height){
	image1DA = newArray(width * height);
	for(j = 0; j < height; j++){
		for (i = 0; i < width; i++) {
			image1DA[width * j + i] = getPixel(x + i, y + j);
		}
	}
	
	indexA = newArray(image1DA.length);
	for (i = 0; i < indexA.length; i++) {
		indexA[i] = i;
	}
		
	randomIndexA = Array.copy(image1DA);
	//Fisher–Yates algorithm
	for (i = randomIndexA.length-1; i > 0; i--){
		rand = floor( random * (i+1));
		reserve = randomIndexA[i];
		randomIndexA[i] = randomIndexA[rand];
		randomIndexA[rand] = reserve;
		reserve = indexA[i];
		indexA[i] = indexA[rand];
		indexA[rand] = reserve;				
	}
	for (i = 0; i < indexA.length; i++) {
		print(indexA[i], ":", randomIndexA[i], " <-" , image1DA[i]);
	}	
	//replace pixels
	for(j = 0; j < height; j++){
		for (i = 0; i < width; i++) {
			setPixel(x + i, y + j, randomIndexA[j * width + i]);
		}
	}

	//confirm, sort back by index
	print("=== confirm ===");	
	Array.sort(indexA, randomIndexA);
	for (i = 0; i < indexA.length; i++) {
		print(indexA[i], ":", randomIndexA[i], " <-" , image1DA[i]);
	}			
}
