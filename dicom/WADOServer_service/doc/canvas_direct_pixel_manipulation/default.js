window.addEventListener("load", Main, false); 

var ctx;

var WIDTH;
var HEIGHT; 
var rFilt, gFilt, bFilt;
var table, rVal, gVal, bVal, aVal, xVal, yVal;
var rNew, gNew, bNew;
var imgData;

var colorOffset  = {red: 0, green: 1, blue: 2, alpha: 3};

function loadImage () {
		WIDTH = myCanvas.width;
		HEIGHT = myCanvas.height;
		ctx.drawImage(myImg, 0, 0, WIDTH, HEIGHT);
		imgData = ctx.getImageData(0,0,WIDTH, HEIGHT);
}

function getRGBFilters () {
	 rFilt = document.myform.filter[0].checked;
	 gFilt = document.myform.filter[1].checked;
	 bFilt = document.myform.filter[2].checked;	
}

function onMouseMove (event) {

	// if canvas in the (0,0) then we can use clientX and clientY
	// however we need to use coordinates relative to the canvas (which fires event)
	var tmpX = xVal.innerText = event.offsetX;
	var tmpY = yVal.innerText = event.offsetY;
	
	if (!imgData)
		return;
		
	// example of red value for pixel in position X (column) and Y (row)
	// imageData.data [ (4 * width * row) + (4 * column) ]
	// no add 1 for green, 2 for blue, 3, for Alpha
	rNew = imgData.data [ (4 * tmpY * WIDTH) + (4 * tmpX) + colorOffset.red ];
	gNew = imgData.data [ (4 * tmpY * WIDTH) + (4 * tmpX) + colorOffset.green];
	bNew = imgData.data [ (4 * tmpY * WIDTH) + (4 * tmpX) + colorOffset.blue];
	aNew = imgData.data [ (4 * tmpY * WIDTH) + (4 * tmpX) + colorOffset.alpha];
	
	rVal.innerText = rNew;
	gVal.innerText = gNew;
	bVal.innerText = bNew;
	aVal.innerText = aNew;	
}

function onMouseOut (event) {
	var tableRow = table.rows (2);
	
	for (var i=0; i < tableRow.cells.length; i++) {
		tableRow.cells[i].innerText = " ";
	}
}

function Main(){

	rFilt = false;
	gFilt = false;
	bFilt = false;
	
	
	myImg = document.getElementById("myImage");
	myCanvas = document.getElementById("myCanvas");
	
	// avoid marshalling to DOM by getting all elements once
	table = document.getElementById ("colorValues");	
	rVal = document.getElementById ("rVal");
	gVal = document.getElementById ("gVal");
	bVal = document.getElementById ("bVal");
	aVal = document.getElementById ("aVal");
	xVal = document.getElementById ("x");
	yVal = document.getElementById ("y");
	
	if (myCanvas.getContext) {
		ctx = myCanvas.getContext("2d");
		loadImage();	
	}
	
	
	
	myCanvas.addEventListener ("mousemove", onMouseMove, false);
	myCanvas.addEventListener ("mouseout", onMouseOut, false);
	myCanvas.addEventListener ("mousedown", function (evt) {
												(evt.button == 0) ? applyFilter (3) : applyFilter (4)  ;
												evt.returnValue = true;
											}, false);

}
function applyFilter (action) {

    // action = 1: apply B&W
	// action = 2: separate specific channel
	// action = 3: separate custom color
	// action = 4: color to aplha
	
    var pixels = imgData.data;
	getRGBFilters();
	   
	// Loop through the pixels, turning them grayscale
    for (var i = 0; i < pixels.length; i += 4) {
		var r = pixels[i];
		var g = pixels[i + 1];
		var b = pixels[i + 2];

		if (action == 1) {
			// convert to B&W
			//var brightness = (.3 * r + .55 * g + .11 * b) ;
			// http://en.wikipedia.org/wiki/Luma_(video)
			var brightness = 0.2126 * r + 0.7152 * g + 0.0722 * b;
			pixels[i + colorOffset.red] = brightness;
			pixels[i + colorOffset.green] = brightness;
			pixels[i + colorOffset.blue] = brightness;
		}
		else if ( action == 2 )  {	
			// remove specific color
			if (rFilt) {
				pixels[i + colorOffset.red] = 0;
			}
			if (gFilt) {
				pixels[i + colorOffset.green] = 0;
			}
			if (bFilt) {
				pixels[i + colorOffset.blue] = 0;
			}
		}
		else if (action == 3) {
			// remove custom color
			pixels[i + colorOffset.red] -= rNew;
			pixels[i + colorOffset.green] -= gNew;
			pixels[i + colorOffset.blue] -= bNew;
		}
		else {
		// color to alpha
			if (   Math.abs (r-rNew) < 10 &&
					Math.abs (g-gNew) < 10 &&
					Math.abs (b-bNew) < 10
				)
				pixels[i + colorOffset.alpha] = 0;

		}
	}
    ctx.putImageData(imgData,0,0);
}



