<%--
  Created by IntelliJ IDEA.
  User: 军街
  Date: 2016/12/1
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/xiaoneinew/css/common.css" type="text/css"/>
    <script type="text/javascript" src="/xiaoneinew/js/publicJs.js"></script>
    <link rel="stylesheet" href="/xiaoneinew/css/register.css" type="text/css"/>
</head>
<body>
    <jsp:include page="head.jsp"/>
    <div class="reg_main_frame">
        <%--加入校内后可以选择...--%>
        <div class="play_item">
            <img  src="/xiaoneinew/images/front/jiaru.jpg" />
        </div>
        <%--注册用的表格--%>
        <div class="reg_table1">
           <span class="font6">简单一步，快速注册</span><br/>
            <table>
                <tr>
                    <td class="tab_td1">真实姓名:</td>
                    <td class="tab_td2"><input type="text" name="??"/></td>
                    <td><span class="spanVal" >请输入真实姓名</span></td>
                </tr>
                <tr>
                    <td class="tab_td1">性别:</td>
                    <td><input type="radio" name="sex"/>男 <input type="radio" name="sex"/>女</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tab_td1">身份:</td>
                    <td>
                        <select size="4" onchange="changeStatus(this);">
                            <option value="worker">已工作</option>
                            <option value="graduate">大学生</option>
                            <option value="midstu">中学生/中专技校</option>
                            <option value="nothing">以上都不是</option>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <%--考虑已经工作的情况  开始--%>
                <tr class="worker_sep">
                    <td class="tab_td1">居住地:</td>
                    <td>
                        <select>
                            <option>--请选择省份--</option>
                            <option>四川省</option>
                            <option>山东省</option>
                            <option>重庆市</option>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr class="worker_sep">
                    <td class="tab_td1">城市:</td>
                    <td>
                        <select>
                            <option>--请选择城市--</option>
                            <option>成都市</option>
                            <option>广元市</option>
                            <option>衡阳市</option>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr class="worker_sep">
                    <td class="tab_td1">公司:</td>
                    <td><input type="input" name="??"/></td>
                    <td></td>
                </tr>
                <%--考虑已经工作的情况  结束--%>

                <%--考虑大学生要输入的特别信息 start--%>
                <tr class="gra_spe">
                    <td class="tab_td1">类型:</td>
                    <td>
                        <select>
                            <option>大学生</option>
                            <option>硕士</option>
                            <option>博士</option>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr class="gra_spe">
                    <td class="tab_td1">大学:</td>
                    <td><input type="text" name="??"/> </td>
                    <td></td>
                </tr>
                <%--考虑大学生要输入的特别信息 end--%>
                <tr>
                    <td class="tab_td1">电子邮箱:<br/>&nbsp;</td>
                    <td><input type="text" name="??"/> <br/><img src="/xiaoneinew/images/front/tanhao.png"/>如果没有邮箱 请使用<a >Hotmail</a>邮箱</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tab_td1">设置密码:</td>
                    <td><input type="password" name="??"/> </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tab_td1">确认密码:</td>
                    <td><input type="password" name="??"/> </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="tab_td1">验证码:</td>
                    <td>请输入以下验证码，看不清换一张？ </td>
                    <td>[1234]</td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="" class="button1"/></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="checkbox"/><span class="font3">&nbsp;&nbsp;我已阅读并同意遵守校内网服务条款</span></td>
                    <td></td>
                </tr>
            </table>
        </div>

    </div>
    <jsp:include page="foot.jsp"/>
</body>
</html>
