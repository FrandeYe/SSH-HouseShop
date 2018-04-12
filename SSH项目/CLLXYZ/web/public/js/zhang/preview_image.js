// common variables

var iBytesUploaded = 0;
var iBytesTotal = 0;
var iPreviousBytesLoaded = 0;
var iMaxFilesize = 1048576; // 1MB
var oTimer = 0;
var sResultFileSize = '';

function fileSelected(a, b) {
	var oFile = document.getElementById(b).files[0];
	// filter for image files
	var rFilter = /^(image\/bmp|image\/gif|image\/jpeg|image\/png|image\/tiff)$/i;
	if (!rFilter.test(oFile.type)) {
		document.getElementById('error').style.display = 'block';
		return;
	}
	// get preview element
	var oImage = document.getElementById(a);
	console.log(a);
	// prepare HTML5 FileReader
	var oReader = new FileReader();
	oReader.onload = function(e) {

		oImage.src = e.target.result;
	};

	// read selected file as DataURL
	oReader.readAsDataURL(oFile);
}
