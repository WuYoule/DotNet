<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="KTGC_Project.pages.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/easyui.css" rel="stylesheet" />
    <link href="css/icon.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script src="js/easyui-lang-zh_CN.js"></script>
    
    <style type="text/css">
        body {
         margin:0px;
         padding:0px;
        }
        #nei1
        {
            background-image: url(images/login_bg.jpg);
            margin: 0 auto;
            width: 705px;
            height: 287px;
            background-repeat: no-repeat;
            background-position: center center;
            position: relative;
            padding-top: 70px;
            margin-top:80px;
        }
    </style>
</head>
<body onkeydown="if (event.keyCode==13) {document.getElementById('Button1').click();}">
   
    <form id="form1" runat="server">
    <div style="height: 65px;width:100%; margin: 0px auto;padding:0px; text-align: center; background-color:#F7F7F7">
    
    </div>
    <div id="nei">
        <div id="nei1">
            <table width="400" border="0" cellspacing="0" cellpadding="0" style="margin: 50px auto;">
                <tr>
                    <td width="100" height="40" align="center" valign="middle">
                        用户名：
                    </td>
                    <td width="100" align="center" valign="middle">
                        <input type="text" class="easyui-textbox" runat="server" style="height:30px;" name="userNameField" id="txt_username" />
                    </td>
                    <td width="130" rowspan="2" align="right">
                        <input id="Button1" type="button" value="button" style="display: none" onclick="login_ing()" />
                        <img class="anim_image" src="images/logo.jpg" border="0" style="cursor:pointer" onclick="javascript:void(0)" />
                    </td>
                     <td width="130" rowspan="2" align="right" valign="bottom" style="padding-bottom:4%;">
                        <%--<a href="javascript:void(0)" style="text-decoration:none;color:#4876FF">注册</a>--%>
                    </td>
                </tr>
                <tr>
                    <td width="100" height="40" align="center" valign="middle">
                        密&nbsp;&nbsp;&nbsp;码：
                    </td>
                    <td width="100" align="center" valign="middle">
                        <input runat="server" class="easyui-textbox" type="password" name="passwordField" id="txt_pass" style="height:30px;" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="text-align: center;">
        <img src="images/company.jpg" /></div>
    </form>
  

</body>
</html>
