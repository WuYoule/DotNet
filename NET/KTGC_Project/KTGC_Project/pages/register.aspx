<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="KTGC_Project.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/easyui.css" rel="stylesheet" />
    <link href="css/icon.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.easyui.min.js"></script>
    <script src="js/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
        }

        #content {
            margin:0 auto;
            margin-top:30px;
            width:500px;
            height:400px;
            border:1px solid   	#EEE0E5;
        }
       
        
    </style>
    <script type="text/javascript">


    </script>
</head>
<body>

    <div style="height: 65px; width: 100%; margin: 0px auto; padding: 0px; text-align: center; background-color: #F7F7F7">
    </div>

    <div id="content">
     
            <div style="width:100%;height:40px;background-color: #F7F7F7;border-bottom:1px solid #EEE0E5">
                <p style="display:inline-block;margin-top:8px;margin-left:10px;font-size:18px;">注册</p>
            </div>
            <div style="padding: 20px 60px 10px 120px">
                <form id="ff" method="post">
                    <table cellpadding="5">
                        <tr>
                            <td>用户名称:</td>
                            <td>
                                <input   class="easyui-textbox" type="text" name="name" /></td>
                        </tr>
                        <tr>
                            <td>用户简称:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="email" /></td>
                        </tr>
                        <tr>
                            <td>用户密码:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="subject" /></td>
                        </tr>
                        <tr>
                             <td>用户类型:</td>
                            <td>
                            <select class="easyui-combobox" style="width:155px;height:23px;" name="language">
                                <option value="ar">教研员</option>
                                <option value="ar1">教师</option>
                                <option value="ar2">管理员</option>
                            </select>    
                            </td>
                        </tr>
                        <tr>
                             <td>所属区局:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="subject" /></td>
                        </tr>
                        <tr>
                             <td>所属学校:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="subject" /></td>
                        </tr>
                        <tr>
                             <td>用户学科:</td>
                            <td>
                                <input class="easyui-textbox" type="text" name="subject" /></td>
                        </tr>
                           <tr>
                             <td colspan="2">
                                 <a href="javascript:void(0)" style="margin-top:10px;float:right;display:inline-block;border:none;height:30px;width:80px;background-color:#66CD00;text-decoration:none;color:white;text-align:center;line-height:30px;"  onclick="submitForm()" >确定</a>
                           
                                <a href="javascript:void(0)" style="margin-top:13px;text-decoration:none;float:right;display:inline-block;margin-right:10px;color: #8470FF" onclick="clearForm()">返回</a>

                            </td>
                        </tr>
                        
                    </table>
                </form>
               
            </div>
        </div>

    
    <div style="text-align: center;margin-top:15px;">
        <img src="images/company.jpg" />
    </div>

</body>
</html>
