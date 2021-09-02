<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/2
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>农场</title>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <style>
        #borders{
            width: 400px;
            height: 600px;
            margin: 0 auto;
        }
        #buyList{
            margin-top: 20px;
            text-align: center;
        }
        .tlist{
            border: 1px solid gainsboro;
            width: 100px;
            height: 30px;
        }
        #record{
            margin-top: 20px;
            text-align: center;
        }
        .tlist2{
            width: 100px;
            height: 30px;
        }

    </style>

</head>
<body>
    <div id="borders">
        <p style="font-size: 18px; text-align: center;">我的农场</p>
        农场主ID：<input type="text" name="" value="1"> &nbsp;
        金币：1000<br>
        农场主名称：张三
        <div id="buyList">
            <p style="font-size: 18px;">可购买的种子列表</p>
            <table>
                <tr>
                    <td>名称</td>
                    <td>价格</td>
                    <td>数量</td>
                    <td>操作</td>
                </tr>
                <tr>
                    <td>
                        <div class="tlist">水稻</div>
                    </td>
                    <td>
                        <div class="tlist">100</div>
                    </td>
                    <td>
                        <div class="tlist">1</div>
                    </td>
                    <td>
                        <a href="#" id="buy01">购买</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="tlist">玉米</div>
                    </td>
                    <td>
                        <div class="tlist">150</div>
                    </td>
                    <td>
                        <div class="tlist">1</div>
                    </td>
                    <td>
                        <a href="#" id="buy02">购买</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="tlist">马铃薯</div>
                    </td>
                    <td>
                        <div class="tlist">200</div>
                    </td>
                    <td>
                        <div class="tlist">1</div>
                    </td>
                    <td>
                        <a href="#" id="buy03">购买</a>
                    </td>
                </tr>

            </table>
        </div>
        <div id="record">
            <span style="font-size: 18px;">购买记录详情</span>&nbsp;
            <input type="button" value="查看">
            <table align="center">
                <thead>
                <tr>
                    <td>种子名称</td>
                    <td>购买数量</td>
                    <td>购买时间</td>
                </tr>
                </thead>
                <tbody id="farm">
                <%--<tr>
                    <td name="zzName">
                        <div class="tlist2"></div>
                    </td>
                    <td name="count">
                        <div class="tlist2"></div>
                    </td>
                    <td name="time">
                        <div class="tlist2"></div>
                    </td>
                </tr>--%>
                </tbody>
            </table>
        </div>
    </div>


    <script>
        //用map传参+json
        $('#buy01').click(function () {
            var map = {
                'zzName':'水稻',
                'count':'10',
                'time':'2010-08-27'
            }
            //第一步 构建一个 jquery dom元素
            var trDom=$("<tr><td><div class=\"tlist2\">水稻</div></td><td><div class=\"tlist2\">10</div></td><td><div class=\"tlist2\">2010-08-27</div></td></tr>");  //这叫做构建  jquery的dom元素
            $('#farm').append(trDom);  //追加只会在末尾加
            $.ajax({
                url:"/api/farm/buy01",
                type:'POST',
                dataType:'JSON',
                data:JSON.stringify(map),
                success:function (res) {
                    console.log(res)
                },
                contentType:"application/json;charset=utf-8"
            });
        });
        $('#buy02').click(function () {
            var map = {
                'zzName':'玉米',
                'count':'2',
                'time':'2010-08-27'
            }
            var trDom=$("<tr><td><div class=\"tlist2\">玉米</div></td><td><div class=\"tlist2\">2</div></td><td><div class=\"tlist2\">2010-08-27</div></td></tr>");  //这叫做构建  jquery的dom元素
            $('#farm').append(trDom);  //追加只会在末尾加
            $.ajax({
                url:"/api/farm/buy02",
                type:'POST',
                dataType:'JSON',
                data:JSON.stringify(map),
                success:function (res) {
                    console.log(res)
                },
                contentType:"application/json;charset=utf-8"
            });
        });
        $('#buy03').click(function () {
            var map = {
                'zzName':'马铃薯',
                'count':'15',
                'time':'2010-08-27'
            }
            var trDom=$("<tr><td><div class=\"tlist2\">马铃薯</div></td><td><div class=\"tlist2\">15</div></td><td><div class=\"tlist2\">2010-08-27</div></td></tr>");  //这叫做构建  jquery的dom元素
            $('#farm').append(trDom);  //追加只会在末尾加
            $.ajax({
                url:"/api/farm/buy03",
                type:'POST',
                dataType:'JSON',
                data:JSON.stringify(map),
                success:function (res) {
                    console.log(res)
                },
                contentType:"application/json;charset=utf-8"
            });
        });
    </script>

</body>
</html>
