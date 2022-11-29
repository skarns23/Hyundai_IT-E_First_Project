
var _itmMaxQty = 999;
var preventCartDblClk = false; //장바구니 담기 이중클릭 방지


if($(".sizeRecommandArea").length > 0) {

    try{
        //버츄 사이즈 키
        var vsStoreName = 'h_fashion';
        var vsEnv = $("#vsSizeEnvKey").val();
        var vsDeviceType = 'desktop';

        (function (d) {

            var s = d.createElement("script");
            s.type = "text/javascript";
            s.charset = "utf-8";
            s.async = true;
            s.src =
                ("https:" == d.location.protocol ? "https://" : "http://") +
                "integration.virtusize.kr/" +
                vsEnv +
                "/" +
                vsStoreName +
                "/" +
                vsDeviceType +
                ".source.js";
            var s1 = d.getElementsByTagName("script")[0];
            s1.parentNode.insertBefore(s, s1);
        })(document);

    }catch (e) {
        console.log(e);
    }

}

/* ********************************************/
/* 1. QnA                                     */
/* ********************************************/

/**
 * 상품 QnA 등록 팝업 호출
 */
function showQnaPopup(loginYn) {

    if (loginYn == 'Y') {
        if ($("#layerProductQnA").length > 0) {
            $("#layerProductQnA").remove();
        }

        $.ajax({
            type: "GET",
            async: true,
            dataType: "html",
            url: "/secured/mypage/myQnaLayerAjax",
            data: {
                 "csoGodInq.godNo": $("#thisGodNo").val()
                , "csoGodInq.dsgnGrpNo": $("#dsgnGrpNo").val()
            },
            beforeSend: function (request) {
                var csrfToken = $("meta[name='_csrf']").attr("content");
                var csrfName = $("meta[name='_csrf_header']").attr("content");
                request.setRequestHeader(csrfName, csrfToken);
            },
            success: function (data) {
                $("body").append(data);
                layer.open('layerProductQnA');
            },
            error: function (pa_data, status, err) {
            }
        });
    } else {
        location.href = "/public/member/login";
    }
}

/**
 * 상품 QNA 목록조회
 */
function getQnaList(pageNo, godNo) {
    if (pageNo == "") {
        pageNo = 1;
    }

    $.ajax({
        type: "GET",
        async: true,
        dataType: "html",
        url: "/public/goods/detail/listQna",
        data: {'csoGodInq.godNo': godNo, 'pageNo': pageNo},
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $('#tabContentQna').html(data);

            if(pageNo==1){
                var qnaTotalRow =$("#qnaTotalRow").val();
                var qnaCnt = "("+currencyFormatter(qnaTotalRow)+")";
                var html = "문의"+qnaCnt;

                $("#tabQnaCnt").text(html);
            }
            fold.init();
            header.init();

        },
        error: function (pa_data, status, err) {
        }
    });
}


/* ********************************************/
/* 2. 상품리뷰                                */
/* ********************************************/

function getReviewList(pageNo, sortFlag, reviewFlag,firstFlag) {
    var _godNo = $("#thisGodNo").val();

    var optValCd1=$("input[name='optValCd1']:checked").val();
    var optValCd2=$("input[name='optValCd2']:checked").val();
    var optValCd3=$("input[name='optValCd3']:checked").val();

    if(sortFlag=='F'){
        sortFlag = $("input[name='rvList']:checked").val();
    }

    if(reviewFlag=='F'){
        if($("#btnTogglePhotoReview").hasClass("btn-type4-sm")){//클릭된 상태
            reviewFlag="I";
        }else{
            reviewFlag="";
        }
    }

    $.ajax({
        type: "GET",
        async: true,
        url: "/public/goods/detail/listReview",
        data: {
            'pageNo': pageNo
            ,'sortFlag': sortFlag
            ,'reviewFlag': reviewFlag
            ,'firstFlag': firstFlag
            ,'godNo': _godNo
            ,'godTpCd' : $("#godTpCd").val()
            ,'optValCd1' : optValCd1
            ,'optValCd2' : optValCd2
            ,'optValCd3' : optValCd3
        },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            var reviewTotalRow = 0;

            if(firstFlag =="Y"){
                $("#tabContentReview").html(data);//먼저
                $("#allReviewList").removeClass("initialized");

                $("#allReviewList").show();


                var $reviewArea =$(".info-bot .review");
                reviewTotalRow = parseInt($("[name='allReviewTotalRow']").val());

                if(parseInt(reviewTotalRow) < 5){
                    $reviewArea.hide();
                    $(".review-total").remove();

                    if(parseInt(reviewTotalRow) == 0){
                        var noReview = "<a href='#tabContentReview'>첫 리뷰를 남겨주세요!</a>";
                        $reviewArea.html(noReview);
                        $reviewArea.show();
                    }
                }else{
                    $reviewArea.find(".num").html(reviewTotalRow);
                    var reviewTotalScore =$("[name='allReviewTotalScore']").val();
                    var totalScorePercent =$("#allReviewTotalScorePercent").val();

                    reviewTotalScore = parseFloat(reviewTotalScore);
                    $("span[id='reviewTotalScoreSummary']").html(reviewTotalScore+"점");
                    $("span[id='reviewTotalScoreSummary']").css("width",totalScorePercent+"%");

                    setReviewChart();

                }
                fold.init();
                setGodEvlLikeMbr();
                //리뷰 개수 출력
                $("#tabReviewCnt").text("리뷰("+currencyFormatter(parseInt($("[name='allReviewTotalRow']").val()))+")");
            }else if(reviewFlag=="I"){
                $("#photoReviewList").html(data);//먼저
                reviewTotalRow = parseInt($("[name='photoReviewTotalRow']").val());
                $("#allReviewList").hide();
                $("#photoReviewList").show();
                //포토 리뷰 개수 출력
                $("#tabReviewCnt").text("리뷰("+currencyFormatter(reviewTotalRow)+")");
            }else{
                $("#allReviewList").removeClass("initialized");
                $("#allReviewList").html(data);//먼저

                reviewTotalRow = parseInt($("[name='allReviewTotalRow']").val());
                $("#photoReviewList").hide();

                if($("#allReviewList").find("li").length > 0){
                    $("#allReviewList").show();
                    setGodEvlLikeMbr();
                }
                fold.init();
                //리뷰 개수 출력
                $("#tabReviewCnt").text("리뷰("+currencyFormatter(parseInt($("[name='allReviewTotalRow']").val()))+")");
            }

            header.init();

            if(reviewTotalRow < 1){
                $("#photoReviewList").hide();
                $("#allReviewList").hide();
                $("#reviewNodata").show();
            }else{
                $("#reviewNodata").hide();
            }
            
            if(pageNo>1){            	
            	document.querySelector('.review-total').scrollIntoView()
            }            	


        },
        error: function (pa_data, status, err) {

        }
    });
}

/**
 * 상품리뷰 등록 팝업 호출
 */
function getInsertReviewPopup(){
    alert("상품리뷰 포인트는 상품 구매후 [마이페이지 > 주문/배송]에서 리뷰를 작성해 주실때 증정됩니다.");

    $.ajax({
        type: "POST",
        async: true,
        dataType: "html",
        url: "/product/getGoodsReview.popup",
        data: {"godNo" : $("#thisGodNo").val()},
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if($("#reviewEdit").length > 0){
                $("#reviewEdit").remove();
            }
            $("body").append(data);
            layer.open('reviewEdit');
            document.querySelector('#reviewEdit').querySelector('.layer-header').scrollIntoView()
        },
        error: function (pa_data, status, err) {
        }
    });
}



//중복클릭 막기
var submtchk = 1;

/**
 *  상품 리뷰 저장
 */
function saveGodEvl() {
    if(confirm("저장하시겠습니까?")){
		formSubmit();
    };
}

/**
 *  상품리뷰 저장
 */
function formSubmit(){
    if(specialTextCheck("godEvlCont") == false){
        alert("특수문자 ￦ / : < > 는 사용할 수 없습니다.");
        $('#godEvlCont').focus();
        return false;
    }

    var evlContBanWord = checkPhbtwdAjax( $("[name='godGodEvl.godEvlCont']").val());
    if(evlContBanWord.word != ""){
        alert('사용할수 없는 단어가 포함되어있습니다.<br> "'+evlContBanWord.word+'"');
        $('#godEvlCont').focus();
        return;
    }

    var godEvlCont = $("#godEvlCont").val();
    var godEvlSj = $("#godEvlSj").val();
    var wearInfoSectDetailVal = $('[name="godGodEvlWearInfoList[0].wearInfoSectDetailVal"]').val();
    var wearInfoSectDetailCdBody = "";
 	if(document.getElementById("selectBody") != null){
 		wearInfoSectDetailCdBody = document.getElementById("selectBody").innerText;
	}
 	console.log(wearInfoSectDetailVal.length);
 	console.log(wearInfoSectDetailCdBody);

    if(godEvlCont.length == 0){
        godEvlCont = $("#godEvlCont").val();
    }
    if(godEvlCont == null || godEvlCont == ""){
        alert("내용을 최소 50자 이상 입력해주세요.");
        return;
    }else if(godEvlCont.length < 50){
        alert("내용을 최소 50자 이상 입력해주세요.");
        return;
    }else if(godEvlCont.length > 500){
        alert("내용은 최대 1000자까지 입력가능합니다.");
        return;
    }else if(godEvlSj == null || godEvlSj == ""){
        alert("제목을 입력해주세요.");
        return;
    }else if(wearInfoSectDetailVal.length>0 || wearInfoSectDetailCdBody!="선택하세요."){
    	var psnlInfoYn = $("input[name='psnlInfoYn']").is(":checked");
    	if(wearInfoSectDetailVal.length > 0 && (wearInfoSectDetailCdBody == "선택하세요.")){
    		alert("나의 사이즈는 키/체형 정보 모두 입력 후 등록 가능합니다.");
    		return;
    	}
    	if(wearInfoSectDetailVal.length == 0 &&  (wearInfoSectDetailCdBody != "선택하세요.")){
    		alert("나의 사이즈는 키/체형 정보 모두 입력 후 등록 가능합니다.");
    		return;
    	}
        if(wearInfoSectDetailVal < 0){
            alert("실 착용자의 정보를 정확히 입력해주세요.");
            return;
        }
        if(psnlInfoYn==false){
			alert("나의 사이즈 정보 입력 시 개인정보 선택 수집 및 이용 동의는 필수 입니다.");
			return;
        }
    }

    // 평점 체크
	var godEvlScore = $("input[name='godGodEvl.totEvlScore']:checked").val();
	if(godEvlScore == undefined || godEvlScore == null){
		alert("평점을 등록해주세요.");
		return;
	}

    var form = $("#insertPopupForm");
    submtchk ++;
    if (submtchk == 2){
        form.ajaxSubmit({
            url : "/product/insertGoodsReviewAction",
            mimeType:"multipart/form-data",
            type:"post",
            dataType:  'json',
            contentType: false,
            processData: false,
            cache: false,
            success:function(args){
                layer.close('reviewEdit');
                $("#reviewEdit").remove();
                getReviewList(1,'new','','');
                submtchk = 1;

            },
            error:function(e){
                alert("리뷰 작성 실패");
                submtchk = 1;
            }
        });
    }
}

/**
 * 상품 리뷰 좋아요 체크[비동기로 체크]
 */
function setGodEvlLikeMbr() {
    var reviewTotalRow = parseInt($("[name='allReviewTotalRow']").val());
    if(reviewTotalRow > 0 && $(".loginYn").val()=='Y'){
        var godEvlTurns=[];

        $(".btn-like2").each(function (index) {
            godEvlTurns.push($(this).attr("godEvlTurn"));
        });

        if(godEvlTurns.length > 0){
            $.ajax({
                type: "POST",
                url: "/product/checkGodEvlLikeMbr.json" ,
                traditional : true,
                data: { "dsgnGrpNo" : $("#dsgnGrpNo").val() , "arrGodEvlTurns" : godEvlTurns },
                beforeSend: function (request) {
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfName = $("meta[name='_csrf_header']").attr("content");
                    request.setRequestHeader(csrfName, csrfToken);
                },
                success: function (data) {
                    for(var i=0; i < data.result.length ; i++){
                        $(".btn-like2[godEvlTurn='"+data.result[i].godEvlTurn+"']").addClass("on");
                    }
                }
            });
        }
    }
}

/**
 * 상품 포토리뷰만 보기
 */
function getPhotoReviewList(obj){
    if ($(obj).hasClass("btn-type4-sm")){ //클릭 된 상태
        getReviewList(1,'new','','');

        $(obj).removeClass("btn-type4-sm");
        $(obj).addClass("btn-type1-sm");

    }else{//해제된 상태
        $("#allReviewList").html("");

        getReviewList(1,'new','I','');

        $(obj).removeClass("btn-type1-sm");
        $(obj).addClass("btn-type4-sm");
    }
}

/**
 * 상품 포토리뷰 상세보기
 */

function getPhotoReviewDetail(godNo,godEvlTurn) {

    var optValCd1=$("#prdReviewFilter input[name='optValCd1']:checked").val();
    var optValCd2=$("#prdReviewFilter input[name='optValCd2']:checked").val();
    var optValCd3=$("#prdReviewFilter input[name='optValCd3']:checked").val();

    var params= {
        'sortFlag':$("input[name='rvList']:checked").val()
        ,'reviewFlag': "I"
        ,'godNo': godNo
        ,'godTpCd' : $("#godTpCd").val()
        ,'optValCd1' : optValCd1
        ,'optValCd2' : optValCd2
        ,'optValCd3' : optValCd3
        ,'godEvlTurn' : godEvlTurn
    };


    $.ajax({
        type: "POST",
        async: true,
        dataType: "html",
        url: "/product/getPhotoReviewDetail",
        data: params,
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if ($("#reviewDetail").length > 0) {
                $("#reviewDetail").remove();
            }
            $("body").append(data);
            layer.open('reviewDetail');
            slide.bind('#reviewImg', 'page nav');
        },
        error: function (pa_data, status, err) {
        }
    });
}

function setReviewChart() {
    pieChartSum();
    slide.create('chartSlide');
}

function currencyFormatter(param) {
    var num = param + "";
    var point = num.length % 3;
    var len = num.length;
    var returnStr = "";

    returnStr = num.substring(0, point);

    while (point < len) {
        if (returnStr != "") {
            returnStr += ",";
        }
        returnStr += num.substring(point, point + 3);
        point += 3;

    }
    return returnStr;
}

/**
 * 상품 좋아요 콜백
 */
function addBukmkCallback(obj) {
    var godNo =$(obj).attr('godNo');
    var cnt = parseInt($(".godBukmkCnt[godNo='"+godNo+"']").attr("cnt"));
    var strCnt ="";

    if ($(obj).attr("state")=="delete") {
        cnt = cnt-1;
        $(".btn-like[godNo='"+godNo+"']").removeClass("on");//같은 상품번호를 가진 다른 영역 같이
    } else {
        cnt = cnt+1;
        $(".btn-like[godNo='"+godNo+"']").addClass("on");
    }

    if(cnt >= 10000){
        strCnt="9,999+";
    }else{
        strCnt=cnt;
    }

    $(".godBukmkCnt[godNo='"+godNo+"']").attr("cnt",cnt);
    $(".godBukmkCnt[godNo='"+godNo+"']").html(strCnt);
    
    addBukmkAppier();
}

function addBukmkAppier(){
	//Appier Traking : Add to Wishlist
	try{
   		var appierRtAddToWishlist =[];
   		
   		appierRtAddToWishlist.push({
   			productID : $("[name='god.godNo']").val(), 
        	unit : "1",
            price : $("[name='lastSalePrc'][godNo='" + $("[name='god.godNo']").val() + "']").eq(0).val()
		});
   		
   		window.appier_q = window.appier_q || [];
   		window.appier_q.push(
   				{"t": "register", "content": { "id": "52bd", "site": "hfashionmall.com" }},
   				{"t": "type_addwishlist", "itemList":appierRtAddToWishlist, "action_id": "AddToWishList_96f1", "track_id": "f7acd2e2d0f37e8"}
   		);

	}catch (e) {
       console.log(e);
	}
}

/**
 * 상품리뷰 좋아요
 */
function addGodEvlLikeCount(obj,callbackF) {
    var loginYn=$(".loginYn").eq(0).val();
    var url ="";

    if(loginYn!='Y') {
        alert("로그인 후 이용가능합니다.");
        location.href="/public/member/login";
        return;
    }

    if($(obj).hasClass("on")){
        url = "/product/removeGodEvlLike.json";
    }else{
        url = "/product/addGodEvlLike.json";
    }

    var godEvlTurn = $(obj).attr("godEvlTurn");
    var godNo = $(obj).attr("reviewGodNo");

    $.ajax({
        type: "POST",
        url: url ,
        data: {"godNo" : godNo , "godEvlTurn" : godEvlTurn },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if(data.result > 0){
                if(callbackF) {
                    callbackF(obj);
                }
            }else{
                alert("에러");
            }
        }
    });

}

/**
 * 상품리뷰 좋아요 콜백1
 */
function addLikeList(obj) {
    var cnt = parseInt($(obj).find(".like-count").attr("likeCnt"));
    var strCnt ="";

    if ($(obj).hasClass("on")) {
        $(obj).removeClass("on");
        cnt = cnt-1;
    } else {
        $(obj).addClass("on");
        cnt = cnt+1;
    }

    if(cnt >= 10000){
        strCnt="9,999+";
    }else{
        if(cnt==0){
            strCnt="-";
        }else{
            strCnt=addComma(cnt);
        }
    }
    $(obj).find(".like-count").html(strCnt);
    $(obj).find(".like-count").attr("likeCnt",cnt);
}

/**
 * 상품 신고하기 ajax
 */
function insertReport(rpTpCd, rpCont, godNo, godEvlTurn) {
    $.ajax({
        type: "POST",
        async: false,
        url: "/public/goods/detail/addReport.json",
        data: {'rpCont': rpCont, 'rpTpCd' : rpTpCd, 'godNo':godNo, 'godEvlTurn':godEvlTurn},
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            layer.close('layerReviewReport');
        	alert("신고가 정상적으로 접수되었습니다.")
        },
        error: function (pa_data, status, err) {
        }
    });	
}


/**
 * 상품 옵션 선택시 이벤트
 */
function selectGodOpt1(obj){
    var nowItmNo = $(obj).val();
    var optGodNo = $(obj).attr("optGodNo"); // 추후 패키지일때도 고려 해야함
 

    var index = parseInt($(obj).attr("index"));

    var hasOpt2 =$("#hasOpt2").val();
    var hasOpt3 = $("#hasOpt3").val();
    if(!hasOpt2) hasOpt2="N";
    if(!hasOpt3) hasOpt3="N";

    for(var i=0; i < index ; i++){
        var pdSelSize = $("[name='pdSelSize_"+i+"']:checked").val();

        if(typeof pdSelSize == 'undefined' || pdSelSize==''){
            alert("상위 옵션을 먼저 선택해 주세요.");
            $("div[name='qtyDiv'][godNo='"+optGodNo+"']").hide();
            resetSelectOption(i);
            return false;
        }
    }

    if(hasOpt2=='Y' || hasOpt3=='Y'){
        var lastIndex = 1;
        if(hasOpt3=='Y'){
            lastIndex = 2;
        }
        
        if(index != lastIndex){
            var beforeIndex =parseInt(index)-1;
            var params={};

            params.godNo =optGodNo;
            params.index =index;
            var optValCd =$(obj).attr("optValCd");

            if(parseInt(index) ==0){
                params.optValCd1 =optValCd;
            }else if(parseInt(index) ==1){
                var beforeSelected = $("[name='pdSelSize_"+beforeIndex+"']:checked").attr("optValCd");
                params.optValCd1 =beforeSelected;
                params.optValCd2 =optValCd;
            }

            $("div[name='qtyDiv'][godNo='"+optGodNo+"']").hide();
            $("div[name='qtyDiv'][godNo='"+optGodNo+"']").attr("selectOptionYn","N");

            resetSelectOption(index+1);
            selectGodItmOpt(params);//다음 옵션 조회
        }
    }

    if(!checkSizeSelected()){//전체 옵션 선택 했는지 체크
        $("div[name='qtyDiv'][godNo='"+optGodNo+"']").attr("selectOptionYn","N");
        return;
    }else{
        if($(obj).closest("ul").attr("optCd")=="SIZE_OPT"){//동일 사이즈 리뷰보기 버튼 노출 및 리뷰카운트 조회
/*            $.ajax({
                type: "POST",
                async: true,
                dataType: "JSON",
                url: "/product/getSameSizeReviewCount",
                data: {"godNo" :  $(obj).closest(".row.size").find(".btn-size").attr("optGodNo") , "optValCd" : $(obj).attr("optValCd") },
                beforeSend: function (request) {
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfName = $("meta[name='_csrf_header']").attr("content");
                    request.setRequestHeader(csrfName, csrfToken);
                },
                success: function (data) {
                    var sameSizeReviewCount = parseInt(data.sameSizeReviewCount);
                    if(sameSizeReviewCount > 0){
                        $(obj).closest(".row.size").find(".btn-size span").html(sameSizeReviewCount);
                        $(obj).closest(".row.size").find(".btn-size").show();

                    }else{
                        $(obj).closest(".row.size").find(".btn-size").hide();
                    }
                },
                error: function (pa_data, status, err) {

                }
            });*/

        }

        $("div[name='qtyDiv'][godNo='"+optGodNo+"']").attr("selectOptionYn","Y");//선택된건지 구분하기위한 구분값 추가
        //alert($("div[name='qtyDiv'][godNo='"+optGodNo+"']").attr("selectOptionYn"));

        var resveOrdDlivyPrearngeDate =$(obj).attr("resveOrdDlivyPrearngeDate");
        if($(obj).attr("resveOrdDlivyPrearngeDate")){
            $("#resveOrdDlivyDateStr").html("출고예정일 : "+resveOrdDlivyPrearngeDate);
            $("#resveOrdDlivyDateStr").show();
        }else{
            $("#resveOrdDlivyDateStr").hide();
        }

        $('#itmNo0').val(nowItmNo);// 새로 빼야함

        getPkupInv();
        drawNotiOptionDiv(obj);
    }
}

/**
 * 사이드 가이드 팝업 호출
 */
function getSizeGuideLayer(godNo) {

    $.ajax({
        type: "POST",
        async: true,
        url: "/product/getSizeGuideInfo",
        data: {"godNo" : godNo },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if($("#layerSizeGuide").length > 0){
                $("#layerSizeGuide").remove();
            }

            $("body").append(data);
            layer.open('layerSizeGuide');
            tab.bind('#layerSizeGuide');
        },
        error: function (pa_data, status, err) {

        }
    });
}


/**
 * 동일 사이즈 리뷰보기 팝업 호출
 */
function showSameSizeReviewPop(obj) {
    var name = $(obj).closest(".row.size").find("[name^='pdSelSize']").eq(0).attr("name");
    var selectedOptVal = $("input[name='"+name+"']:checked").attr("optValCd");

    $.ajax({
        type: "POST",
        async: true,
        url: "/product/getSameSizeReviewList",
        data: {"godNo" : $(obj).attr("optGodNo") , "optValCd" : selectedOptVal ,'pageNo': 1},
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if($("#layerSizeReview").length > 0){
                $("#layerSizeReview").remove();
            }

            $("body").append(data);
            layer.open('layerSizeReview');

            //동일사이즈 리뷰 스크롤 페이징 처리
            $("#layerSizeReview").find(".scroll-wrap").on("scroll",function(){
                var wrapper =document.getElementById("layerSizeReview");
                if(wrapper.querySelector(".scroll-inner").scrollHeight - $(this).scrollTop() <= wrapper.querySelector(".scroll-wrap").clientHeight ){
                    getMoreSameSizeReview(obj);
                }
            })


        },
        error: function (pa_data, status, err) {

        }
    });
}
var getPaging =true;

function getMoreSameSizeReview(obj) {
    var totalPage =parseInt($("#sameSizePopTotalPage").val());
    var currentPage =parseInt($("#sameSizePopCurrentPage").val());

    var name = $(obj).closest(".row.size").find("[name^='pdSelSize']").eq(0).attr("name");
    var selectedOptVal = $("input[name='"+name+"']:checked").attr("optValCd");

    if(currentPage < totalPage && getPaging){
        getPaging=false;
        $.ajax({
            type: "POST",
            async: true,
            url: "/product/getSameSizeReviewList",
            data: {"godNo" : $(obj).attr("optGodNo") , "optValCd" : selectedOptVal ,'pageNo': currentPage+1},
            beforeSend: function (request) {
                var csrfToken = $("meta[name='_csrf']").attr("content");
                var csrfName = $("meta[name='_csrf_header']").attr("content");
                request.setRequestHeader(csrfName, csrfToken);
            },
            success: function (data) {
                $("#layerSizeReview").find(".size-review-list").append(data);
                $("#sameSizePopCurrentPage").val(currentPage+1);
                getPaging=true;
            },
            error: function (pa_data, status, err) {
                getPaging=true;
            }
        });

    }

}



/**
 * 본 상품 옵션 초기화
 */
function resetSelectOption(index) {//추후 패키지도 고려해야함
    var $optionDiv = $(".option-bot").eq(0);
    if($optionDiv.find("[name='qtyDiv'][selectOptionYn='Y']").length < 1){
        $(".total").hide();
    }

    $("#bskGodItmNo").val("");
    $("#bskGodItmQty").val("1");
    $("#itmNo0").val("");

    var selectLength = 3;//동적으로 가져올수 있는지 확인해보기
    //var nextIndex =parseInt(index)+1;

    for(var i=index ; i <= selectLength ; i++){

        //select.reset("pdSelSize_"+i);
        //select.reset("pdStickySelSize_"+i);

        $(".gnrlOpt").find("[name='pdSelSize_"+i+"']").prop("checked",false);
        $(".gnrlOpt").find("[name='pdStickySelSize_"+i+"']").prop("checked",false);

        $(".gnrlOpt").find("[name='optSelect"+i+"']").find(".sel-btn .val").html("");
        $(".gnrlOpt").find("[name='optSelect"+i+"']").find(".sel-btn").removeClass("on");

        $(".gnrlOpt").find("[name='optSelect"+i+"_top']").find(".sel-btn .val").html("");
        $(".gnrlOpt").find("[name='optSelect"+i+"_top']").find(".sel-btn").removeClass("on");
    }
}

/**
 * 상품 단품 다음 옵션 조회
 */
function selectGodItmOpt(params) {
    var url = "/public/goods/selectGodDetailOpt";

    $.ajax({
        type: "POST",
        url: url,
        data: params,
        dataType: "JSON",
        cache: false,
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (args) {
            args.index = params.index;

            args.topYn ="Y";
            drawNextOption(args);
            args.topYn="N";
            drawNextOption(args);

        }
    });
}

/**
 * 다음 옵션 li 추가
 */
function drawNextOption(args) {
    var selectId="";
    var name="";
    var top="";

    if(args.topYn=='Y'){
        selectId="pdStickySelSize";
        name = "pdSelSize";
        top="_top";
    }else{
        selectId="pdSelSize";
        name = "pdStickySelSize";
    }

    var item = args.opt;
    var html="";
    var index =args.index;
    var nextIndex =parseInt(index)+1;

    for(var i = 0 ; i < item.length; i++) {

        var soldout="";
        //var dataStock="";
        var resveDlvyDate ="";

        if(item[i].itmStatCd != 'SALE_PROGRS') {
            soldout = "disabled";
        }else{
          /*  if(Number(item[i].totUsefulInvQty) <= 5 && Number(item[i].totUsefulInvQty) > 0 && params.hasNextOpt !="true"){
                dataStock =  item[i].totUsefulInvQty;
            }*/
        }

        if(item[i].totUsefulInvQty <= 0){
            soldout = "disabled";
        }

        if(item[i].resveSaleGodYn == 'Y') {
            resveDlvyDate = item[i].resveOrdDlivyPrearngeDate;
        }

        html += "<li>";
        html += "<label>";
        html += "<input type='radio' name='"+name+"_" + nextIndex + "' value='" + item[i].itmNo + "' totUsefulInvQty='"+item[i].totUsefulInvQty+"'resveOrdDlivyPrearngeDate='"+ resveDlvyDate +"' itmNm='"+item[i].itmNm+"' onchange='selectActive(\""+selectId+"_"+nextIndex+"\","+i+",\"option\");' onclick='selectGodOpt1(this);' index='"+nextIndex+"' optGodNo='"+item[i].godNo+"' optValCd='"+item[i].optValCd+"' "+soldout+"/>";
        html += "<span>";
        html += item[i].optValNm;
        if(item[i].stdSizeCd){
            html += "("+item[i].stdSizeCd+")";
        }
        html += "</span>";
        html += "</label>";
        html += "</li>";
    }

    var selectName="optSelect"+nextIndex+top;
    $("[name='"+selectName+"']").find("ul").html(html);
}

/**
 * 옵션 확인 영역 그리기
 */
function drawNotiOptionDiv(input) {
    var optGodNo =$(input).attr("optGodNo");
    var lastSalePrc =$("[name='lastSalePrc'][godNo='"+optGodNo+"']").val();
    if(lastSalePrc){
        lastSalePrc = addComma(lastSalePrc);
    }

    var $obj = $("div[name='qtyDiv'][godNo='"+optGodNo+"']");

    $obj.find(".tit").html($(input).attr("itmNm"));
    $obj.find(".price .num").html(lastSalePrc);
    var totUsefulInvQty = $(input).attr("totUsefulInvQty");
    var maxOrdQty = $(".maxOrdQty[godNo='"+optGodNo+"']").eq(0).val();

    if(totUsefulInvQty){//구매가능한 수량으로 셋팅
        if(parseInt(totUsefulInvQty) < parseInt(maxOrdQty) ) {
            $("[name='qtySpinner'][godNo='" + optGodNo + "']").attr("maxOrdQty", totUsefulInvQty);
        }else{
            $("[name='qtySpinner'][godNo='" + optGodNo + "']").attr("maxOrdQty", maxOrdQty);
        }
    }

    $("input[name='qtySpinner'][godNo='"+optGodNo+"']").val($("input[name='qtySpinner'][godNo='"+optGodNo+"']").eq(0).attr("minOrdQty"));//qty 초기화

    calculatePriceEach(optGodNo);
    calculateTotalPrice();

    $("div[name='qtyDiv'][godNo='"+optGodNo+"']").show();
    $(".total").show();
}

/**
 * 각 상품 금액 계산 [qtyDiv 영역]
 */
function calculatePriceEach(godNo){
    var qty =1;
    var salePrc = $("[name='lastSalePrc'][godNo='"+godNo+"']").eq(0).val();

    if($("[name='qtySpinner'][godNo='"+godNo+"']").eq(0).val()){
        qty = $("[name='qtySpinner'][godNo='"+godNo+"']").eq(0).val();
    }

    salePrc = parseInt(salePrc);
    qty = parseInt(qty);

    var cpstGodTotalPrice = salePrc * qty;
    cpstGodTotalPrice=addComma(cpstGodTotalPrice);
    $("[name='qtyDiv'][godNo='"+godNo+"']").find(".price .num").html(cpstGodTotalPrice);
}

/**
 * 상품 금액 총 합계
 */
function calculateTotalPrice(){

    var totalPrice = 0;

    var p = $("#pro-price").val();
    var qty = $("#pro_qty").val();
    
    console.log(p);
    var totalPrice = p*qty;
    totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

    $(".num").text(totalPrice);
    
   
}


/**
 * 수량 선택
 *
 */
function changeQty(obj) {
    //옵션 선택 여부 체크
    if(!$(obj).hasClass("aditGodQty")){
        if (!checkSizeSelected()) {
            return false;
        }
    }

    var qty = parseInt($(obj).val());
    var godNo= $(obj).attr("godNo");
    var maxOrdQty = parseInt($(obj).attr("maxOrdQty"));
    var minOrdQty = 1;

    if($(obj).attr("minOrdQty")){
        minOrdQty=$(obj).attr("minOrdQty");
    }

    if (maxOrdQty == 0 || maxOrdQty > _itmMaxQty) {
        maxOrdQty = _itmMaxQty;
    }

    if (qty < 1) {
        alert("주문 가능한 최소 수량입니다.");
        $("input[name='qtySpinner'][godNo='"+godNo+"']").val(1);
        return;
    }

    if (minOrdQty > 0 && qty < minOrdQty) {//최소주문수량보다 작을때
        alert("최소 주문 가능한 수량은 "+minOrdQty+" 개 입니다.");
        $("input[name='qtySpinner'][godNo='"+godNo+"']").val(minOrdQty);
    } else if (maxOrdQty > 0 && qty > maxOrdQty) { //최대 주문수량보다 클때
        alert("최대 주문 가능한 수량은 "+maxOrdQty+" 개 입니다.");
        $("input[name='qtySpinner'][godNo='"+godNo+"']").val(maxOrdQty);
    }else{
        $("input[name='qtySpinner'][godNo='"+godNo+"']").val($(obj).val()); //위아래 두개존재
    }

    calculatePriceEach(godNo);
    calculateTotalPrice();
}


/**
* 상품 전체 옵션 선택 여부 체크
* @returns {Boolean}
*/
function checkSizeSelected() {
    var godTpCd =  $("#godTpCd").val();
    var noselect = true;

    if(godTpCd =="PCKAGE_GOD"){
        var cpstGodCount = parseInt($("#cpstGodCount").val());

        for(var i=0 ; i < cpstGodCount ; i++){
            var optCount=$("#optionCount"+i).val();
            var checkedCount =0;

            $("[name^='pdSelSize_"+i+"']").each(function (index2) {

                if($(this).is(":checked")){
                    checkedCount+=1;
                }

            })

            if(checkedCount!=optCount) {
                noselect=false;
            }
        }
    }else{
        var optCount = $("#optionCount").val();
        var checkedCount =0;

        for(var i=0 ; i < optCount ; i++) {
            if($("[name^='pdSelSize_"+i+"']").is(":checked") || $("[name^='pdStickySelSize_"+i+"']").is(":checked")){
                checkedCount+=1;
            }
        }

        if(checkedCount!=optCount) {
            noselect=false;
        }
    }

    if(!noselect){
        return false;
    }
    return true;
}


/**
 * 쇼핑백
 */
$("[name='btnShoppingBag']").on("click",function () {
    addBasket();
});

function addBasket(){
    if (!preventCartDblClk){
        formDataSet();//form data 셋팅

        if (validation()) {
            preventCartDblClk = true;
            $.ajax({
                type: "POST",
                async: false,
                url: "/public/cart/add.json",
                data: $('#goodsForm').serialize(),
                beforeSend: function (request) {
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfName = $("meta[name='_csrf_header']").attr("content");
                    request.setRequestHeader(csrfName, csrfToken);
                },
                success: function (data) {
                    if (data.msg == 'success') {
                        layer.open("layerShoppingBag");
                        getOrdDcPrmGod();//주문할인 상품 대상 조회

                        try{
                            //WIDERPLANET  SCRIPT
                            var bskGodItmQty = parseFloat($('#bskGodItmQty').val());
                            AW_PRODUCT(bskGodItmQty);
                        }catch (e) {
                            console.log(e);
                        }

                        try{
                            addCartGA();//GA태그 호출
                        }catch (e) {
                            console.log(e);
                        }
                        
                        //braze Web - CartQty Attribute send
                        try{
                     	   appboy.getUser().setCustomUserAttribute("cart_qty", data.cartCnt);
                     	   addCartBraze();
                        }catch (e) {
                            console.log(e);
                        }

                        // Recopick 장바구니 담기 로깅
                        try {
                            var bskGodNo = $("[name='god.godNo']").val();
                            var bskGodQty = $("[name='god.itmQty']").val();
                            recoPick('sendLog', 'basket', {id:bskGodNo, count:bskGodQty});
                        } catch (e) {
                            console.log(e);
                        }
                        
                        // Doyouad Cart
                        try {
	                        var DOYOUAD_DATA = {};
	                        DOYOUAD_DATA.qty= $("[name='god.itmQty']").val();
	                        DOYOUAD_DATA.price= parseFloat($("[name='lastSalePrc'][godNo='" + $("[name='god.godNo']").val() + "']").eq(0).val());
	                        (function (w, d, s, n, t) {n = d.createElement(s);n.type= "text/javascript";n.setAttribute("id", "doyouadScript");n.setAttribute("data-user", "hmall");n.setAttribute("data-page", "basket");n.async= !0;n.defer = !0;n.src = "https://cdn.doyouad.com/js/dyadTracker.js?v=" + new Date().toISOString().slice(0, 10).replace(/-/g, "");t = d.getElementsByTagName(s)[0];t.parentNode.insertBefore(n, t);})(window, document, "script");
                        } catch (e) {
                            console.log(e);
                        }
                        
                        //Appier Traking : Add to Shopping Cart
                        try{
                        	var appierRtAddToCart =[];
                        	
	                        appierRtAddToCart.push({
	                   			productID : $("[name='god.godNo']").val(), 
	                        	unit : $("[name='god.itmQty']").val(),
	                            price : $("[name='lastSalePrc'][godNo='" + $("[name='god.godNo']").val() + "']").eq(0).val()
	                		});
	                         
	                        window.appier_q = window.appier_q || [];
	                        window.appier_q.push(
	                        		{"t": "register", "content": { "id": "52bd", "site": "hfashionmall.com" }},
	                        		{"t": "type_addcart", "itemList":appierRtAddToCart, "action_id": "AddToCart_d4a1", "track_id": "f7acd2e2d0f37e8"}
	                        );
                     	   
                        }catch (e) {
                            console.log(e);
                        }

                        preventCartDblClk = false;
                        return;
                    } else {
                        alert(data.errMsg);
                        preventCartDblClk = false;
                        if (data.rtncode < 1) {
                            location.reload();
                        }
                    }
                },
                error: function (xhr) {
                    var data = $.parseJSON(xhr.responseText);
                    alert(data.message);
                    preventCartDblClk = false;
                }
            });

        }
    }
}

function addCartGA() {
    //구글 GA 태그 삽입
    window.dataLayer = window.dataLayer || [];
    var tempArr =[];

    $(".option-bot").eq(0).find("div[name='qtyDiv']").each(function (){
        var selectOptionYn = $(this).attr("selectOptionYn");
        var temp = {};

        if (selectOptionYn == 'Y') {//패키지 일때 다시 해야함
            var relatedGodYn = $(this).hasClass("aditQtyDiv");
            var godNo = $(this).attr("godNo");
            var godNm="";
            var price=0;
            var brndNm="";
            var qty=0;
            var categoryNm="";
            var color ="";

            if (relatedGodYn) {//추가구성상품 일때
                godNm = $("#aditGodNm").val();
                price = parseFloat($("[name='lastSalePrc'][godNo='" + godNo + "']").eq(0).val());
                brndNm =$("#aditGodBrndNmByThird").val();
                categoryNm=$("#aditGodDspCtgryNm").val();
                color = $("#aditGodColor").val();
                if($("#aditProductOption").find("[optCd='COLOR_OPT']").length > 0 &&  $("#aditGodColor").val()=="") {
                    color = $("#aditProductOption").find("[optCd='COLOR_OPT'] option:selected").attr("optValNm");
                }
                qty = parseFloat($(this).find("[name='qtySpinner']").val());
            } else {
                godNm = $("#godNm").val();
                price = parseFloat($("[name='lastSalePrc'][godNo='" + godNo + "']").eq(0).val());
                brndNm = $("#brndNm").val();
                categoryNm=$("#cateNmbyGA").val();
                color = $("#colorGrpNm").val();
                if (godNo == $(".gnrlOpt [optCd='COLOR_OPT']").attr("optgodno")  && $("#colorGrpNm").val()=="") {
                    color = $(".gnrlOpt [optCd='COLOR_OPT'] option:selected").attr("optValNm");
                }
                qty = parseFloat($(this).find("[name='qtySpinner']").val());
            }

            temp.id = godNo;
            temp.name = godNm;
            temp.price = price;
            temp.brand = brndNm;
            temp.category = categoryNm;
            temp.variant = color;
            temp.quantity = qty;
        }

        if(Object.keys(temp).length > 0){
            tempArr.push(temp);
        }
    });

    dataLayer.push({
        'event': 'ecommerce-add',
        'ecommerce': {
            'add': {
                'products': tempArr
            }
        }
    });
}


function addCartBraze() {
	$(".option-bot").find("div[name='qtyDiv']").each(function (){
        var selectOptionYn = $(this).attr("selectOptionYn");
        
        if (selectOptionYn == 'Y') {
            var relatedGodYn = $(this).hasClass("aditQtyDiv");
            var godNo = $(this).attr("godNo");

            var priceVal =0;
            var godNm="";
            var brndNm="";

            var sizeNm = "";
            var colorGrpNm = "";
            var categoryNo="";

            if (relatedGodYn) {//추가구성상품 일때
                godNm = $("#aditGodNm").val();
                brndNm =$("#aditGodBrndNmByThird").val();

                if($("#aditProductOption").find("[optCd='SIZE_OPT']").length > 0){
                	//sizeNm = $("#aditProductOption").find("[optCd='SIZE_OPT'] option:selected").attr("optValNm");
                }

                colorGrpNm = $("#aditGodColor").val();
                if($("#aditProductOption").find("[optCd='COLOR_OPT']").length > 0 &&  $("#aditGodColor").val()=="") {
                	colorGrpNm = $("#aditProductOption").find("[optCd='COLOR_OPT'] option:selected").attr("optValNm");
                }

                
            } else {
            	 godNm = $("#godNm").val();
                 brndNm = $("#brndNm").val();
                
                $("div.gnrlOpt").find("[optCd='SIZE_OPT']").find("li").each(function (){
                	var itemCd =  $(this).find("label").find("[name=pdStickySelSize_0]").attr("value");
                	if(itemCd == $("#itmNo0").val()){
                		sizeNm =  $(this).find("label").find("[name=pdStickySelSize_0]").attr("itmnm");
                		console.log(sizeNm);
                	}
            	});
                
                colorGrpNm = $("#colorGrpNm").val();

            }
          
            priceVal = parseFloat($("[name='lastSalePrc'][godNo='" + godNo + "']").eq(0).val());
            categoryNo=$("#aditGodDspCtgryNo").val();
            
            appboy.logCustomEvent("hfashion_addtocart", {
				size : sizeNm,
  				cateNo : categoryNo,
  				brand : brndNm,
  				prdNo : godNo,    
  				price : priceVal,
  				color : colorGrpNm
			});
        }
    });
}

/**
 * 상품상세 공통 배너 조회
 */
function getComnImgBannerCnr() {
    $.ajax({
        type: "GET",
        url: "/product/selectImgCnrTmplate",
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $("#stickyOption").append(data);
        },
        error: function (pa_data, status, err) {

        }
    });
}


/**
 * 해당 상품 연관 기획전 배너 조회
 */
function getRelatedPromtList() {
    var _godNo = $("#thisGodNo").val();

    $.ajax({
        type: "GET",
        url: "/product/selectProductRelatedPrompList",
        data : {"godNo" : _godNo },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $("#viewContentsList2").html(data);
            if($("#viewContentsList2").find("li").length < 1){
                $(".promtCorner").remove();
            }else{
                if($("#viewContentsList2").find("li").length > 4){
                    slide.create('viewContentsList2'); //연관 기획전
                }
            }
        },
        error: function (pa_data, status, err) {}
    });
}

function getMoreRelatedPromtList(pageNo) {
    $.ajax({
        type: "GET",
        url: "/product/selectProductRelatedPrompList",
        data : {"godNo" : $("#thisGodNo").val() ,"pageNo" : pageNo},
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            slide.obj.viewContentsList2.appendSlide(data);
            slide.obj.viewContentsList2.update();
            $("#productpromtPageNo").val(pageNo);
        },
        error: function (pa_data, status, err) {}
    });
}

/**
 * 해당 상품 연관 콘텐츠(아티클) 배너 조회
 */
function getRelatedArticleList() {
    var _godNo = $("#thisGodNo").val();

    $.ajax({
        type: "GET",
        url: "/product/selectProductRelatedArticleList",
        data : {"godNo" : _godNo },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $("#viewContentsList").html(data);

            if($("#viewContentsList").find("li").length < 1){
                $(".articleCorner").remove();
            }else{
                if($("#viewContentsList2").find("li").length > 4) {
                    slide.create('viewContentsList'); //연관 기획전
                }
            }
        },
        error: function (pa_data, status, err) {}
    });
}

function getMoreRelatedArticleList(pageNo){
    $.ajax({
        type: "GET",
        url: "/product/selectProductRelatedArticleList",
        data : {"godNo" : $("#thisGodNo").val() ,"pageNo" : pageNo },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            slide.obj.viewContentsList.appendSlide(data);
            slide.obj.viewContentsList.update();
            $("#productArticlePageNo").val(pageNo);
        },
        error: function (pa_data, status, err) {}
    });
}

/**
 * 옵션 초기화
 * @param prmNo
 */
function resetOptionDiv(obj) {
    var optGodNo =$(obj).closest("[name='qtyDiv']").attr("godNo");
    var relatedGodYn = $(obj).closest("[name='qtyDiv']").hasClass("aditQtyDiv");

    $("[name='qtyDiv'][godNo='"+optGodNo+"']").attr("selectOptionYn","N");
    $("[name='qtyDiv'][godNo='"+optGodNo+"']").hide();

    if(relatedGodYn){
        //레이어 초기화
        $("#aditProductOption").html("");
        $('.layer-add-item .item-sel-list').find("[name='addItemSel']").prop("checked",false);
        $(".setDivRelatedGodNm").html("추가구성상품을 선택하세요.");
        $("#btnAditGod").prop("disabled",true);

        $("#basketDiv").html("");

    }else{
        resetSelectOption(0);
        $("#resveOrdDlivyDateStr").hide();
    }

    calculateTotalPrice();
}

/**
 * 함께 본 상품 조회 [레코픽]
 */
function getRecoGoods(){

    $.ajax({
        type: "GET",
        async: true,
        dataType: "html",
        url: "/ui3/main/getKwdRankingGod",
        data: { 'godNo': $("#thisGodNo").val() },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $("#productSlideList3").html(data);

            if($("#productSlideList3").find("li").length < 1){//없을때 영역삭제
                $(".recopickList").remove();
            }else{
                if($("#productSlideList3").find("li").length > 5){
                    slide.create('productSlideList3');//레코픽 상품 슬라이드
                }
                getBukmk();
            }
        },
        error: function (pa_data, status, err) {
            $(".recopickList").remove();
        }
    });
}

/**
 * 상품상세 이동
 */
function goProductDetail(obj){
    var godNo = $(obj).attr("godNo");
    var url="/product/"+godNo+"/detail";
    
    var promtSn = $(obj).attr("promtSn");
    if(promtSn != ""){
    	url += "?promtSn="+promtSn
    }
    
    if($(obj).attr("colorSoldOutFlag")=='Y'){
        alert("선택하신 옵션은 품절되었습니다.");
        return;
    }else{
        location.href=url;
    }
}

/**
 * 주문할인 상품 조회
 */
function getOrdDcPrmGod(){
    $.ajax({
        type: "GET",
        async: true,
        dataType: "html",
        url: "/product/getOrdDcPrmGodList",
        data: { 'godNo': $("#thisGodNo").val() , 'imageUrl': $("#defaultImage").val() },
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $("#layerShoppingBag").find(".item-slide").html(data);
        },
        error: function (pa_data, status, err) {
        }
    });
}



/**
 * 이상품과 비슷한 이미지 상품 검색[이미지 검색 솔루션 이용]
 */
function getSimilarProduct(){
    if($("#defaultImage").val()) {
        $.ajax({
            async: true,
            dataType: "html",
            url: "/ui2/product/getImgSearchSimilar",
            data: {'imageUrl': $("#defaultImage").val()},
            beforeSend: function (request) {
                var csrfToken = $("meta[name='_csrf']").attr("content");
                var csrfName = $("meta[name='_csrf_header']").attr("content");
                request.setRequestHeader(csrfName, csrfToken);
            },
            success: function (data) {
                $("#productSlideList").html(data);
                if ($("#productSlideList").find("li").length < 1) {//없을때 영역삭제
                    $(".styleSearchList").remove();
                } else {
                    if($("#productSlideList").find("li").length > 5){
                        slide.create('productSlideList');//이미지 검색 상품 슬라이드
                    }
                    getBukmk();
                }
            },
            error: function (pa_data, status, err) {
                $(".styleSearchList").remove();
            }
        });
    }else{
        $(".styleSearchList").remove();
    }
}


$(document).ready(function () {
    var _godNo = $("#thisGodNo").val();
    
    if(_godNo == undefined){
        return;
    }
    
    getQnaList('1', _godNo); // 상품 Q&A 목록 호출
    getReviewList('1','','','Y'); // 상품 리뷰 목록

    getComnImgBannerCnr(); //공통 이미지 배너 코너 조회

    getSimilarProduct();//이미지 검색 유사상품 조회
    getRecoGoods(); //레코픽 호출

    if($(".loginYn").eq(0).val()=='Y'){
        getBukmk(); //비동기 좋아요 체크
    }

    slide.create('pdViewSlide');//상품 이미지 슬라이더

    if($("#giftSlide").find(".swiper-slide").length > 1){
        slide.create('giftSlide');
    }

    getRelatedPromtList();//연관기획전 조회
    getRelatedArticleList();//연관 아티클 조회

    //네이버 ep 쿠폰 다운로드 팝업
    if($("#layerNaverCoupon").length > 0) {
        layer.open('layerNaverCoupon');
    }

    try{
        //구글 GA 태그 삽입
        window.dataLayer = window.dataLayer || [];
        dataLayer.push({
            "event": "ecommerce-detail",
            'ecommerce': {
                'detail': {
                    'products': [{
                        'name': $("#godNm").val() ,  // 상품의 이름을 넣는다.
                        'id': $("#thisGodNo").val(), // 상품의 고유 번호를 넣는다.
                        'price': $("#lastSalePrc").val(), // 상품의 가격을 넣는다.
                        'brand': $("#brndNm").val(), // 상품의 브랜드 이름을 넣는다.
                        'category': $("#cateNmbyGA").val()
                    }]
                }
            }
        });
    }catch (e) {
        console.log(e);
    }

    try{
        // 콘텐츠 조회 : 20160224 ViewContent Pixel Code
        if($("#trackerConfig").val()=='Y'){
            fbq('track', 'ViewContent', {
                content_name: $("#godNm").val(), // 상품명
                content_category: $("#adScriptCtgryNm").val() ,	// 상품 카테고리
                content_ids: "['"+$("#thisGodNo").val()+"']", // 상품아이디
                //content_type: 'product',
                content_type: 'product_group',
                value : $("#lastSalePrc").val(),	// 가격
                currency: 'KRW'
            });
        }
    }catch(e){
        console.log(e);
    }


    //window.detailReview = false;
    //$(window).on('scroll', function(){
    //    // review 위치를 기준으로 하려면 아래 조건으로
    //    // if ($(window).scrollTop() > $(window).height() && window.detailReview === false) {
    //    if ($(window).scrollTop() >  $('.anchor-section.product-detail-review').offset().top - $(window).height() && window.detailReview === false){
    //        window.detailReview = true;
    //        getReviewList('1','','','Y'); // 상품 리뷰 목록
    //    }
    //});

});