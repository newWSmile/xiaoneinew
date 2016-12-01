<%--
  Created by IntelliJ IDEA.
  User: 军街
  Date: 2016/11/30
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <link rel="stylesheet" href="/xiaoneinew/css/head.css" type="text/css"/>
    <script type="text/javascript">
    function changeBG(o){
        o.style.backgroundColor="#5C75AA";
    }
    function changeBG2(o){
        o.style.backgroundColor="";
    }
</script>
    <div class="head1">
        <img class="img1" src="/xiaoneinew/images/front/top1.gif" />
        <img class="img2" src="/xiaoneinew/images/front/top2.jpg" />
        <img style="float: left;" src="/xiaoneinew/images/front/xnw3.jpg" />
        <ul class="navil">
            <li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a class="anavi" href="#">注册</a></li>
            <li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a class="anavi" href="#">设为首页</a></li>
            <li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a class="anavi" href="#">加入收藏</a></li>
            <li onmouseover="changeBG(this)" onmouseout="changeBG2(this)"><a class="anavi" href="#">帮助</a></li>
        </ul>
    </div>