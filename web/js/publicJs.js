// js函数库
//在此处导入jquery要用这种方法
document.write("<script language='javascript' src='/xiaoneinew/js/jquery-1.7.js'></script>");
function changeStatus(obj) {
    // window.alert("ok"+obj.value);
    if(obj.value == "worker"){
        $(".gra_spe").hide();
        $(".worker_sep").show();
    }else if(obj.value=="graduate"){
        //jquery按照id去寻找一个控件
        // $("#gra_type").css("display","block");
        // $("#gra_uni").css("display","block");
        //jquery按照id去寻找控件集合
        $(".gra_spe").show();
        $(".worker_sep").hide();

    }
}
