/*
   기획전 코너 쿠폰 다운로드
   PromotionEnum.CouponIssueLimitReason
 	 * PRM_STAT_STPGE : 프로모션 상태 중지
     * TOT_ISSU_QTY_EXCESS : 총 발급 수량 초과
     * ISMCBTW_OFF : 발급기간 오프
     * IDBY_ISSU_QTY_EXCESS : ID별 발급 수량 초과
     * SUCCES : 성공
     * ADMIN_INQ : 관리자 문의
     * MBR_INFO_ABSNCE : 회원정보 부재
     * PROSISSU_SN : 기발급 일련번호
     * SN_EXST_NOT : 존재한지 않는 일련번호
     * SN_NONINPUT : 일련번호 미입력
     * NONISSU_TGT : 미발급 대상
 */
function cpnDown(prmNo) {

	$.ajax({
		type: "GET",
		async: false,
		url: "/special/downloadCpn.json",
		data: {'prmNo': prmNo},
		success: function (data) {
			var msg = "";
			if (data.result == 'SUCCES') {
				msg = "쿠폰이 다운로드 되었습니다. 발급 받으신 쿠폰은 마이페이지>나의 회원정보>쿠폰/포인트에서 확인 가능합니다.";
				alert(msg);
			} else if (data.result == 'NOT_LOGIN') {
				msg = "로그인 후 다운로드 받을 수 있습니다.";
				alert(msg);
				location.href = "/public/member/login";
			} else if (data.result == 'NONISSU_TGT') {
				msg = "참여 가능한 회원유형/등급이 아닙니다.";
				alert(msg);
			} else if (data.result == 'ISMCBTW_OFF') {
				msg = "쿠폰 다운로드 기간이 종료되었습니다.";
				alert(msg);
			} else if (data.result == 'TOT_ISSU_QTY_EXCESS' || data.result == 'IDBY_ISSU_QTY_EXCESS') {
				msg = "발행한 쿠폰이 모두 소진되었습니다." ;
				alert(msg);
			} else if (data.result == 'PROSISSU_SN' ) {
				msg = "이미 발급된 쿠폰입니다." ;
				alert(msg);
			}
			else if (data.result == 'error') {
				msg = "다운로드 받을 수 없습니다.";
				alert(msg);
			}
		},
		error: function (pa_data, status, err) {
			alert("에러가 발생하였습니다.");
		}
	});

}

//타임세일 타이머
var timeSaleTimer;
function timeSaleCountDown(parentId, endDate) {
    if(endDate == undefined || endDate == '') {
        return;
    }
    var now =new Date();
    //var end = new Date(endDate);

    //yyyy-MM-dd HH:mm:ss
    var arEndDate = endDate.split(" ");
    var ymd = arEndDate[0];
    var hms = arEndDate[1];

    var arYmd = ymd.split("-");
    var arHms = hms.split(":");

    var mm = '' + Number(arYmd[1])-1;
    var end = new Date(arYmd[0],mm,arYmd[2],arHms[0],arHms[1],arHms[2]);

    var distance = end-now;
    var second =1000;
    var minute =second*60;
    var hour = minute*60;
    var day =hour*24;

    if(distance < 0){ //종료
        clearInterval(timeSaleTimer);
    }

    var days = Math.floor(distance/day);
    var hours = Math.floor((distance)/hour);
    var minutes = Math.floor((distance%hour)/minute);
    var seconds = Math.floor((distance%minute)/second);
    hours = (""+hours).length == 1 ? "0"+hours : ""+hours;
    minutes = (""+minutes).length == 1 ? "0"+minutes : ""+minutes;
    seconds = (""+seconds).length == 1 ? "0"+seconds : ""+seconds;
    //$("#days").html(days);
    $(parentId).find("#hours").html(hours);
    $(parentId).find("#minutes").html(minutes);
    $(parentId).find("#seconds").html(seconds);
}

function listTimeSaleCountDown(endDate, obj) {
    if(endDate == undefined || endDate == '') {
        return;
    }
    var now =new Date();
    //var end = new Date(endDate);

    //yyyy-MM-dd HH:mm:ss
    var arEndDate = endDate.split(" ");
    var ymd = arEndDate[0];
    var hms = arEndDate[1];

    var arYmd = ymd.split("-");
    var arHms = hms.split(":");

    var mm = '' + Number(arYmd[1])-1;
    var end = new Date(arYmd[0],mm,arYmd[2],arHms[0],arHms[1],arHms[2]);

    var distance = end-now;
    var second =1000;
    var minute =second*60;
    var hour = minute*60;
    var day =hour*24;

    if(distance < 0){ //종료
        clearInterval(timeSaleTimer);
    }

    var days = Math.floor(distance/day);
    var hours = Math.floor((distance)/hour);
    var minutes = Math.floor((distance%hour)/minute);
    var seconds = Math.floor((distance%minute)/second);
    
    hours = (""+hours).length == 1 ? "0"+hours : ""+hours;
    minutes = (""+minutes).length == 1 ? "0"+minutes : ""+minutes;
    seconds = (""+seconds).length == 1 ? "0"+seconds : ""+seconds;
    $('.label.'+obj).html(hours + ":" + minutes + ":" + seconds);
/*    $("#hours").html(hours);
    $("#minutes").html(minutes);
    $("#seconds").html(seconds);*/

}

function movePage(pageNo) {
	$("#currentPage").val(pageNo);
    selectProductList(true);
    //pagingScrollTop();
}

function pagingScrollTop() {
    window.scrollTo(0, $('.page-title').offset().top - $('.page-title').outerHeight(true));
}

function getNewBestGod(dspCtgryNo, otltYn, brndId, bestPageYn, godListSize, elementId, sortColumn){
	$.ajax({
		type : "GET",
		async : true,
		url : "/ui2/display/getBestGod",
		data : {"dspCtgryNo" : dspCtgryNo, "otltYn" : otltYn, "brndId" : brndId, "bestPageYn" : bestPageYn, "godListSize" : godListSize, "sortColumn" : sortColumn},
		beforeSend: function (request){
			var csrfToken = $("meta[name='_csrf']").attr("content");
			var csrfName = $("meta[name='_csrf_header']").attr("content");
			request.setRequestHeader(csrfName, csrfToken);
		},
		success: function(data) {
			if($(elementId + " .product-list").length > 0){
				$(elementId + " .product-list").html(data);
                getBukmk();
			}
		},
		error: function(pa_data, status, err) {
		},
		complete: function () {
		}
	});
}

function getBestGod(dspCtgryNo, otltYn, brndId, bestPageYn, godListSize, parentElementId){
	$.ajax({
		type : "GET",
		async : true,
		url : "/ui2/display/getBestGod",
		data : {"dspCtgryNo" : dspCtgryNo, "otltYn" : otltYn, "brndId" : brndId, "bestPageYn" : bestPageYn, "godListSize" : godListSize},
		beforeSend: function (request){
			var csrfToken = $("meta[name='_csrf']").attr("content");
			var csrfName = $("meta[name='_csrf_header']").attr("content");
			request.setRequestHeader(csrfName, csrfToken);
		},
		success: function(data) {
			if($("#" + parentElementId).length > 0){
				$("#" + parentElementId).html(data);
                getBukmk();
			}
		},
		error: function(pa_data, status, err) {
		},
		complete: function () {
		}
	});
}

function getGodIconList(grdCd, divid) {
    initIconStorage();
    var prdli = $(divid).find("li");
    if(prdli.length > 0) {
        prdli.each(function (i) {
            var godNo = $(this).attr("godno");
            callGodIconStorage(grdCd, godNo, divid);
        });
    }
}

function initIconStorage() {
    var initStrgDt = window.localStorage.getItem("ICON_INIT_DT" );
    var now = new Date();

    var initdt ;
    if(initStrgDt != null) {
        initdt = JSON.parse(initStrgDt);

        //initdt가 3시간이 지났으면 all clear
        var edt = initdt + (1000*60*60 * 5);
        if(now.getTime() > edt) {
            //var storage = window.localStorage;
            var o = Object.keys(window.localStorage);
            for(var i=0; i<o.length; i++) {
                var key = o[i];
                if(key.indexOf('GNRL') > -1 || key.indexOf('EMP') > -1) {
                    window.localStorage.removeItem(key);
                }
            }
            window.localStorage.setItem("ICON_INIT_DT" , JSON.stringify(now.getTime()));
        }
    }
    else {
        window.localStorage.setItem("ICON_INIT_DT" , JSON.stringify(now.getTime()));
    }
}

/*
 * 1. localStorage godno+ "_" + grdCd 에 godNo가 있는 지 check
 * 2. 있을경우 expiredate 체크
 * 3.   expire일 경우 ajax call -> storage 저장 -> draw
 * 4.   expire 아닐 경우 draw
 * 5. 없을경우 ajax call -> storage 저장 -> draw
 */
function callGodIconStorage(grdCd, godNo, divid) {
    var iconList = window.localStorage.getItem(grdCd + "_" + godNo );
    var icon = {};
    if(iconList != null && iconList != '') {
        icon = JSON.parse(iconList);

        var now = new Date();
        if (now.getTime() < new Date(icon.expiredt).getTime()) {
            drawIconList(godNo, icon.icon, divid);
        }
        else {
            callAjaxGodIconList(grdCd, godNo, divid);
        }
    }
    else {
        callAjaxGodIconList(grdCd, godNo, divid);
    }
}

//ajax call -> storage 저장 -> draw
function callAjaxGodIconList(grdCd, godNo, divid) {
    var param = "grdCd=" + grdCd + "&godNo=" + godNo;

    $.ajax({
        type: "GET",
        url: "/ui4/display/getGodIconList.json",
        data: param,
        contentType :  "application/json",
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if(data != null && data.iconList != null && data.iconList.length > 0) {
                var newIcon = {};
                var now = new Date();
                var expiredt = new Date(Date.parse(now) + (1000*60*5));
                newIcon['expiredt'] = expiredt.getTime();

                var strgIconList = [];
                for(var i=0; i<data.iconList.length; i++) {
                    var strgIcon = {};
                    strgIcon['iconTurn'] = data.iconList[i].iconTurn;
                    strgIcon['iconNm'] = data.iconList[i].iconNm;
                    strgIconList.push(strgIcon);
                }
                newIcon['icon'] = strgIconList;
                window.localStorage.setItem(grdCd + "_" + godNo , JSON.stringify(newIcon));

                drawIconList(godNo, data.iconList, divid);
            }
            else {
                window.localStorage.removeItem(grdCd + "_" + godNo);
            }
        },
        error: function (pa_data, status, err) {
        }
    });

}

function drawIconList(godNo, iconList, divid) {
    var iconhtml = "";
    var viewIcon = true;
    var cnt = 0;

    for(var i=0; i<iconList.length; i++) {

        if(viewIcon) {
            if(iconList[i].iconTurn == '1') {
                iconhtml = iconhtml+ "<span class=\"label2\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '2') {
                iconhtml = iconhtml+ "<span class=\"label5\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '3') {
                iconhtml = iconhtml+ "<span class=\"label3\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '4') {
                iconhtml = iconhtml+ "<span class=\"label2\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '5') {
                iconhtml = iconhtml+ "<span class=\"label2\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '6') {
                iconhtml = iconhtml+ "<span class=\"label3\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '7') {
                iconhtml = iconhtml+ "<span class=\"label2\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '8') {
                iconhtml = iconhtml+ "<span class=\"label3\">" + iconList[i].iconNm + "</span> ";
            }
            if(iconList[i].iconTurn == '9') {
                iconhtml = iconhtml+ "<span class=\"label2\">" + iconList[i].iconNm + "</span> ";
            }

            if(iconList[i].iconTurn == '1' || iconList[i].iconTurn == '2' || cnt > 4) {
                viewIcon = false;
            }
            cnt++;
        }
    }
    $(divid).find("li[godno='"+godNo+"']").find(".item-label").show();
    $(divid).find("li[godno='"+godNo+"']").find(".item-label").html(iconhtml);
}

//특수 문자 검사
function specialTextCheck(id){
    var hdivCheck = /.*[<>/\\:]+.*/gm;
    if (hdivCheck.test($('#'+id).val())) {
        return false;
    }
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

