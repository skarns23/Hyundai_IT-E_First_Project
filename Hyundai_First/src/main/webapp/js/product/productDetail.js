
 function optionSelect(i){
 	var idname = "size"+i;
 	var selSize = document.getElementById(idname);
 	var putValue = document.getElementById("size_name");
	console.log(selSize.value);
	putValue.value = selSize.value;
 	console.log(putValue.value);
 }
 
function frmSubmit(){
	var selSize = document.getElementById("selSize");
	var putValue = selSize.innerHTML;
	console.log(putValue); 
	document.getElementById("size_name").value = putValue;
	
	
	document.getElementById("addCartFrm").submit();
}
