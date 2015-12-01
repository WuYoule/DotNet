<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="KTGC_Project.pages.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        body {
            background-color: #FFA500;
        }

        #content {
            margin: 4% auto;
            width: 60%;
            height: 450px;
            border: none;
            border-radius: 5px;
            opacity:0;
        }

        #tab {
            margin-left: 10px;
            width: 100%;
            height: 100%;
        }

        .modDiv {
            width: 150px;
            height: 150px;
            border: 1px solid #CFCFCF;
            border-radius: 8px;
            box-shadow: #666 0px 0px 10px;
        }
        a {
            margin-top:10px;
            display:inline-block;
            width:100%;
            text-align:center;
          color:white;
        }
    </style>
</head>
<body>
    <div id="content">
        <table id="tab">
            <tr>
                <td>
                    <div class="modDiv"></div>
                    <a>xxz管理</a>
                </td>
                <td>
                    <div class="modDiv"></div>
                    <a>xxz管理</a>
                </td>
                <td>
                    <div class="modDiv"></div>
                    <a>xxz管理</a>
                </td>
                <td>
                    <div class="modDiv"></div>
                    <a>xxz管理</a>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="modDiv"></div>
                    <a>xxz管理</a>
                </td>
                <td>
                    <div class="modDiv"></div>
                    <a>xxz管理</a>
                </td>
                <td>
                    <div class="modDiv"></div>
                    <a>xxz管理</a>
                </td>

                <td>
                    <div class="modDiv"></div>
                     <a>xxz管理</a>
                </td>
               
            </tr>
        </table>

    </div>
</body>
</html>
