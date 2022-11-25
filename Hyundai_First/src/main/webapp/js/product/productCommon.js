

/**
 * 쇼핑백/바로구매 시 form 데이터 셋팅
 */
function formDataSet() {
    var godTpCd = $('#godTpCd').val();
    var dlvSect = $("input[name='dlvSect']").eq(0).prop('checked');

    if (!dlvSect || dlvSect == null || dlvSect == '') {
        dlvSect = "GNRL_DLV";
        $("#bskGodPkupShopId").val("");
        $("#bskGodPkupShopVisitDate").val("");
    }else{
        dlvSect = "PKUP_DLV";
    }

    $("#bskGodDlvSectCd").val(dlvSect);

    if (godTpCd == "SET_GOD" || godTpCd == "PCKAGE_GOD") {//세트,팩키지 인경우

    } else if (godTpCd == "GFCT") {

    }else {
        var itmNo = $('#itmNo0').val();
        if(itmNo){
            $('#bskGodItmNo').val(itmNo);
            $('#bskGodPckageGodYn').val('N');

            var $optionDiv = $(".option-bot").eq(0);

            $optionDiv.find(".gnrlOptQty").each(function(){
                var selectOptionYn =$(this).attr("selectOptionYn");
                var godNo = $(this).attr("godNo");

                if(selectOptionYn=='Y'){
                    $('#bskGodItmQty').val(parseInt($(this).find("[godNo='"+godNo+"'][name='qtySpinner']").val()));
                }
            });

            //예약상품은 일반상품만
            //$('#formResveSaleGodYn').val($('#resveSaleGodYn' + $('#itmNo0').val()).val());
        }else{
            alert("옵션을 다시 선택해 주세요.");
            return false;
        }
    }

    if($(".aditQtyDiv").eq(0).attr("selectOptionYn")=='Y'){//추가 구성상품 선택시
        $("[name='hfmCpstGod.itmQty']").val($(".aditGodQty").eq(0).val());
    }
}

/**
 * 쇼핑백/바로구매 데이터 validate 체크
 */
function validation() {
    var valid = true;
    var godTpCd = $('#godTpCd').val();

    if (godTpCd == "SET_GOD" || godTpCd == "PCKAGE_GOD") {
        if (!checkSizeSelected()) {
            return false;
        }
    } else if (godTpCd == "GFCT") {
        //상품권 일경우 사이즈 체크 안함

    } else {
        if ($.trim($('#bskGodItmNo').val()) == '') {
            if (!checkSizeSelected()) {
                return false;
            }
            return false;
        }
    }

    return valid;
}


/**
 * 바로구매
 */

var preventOrderDblClk = false;

function orderNow(quickViewYn){//주문
    if(quickViewYn=='Y'){//상품상세 내에서도 퀵뷰가 뜰수 있음
        quickViewOrderNow();
    }else{
        if(!preventOrderDblClk){
            formDataSet();

            if (validation()) {
                preventOrderDblClk = true;
                
                //마이타미구매대상인지 확인 AJAX로 체크후 값 셋팅            
                if($("#myTmyTrgtYn").val() == "Y")
                {
                	var itmQty = $('#bskGodItmQty').val();
                	var ret = confirm("마이타미주문할래?");
                    if(ret == true)
                    {            						
            			if(itmQty == 1)
            			{            	            	
                    		$("#myTmyYn").val("Y");
            			}
            			else
            			{
            				alert("마이타미 주문은 1개만 주문 가능합니다.");
            				return;
            			}
                    }
                }
                
                $.ajax({
                    type : "POST",
                    async : false,
                    url : "/public/cart/add/orderNow.json",
                    data : $('#goodsForm').serialize(),
                    beforeSend: function (request)
                    {
                        var csrfToken = $("meta[name='_csrf']").attr("content");
                        var csrfName = $("meta[name='_csrf_header']").attr("content");
                        request.setRequestHeader(csrfName, csrfToken);
                    },
                    success : function(data) {
                        if(data.msg == 'success'){
                            preventOrderDblClk = false;
                            try{
                                AW_PRODUCT($(".option-bot").find("[name='qtySpinner']").eq(0).val());
                            }catch (e) {}

                            if($(".loginYn").eq(0).val()=='Y'){
                                location.href="/secured/order/new";
                            }else{
                                nonMemberOrder();
                            }
                        }else{
                            preventOrderDblClk = false;
                            alert(data.errMsg);
                        }
                    },
                    error: function(xhr) {
                        preventOrderDblClk = false;
                        var data = $.parseJSON(xhr.responseText);
                        alert(data.message);
                    }
                });
            }
        }
    }
}


/**
 * 비회원 주문
 */
function nonMemberOrder(){
    $.ajax({
        type : "POST",
        url : "/public/member/nonMbrOrder.json",
        async : false,
        beforeSend: function (request)
        {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success : function(args) {
            location.href='/secured/order/new';
        },
        error : function(e) {
        }
    });
}


/* ********************************************/
/* 추가구성상품                                 */
/* ********************************************/


/**
 * 추가구성상품 영역 클릭
 */
function clickCpstRelatedGod(){
    var dlvSect = $("input[name='dlvSect']").eq(0).prop('checked');

    if (dlvSect) {//매장픽업 체크확인
        if(confirm("추가구성상품을 함께 선택시 매장에서 수령하실 수 없습니다. 계속하시겠습니까?")){
            $("input[value='PKUP_DLV']").prop('checked',false);
            layer.open('layerAddItem');
        }
    }else{
        layer.open('layerAddItem');
    }
}


/**
 * 추가 구성상품 선택
 */
function selectAditGod(obj){
    var godNo = $(obj).attr("godNo");
    var godNm = $(obj).attr("godNm");
    var lastSalePrc =$(obj).attr("lastSalePrc");

    $("#btnAditGod").prop("disabled",true);

    var params = {};
    params.godNo = godNo;

    $.ajax({
        type: "GET",
        url: "/product/selectAditGodOpt",
        data : params,
        dataType: "html",
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            $("#aditProductOption").html(data);
            addItemFunc();
            $(".layer-bot-box .add-item-box").show();
            $("#aditProductNm").html(godNm);

            $("#aditGodNm").val(godNm);
            $("#aditGodRealPrice").val(lastSalePrc);

            $("#aditGodRealPrice").attr("godNo",godNo);
            $(".aditQtyDiv").attr("godNo",godNo);

            $("#aditGoodsMinOrdQty").val($(obj).attr("minOrdQty"));
            $("#aditGoodsMaxOrdQty").val($(obj).attr("maxOrdQty"));
        },
        error: function (pa_data, status, err) {}
    });
}

/**
 * 추가구성상품 선택완료
 */
function addAditGod(){
    var check =true;

    $("div[id^='aditGodOptSelect']").each(function (index) {
        console.log($("[name='addItemSel_"+index+"']:checked").val());
        var checkedVal = $("[name='addItemSel_"+index+"']:checked").val();

        if(checkedVal=="" || typeof checkedVal == "undefined"){
            check=false;
            alert("옵션을 선택해 주세요.");
            return false;
        }
    });

    if(check){
        var aditGodNm =$("#aditGodNm").val();
        var aditGodItmNm =$("#aditGodItmNm").val();
        var aditGodRealPrice =$("#aditGodRealPrice").val();
        var aditGodNo= $("#aditGodNo").val();

        var strAditGodRealPrice="";
        var minOrdQty=$("#aditGoodsMinOrdQty").val();
        var maxOrdQty=$("#aditGoodsMaxOrdQty").val();

        var html ="";
        html += "[추가]";
        html += "<span class='name'>";
        html += aditGodNm;
        html += "</span>";
        html += aditGodItmNm;
        $(".aditQtyDiv").find(".tit").html(html);

        strAditGodRealPrice=addComma(aditGodRealPrice);
        $(".aditQtyDiv").find(".num").html(strAditGodRealPrice);
        $(".aditQtyDiv").show();

        $(".setDivRelatedGodNm").html(aditGodNm);

        $(".aditGodQty").attr("godNo",aditGodNo);
        $(".aditGodQty").attr("minOrdQty",minOrdQty);
        if(parseInt($("#aditTotUsefulInvQty").val()) < parseInt(maxOrdQty)){
            $(".aditGodQty").attr("maxOrdQty",$("#aditTotUsefulInvQty").val());
        }else{
            $(".aditGodQty").attr("maxOrdQty",maxOrdQty);
        }

        //최종 객체 셋팅
        var hfmCpstInput1 = document.createElement("input");
        hfmCpstInput1.setAttribute("name", "hfmCpstGod.itmNo");
        hfmCpstInput1.setAttribute("value",$("#aditGodItmNo").val());

        var hfmCpstInput2 = document.createElement("input");
        hfmCpstInput2.setAttribute("name", "hfmCpstGod.godNo");
        hfmCpstInput2.setAttribute("value", aditGodNo);

        var hfmCpstInput3 = document.createElement("input");
        hfmCpstInput3.setAttribute("name", "hfmCpstGod.itmQty");
        hfmCpstInput3.setAttribute("value", minOrdQty);

        document.getElementById("basketDiv").appendChild(hfmCpstInput1);
        document.getElementById("basketDiv").appendChild(hfmCpstInput2);
        document.getElementById("basketDiv").appendChild(hfmCpstInput3);

        $(".aditGodQty").val(minOrdQty);
        $("div[name='qtyDiv'][godNo='"+aditGodNo+"']").attr("selectOptionYn","Y");

        layer.close('layerAddItem');
        calculateTotalPrice();
    }
}

/**
 * 추가구성상품 옵션 초기화
 */
function resetAditProductOption(index) {
    var optNm = $("#aditGodOptSelect"+index).find("ul").attr("optNm");

    $("[name='addItemSel_"+index+"']").prop("checked",false);
    $("#aditGodOptSelect"+index).find(".sel-btn").html(optNm+"를 선택하세요.");
    $("#aditGodOptSelect"+index).find(".sel-btn").removeClass("on");
}

/**
 * 추가구성상품 옵션 선택시
 */
function selectAditOption(obj){
    $("#btnAditGod").prop("disabled",true);

    var index =  $(obj).attr("index");
    var optValCd =  $(obj).attr("optValCd");
    var selectLength = $("div[id^='aditGodOptSelect']").length;
    var nextIndex =parseInt(index)+1;

    for(var j=nextIndex ; j < selectLength ; j++){
        resetAditProductOption(j);
    }

    if($(obj).attr("itmNo")==''){//옵션선택을 안할경우
        return false;
    }


    $("div[id^='aditGodOptSelect']").each(function (i) {
        if(i > 0){
            var beforeIndex = parseInt(i)-1;
            var beforeValue = $("[name='addItemSel_"+beforeIndex+"']:checked").val();

            if(beforeValue=="" || typeof beforeValue == "undefined"){
                if(index > i){
                    alert("상위옵션을 먼저 선택해 주세요.");
                    resetAditProductOption(index);
                    return false;
                }
            }
        }

    });

    if($("#aditGodHasOpt2").val() =="Y" || $("#aditGodHasOpt3").val() =="Y"){
        if(parseInt(index) ==2){//마지막 옵션 선택시
            $("#btnAditGod").prop("disabled",false);
            $("#aditGodItmNo").val($(obj).val());
            $("#aditGodItmNm").val($(obj).attr("itmNm"));
        }else{
            var params = {};

            if(parseInt(index) ==0){
                params.optValCd1 =optValCd;
            }else if(parseInt(index) ==1){
                var beforeIndex =parseInt(index)-1;
                var beforeSelected = $("[name='addItemSel_"+beforeIndex+"']:checked").attr("optValCd");

                params.optValCd1 =beforeSelected;
                params.optValCd2 =optValCd;
            }

            params.godNo = $("#aditGodNo").val();

            //다음 옵션 조회
            $.ajax({
                type: "POST",
                url: "/public/goods/selectGodDetailOpt",
                data: params,
                dataType: "JSON",
                cache: false,
                beforeSend: function (request) {
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfName = $("meta[name='_csrf_header']").attr("content");
                    request.setRequestHeader(csrfName, csrfToken);
                },
                success: function (args) {
                    var name="addItemSel";
                    var item = args.opt;
                    var html="";
                    var nextIndex =parseInt(index)+1;
                    var soldout="";
                    var optNm = $("#aditGodOptSelect"+nextIndex).find("ul").attr("optNm");

                    html += "<li>";
                    html += "<label>";
                    html += "<input type='radio' name='"+name+"_" + nextIndex + "' value='' itmNm='' onchange='selectAditOption(this);' index='"+nextIndex+"' optValCd='' />";
                    html += "<span>";
                    html += optNm+"를 선택하세요.";
                    html += "</span>";
                    html += "</label>";
                    html += "</li>";

                    for(var i = 0 ; i < item.length; i++) {
                        if(item[i].itmStatCd != 'SALE_PROGRS') {
                            soldout = "disabled";
                        }
                        if(item[i].totUsefulInvQty <= 0) {
                            soldout = "disabled";
                        }

                        html += "<li>";
                        html += "<label>";
                        html += "<input type='radio' name='"+name+"_" + nextIndex + "' value='" + item[i].itmNo + "' itmNm='"+item[i].itmNm+"' onchange='selectAditOption(this);' index='"+nextIndex+"' optValCd='"+item[i].optValCd+"' totUsefulInvQty='"+item[i].totUsefulInvQty +"' "+soldout+"/>";
                        html += "<span>";
                        html += item[i].optValNm;
                        if(item[i].stdSizeCd){
                            html += "("+item[i].stdSizeCd+")";
                        }
                        html += "</span>";
                        html += "</label>";
                        html += "</li>";
                    }

                    $("#aditGodOptSelect"+nextIndex).find("ul").html(html);
                }
            });
        }

    }else{//마지막 옵션 선택시22
        $("#btnAditGod").prop("disabled",false);
        $("#aditGodItmNo").val($(obj).val());
        $("#aditGodItmNm").val($(obj).attr("itmNm"));
        $("#aditTotUsefulInvQty").val($(obj).attr("totusefulinvqty"));

    }
}

/**
 * 가격 콤마
 */
function addComma(n) {
    var reg = /(^[+-]?\d+)(\d{3})/;
    n += '';
    while (reg.test(n)) {
        n = n.replace(reg, '$1' + ',' + '$2');
    }
    return n;
}


/**
 * 상품 옵션 선택시 픽업 재고 조회
 */
function getPkupInv(){
    resetPkupDiv();
    if($("#shopIds").val()!="" && $("#shopPkupPsbYn").val()=="Y" && $("#cnsgnSectCd").val() == "MCOM"){
        //일단 자사/일반상품만 고려[pdSelSize_0 고정]
        var params = {};
        var styColorSize = [];
        var optValCd= "";

        if($("[name='pdSelSize_0']").is(":checked") ){
            optValCd= $("[name='pdSelSize_0']:checked").attr("optValCd");
        } else if($("[name='pdStickySelSize_0']").is(":checked") ){
            optValCd= $("[name='pdStickySelSize_0']:checked").attr("optValCd");
        }

        styColorSize.push({
            "shopId" : $("#shopIds").val()
            , "dsgnGrpNo" : $("#dsgnGrpNo").val()
            , "godNo" :   $("#thisGodNo").val()
            , "colorCd" : $("#colorCd").val()
            , "optValCd" : optValCd
            //, "itmNo" : $("#itmNo0").val()
            ,"annlSectCd" : $("#annlSectCd").val()
        });

        params = { "goodsStockCheckDTOList" :  styColorSize};

        $.ajax({
            type: "POST",
            url: "/product/checkPickupStockList" ,
            traditional : true,
            dataType: "html",
            contentType: "application/json",
            data: JSON.stringify(params),
            beforeSend: function (request) {
                var csrfToken = $("meta[name='_csrf']").attr("content");
                var csrfName = $("meta[name='_csrf_header']").attr("content");
                request.setRequestHeader(csrfName, csrfToken);
            },
            success: function (data) {
                $("body").append(data);
                console.log($("#pkupShopList").find("tr").length);

                if($("#pkupShopList").find("tr").length < 1){
                    $("#layerShopDlvSel").remove();
                    $("[name='pkupDiv']").hide();
                }else{
                    $("[name='pkupDiv']").show();
                }
            }
        });
    }
}

/**
 * 픽업 영역 reset
 */
function resetPkupDiv() {

    if($("#layerShopDlvSel").length > 0){
        $("#layerShopDlvSel").remove();
    }

    if($("#layerShopDlv").length > 0){
        $("#layerShopDlv").remove();
    }

    $("#bskGodPkupShopId").val("");
    $("#bskGodPkupShopVisitDate").val("");

    $(".dlv-sel-shop").hide();
    $("input[value='PKUP_DLV']").prop('checked', false);
}


/**
 * 매장픽업 체크 이벤트
 */
function checkDlvSect(obj) {
    if( $(obj).prop("checked")==true){
        layer.open('layerShopDlvSel');
        $("input[value='PKUP_DLV']").prop('checked', true);
    }else{
        $("#bskGodPkupShopId").val("");
        $("#bskGodPkupShopVisitDate").val("");

        $(".dlv-sel-shop").hide();
        $("input[value='PKUP_DLV']").prop('checked', false);

        //온라인 재고로 재셋팅
        var totUsefulInvQty = $("[name='pdSelSize_0']:checked").attr("totUsefulInvQty");
        var maxOrdQty=$(".maxOrdQty[godNo='"+ $(obj).attr("godNo") +"']").val();
        if(parseInt(totUsefulInvQty) > parseInt(maxOrdQty)){//구매 가능한 수량으로 재셋팅
            $("[name='qtySpinner'][godNo='"+$(obj).attr("godNo")+"']").attr("maxOrdQty",maxOrdQty);
        }else{
            $("[name='qtySpinner'][godNo='"+$(obj).attr("godNo") +"']").attr("maxOrdQty",totUsefulInvQty);
        }

    }

    $('#layerShopDlvSel').on('beforeclose', function(){

        var formShopId = $("#bskGodPkupShopId").val();
        var formShopVisitDate = $("#bskGodPkupShopVisitDate").val();

        if(!formShopId || !formShopVisitDate){
            $("input[value='PKUP_DLV']").prop('checked', false);
        }
    });

    //$('#layerShopDlvSel').on('close', function(){
    //    console.log(2);
    //});
    //$('#layerShopDlvSel').on('afterclose', function(){
    //    console.log(3);
    //});
}

/**
 * 매장픽업 변경
 */
function updatePkukShop() {
    if($("#layerShopDlvSel").length > 0){
        layer.open('layerShopDlvSel');
    }
}

/**
 * 쿠폰 다운로드
 * @param prmNo
 */
function downloadCpn(prmNo,type){

    $.ajax({
        type: "GET",
        async: false,
        url: "/public/goods/detail/downloadCpn.json",
        data: {'prmNo': prmNo},
        beforeSend: function (request) {
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfName = $("meta[name='_csrf_header']").attr("content");
            request.setRequestHeader(csrfName, csrfToken);
        },
        success: function (data) {
            if (data.result == 'SUCCES') {
                alert("쿠폰이 발급되었습니다.");
                if(type=='naver'){
                    layer.close('layerNaverCoupon');
                }else{
                    location.reload();
                }
            } else if (data.result == 'NOT_LOGIN') {
                location.href = "/public/member/login";
            } else if(data.result =='IDBY_ISSU_QTY_EXCESS') {
                alert("다운로드 가능한 횟수를 초과 하였습니다.");
            } else if (data.result == 'error') {
                alert("다운로드시 에러가 발생하였습니다.");
            }else if(data.result =='NONISSU_TGT'){
                alert("발급 대상이 아닙니다.");
            }else{
                alert("다운로드시 에러가 발생하였습니다.");
            }
        },
        error: function (pa_data, status, err) {
            alert("다운로드시 에러가 발생하였습니다.");
        }
    });

}