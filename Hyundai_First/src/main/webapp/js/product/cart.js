 const httpRequest = new XMLHttpRequest();

 
function goodsDel(pro_no, size_name){
	
	$.ajax({
		 type : 'post',
         url : '/Hfashion?command=delCart',
         data : {
             pro_no : pro_no,
             size_name : size_name
         },
         success : function() {
        	 console.log('삭제 성공!');
        	 
         },
         error : function(e) {
             console.log(e);
         }
	})
	
}
