function frmSubmit(){
	var selSize = document.getElementById("selSize");
	var putSize = selSize.innerHTML;
	var putCnt = document.getElementById("pro_qty").value;
	
	console.log(putCnt);
	document.getElementById("size_amount").value = putCnt;
	document.getElementById("size_name").value = putSize;
	
	
	document.getElementById("addCartFrm").submit();
}
