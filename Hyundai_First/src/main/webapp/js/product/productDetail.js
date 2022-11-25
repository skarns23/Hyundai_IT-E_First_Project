/**
 * 
 */

 function optionSelect(i){
 	var idname = "size"+i;
 	var selSize = document.getElementById(idname);
 	var putValue = document.getElementById("size_name");
	console.log(selSize.value);
	putValue.value = selSize.value;
 	console.log(putValue.value);
 }