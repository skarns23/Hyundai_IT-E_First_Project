<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".gender").click(function(){
			$(".tit-tab").removeClass('on');
			$(this).parents().addClass('on');
		})
		
	});
</script>

<div id="container">
   <section class="content-response">
      <h2 class="dp-title tit-tab-wrap eng" id="bestTitle">
         <span class="tit-tab pl113 on" > <a href="#" class="gender" id="공용">ALL</a>
         </span> <span class="tit-tab"  value="1"> <a href="#" class="gender" id="여성">WOMAN</a>
         </span> <span class="tit-tab" > <a href="#" class="gender" id="남성">MAN</a>
         </span>
      </h2>
      <div class="wrap-product-list">
         <ul class="product-list" id="productsList">
            <c:forEach var="proList" items="${productList}">
            <li godno="GM0122111816388">
               <!-- 대형 이미지 클래스 product-sp-->
               <figure class="item-box" data-ga-id="GM0122111816388" data-ga-name="플라워 스마일 니트 베스트" data-ga-brand="SJYP" data-ga-price="179100">
                  <div class="item-img">
                     <div class="img-box">
                        <a href="${contextPath}/Hfashion?command=detail&pno=${proList.pro_no}">   
                              <img src='<c:url value='${ proList.img_loc}'></c:url>'>
                        </a>
                     </div>
                  </div>
                  <figcaption class="item-info">
                     <a href="javascript:void(0);" onclick="goGodDetail('GM0122111816388')">
                        <div class="item-brand"><c:out value="${proList.brand_name}"></c:out></div>
                        <div class="item-name"><c:out value="${proList.pro_name}"></c:out>  </div>
                        <div class="item-price">
                           <span class="price">  <fmt:formatNumber value="${proList.pro_price}" pattern="#,###" /> 원</span>
                        </div>
                        <div class="item-label">
                           <span class="label3">신상</span> <span class="label2">할인</span> <span class="label3">쿠폰</span>
                        </div>
                     </a>
                  </figcaption>
               </figure>
            </li>
	         <input type="hidden" id="categoryNo" value="${proList.category}">
            </c:forEach>
         </ul>
         </div>
   </section>
</div>

<script>
$('.gender').click( function(){
	
	var genderVal = $(this).attr("id");
	var categoryNo = $('#categoryNo').val();

	$.ajax({
		url: 'Hfashion?command=productSort',
		type: 'GET',
		data:{
			gender : genderVal,
			category : categoryNo
		},
		//dataType: 'json',
		success: function(result){
			//alert("ajax 는 쉬운것이다!")
			
			var obj = JSON.parse(result);
			
			
			//alert(obj);
			//console.log(obj);
			var tag="";
			for(var i=0; i<obj.length; i++){
				let price = obj[i].pro_price;
				price = price.toLocaleString('ko-KR');
				tag += `
					<li godno="GM0122111816388">
	               <!-- 대형 이미지 클래스 product-sp-->
	               <figure class="item-box" data-ga-id="GM0122111816388" data-ga-name="플라워 스마일 니트 베스트" data-ga-brand="SJYP" data-ga-price="179100">
	                  <div class="item-img">
	                     <div class="img-box">
	                        <a href="Hfashion?command=detail&pno=\${obj[i].pro_no}">     
	                              <img src='${contextPath}/\${obj[i].img_loc}'>
	                        </a>
	                     </div>
	                  </div>
	                  <figcaption class="item-info">
	                     <a href="javascript:void(0);" onclick="goGodDetail('GM0122111816388')">
	                        <div class="item-brand">\${obj[i].brand_name}</div>
	                        <div class="item-name">\${obj[i].pro_name}</div>
	                        <div class="item-price">
	                           <span class="price">\${price} 원</span>
	                        </div>
	                        <div class="item-label">
	                           <span class="label3">신상</span> <span class="label2">할인</span> <span class="label3">쿠폰</span>
	                        </div>
	                     </a>
	                  </figcaption>
	               </figure>
	               <input type="hidden" id="categoryNo" value="\${obj[i].category}">
	            </li>
				`
			}
			$("#productsList").html(tag);

		},
		error:function(){
			alert("ajax 에러다 요녀석아");
		}
	});
});
</script>


<%@ include file="../layout/footer.jsp"%>