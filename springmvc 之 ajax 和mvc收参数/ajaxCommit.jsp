<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/2
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--ajax和springmvc的总结  springmvc 之 ajax 和mvc收参数--%>
    <title>springmvc 之 ajax 和mvc收参数   非常重要！！！</title>
        <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>

</head>
<body>
    <div>
        <input type="button" value="ajax 的 第一种传参数  kv结构或对象" id="ajax01"><br>
        <input type="button" value="ajax 的 第二种传参数  对象" id="ajax02"><br>
        <input type="button" value="ajax 的 第三种传参数  传数组或者集合" id="ajax03"><br>
        <input type="button" value="ajax 的 第四种传参数  传json对象" id="ajax04"><br>
        <input type="button" value="ajax 的 第五种传参数  传多个对象" id="ajax05"><br>
        <input type="button" value="ajax 的 第六种传参数  多个对象 批量传参" id="ajax06"><br>
        <input type="button" value="ajax 的 第七种传参数  传 map传参+json" id="ajax07"><br>
        <input type="button" value="ajax 的 第八种传参数  传 对象+常用类型  混合，常用于 带参数的分页查询" id="ajax08"><br>
    </div>
    <script>
        $(function () {
            //kv结构或对象
          $('#ajax01').click(function () {
              $.ajax({
                  url:'/api/admin/regByBean',
                  type:'POST',
                  data:{
                      'adminName':'rows',
                      'adminPwd':'123456',
                      'adminPwdR':'123456',
                      'adminTime':'2000-01-02 00:02:03'
                  },
                  dataType:'JSON',
                  success:function (res) {
                      console.log(res)
                  }
              });
          });
          //对象
          $('#ajax02').click(function () {
              var adminInfo = {};
              adminInfo.adminName='rows';
              adminInfo.adminPwd='123456';
              adminInfo.adminPwdR='123456';
              adminInfo.adminTime='2000-01-02 00:02:03';
                $.ajax({
                    url:'/api/admin/regByBean',
                    type:'POST',
                    data:adminInfo,
                    dataType:'JSON',
                    success:function (rs) {
                        console.log(rs)
                    }
                });
            });
          //ajax 传数组或集合   应用范围是 批量删除  比如 ids[] = {1,5,7}
          $('#ajax03').click(function () {
                var ids = new Array();
                ids.push(3);
                ids.push(6);
                ids.push(9);
                ids.push(66);
                //把数组  使用ajax 传递
                $.ajax({
                    url:'/api/admin/ajax03',
                    type:'POST',
                    data:{'ids':ids},
                    dataType:'JSON',
                    success:function (rs) {
                        console.log(rs)
                    }
                });
            });
          //传json对象
          $('#ajax04').click(function () {
                //json 对象  浏览器中带颜色
              var adminInfo={
                  adminName:'roys',
                  adminPwd:'123456',
                  adminPwdR:'123456',
                  adminTime:'2000-08-02 02:03:59',
                  loverList:[
                      {
                          name:'雪蛋',
                          age:20
                      },
                      {
                          name:'娇儿',
                          age:19
                      },
                      {
                          name:'浩子',
                          age:22
                      },
                  ],
                  aiHao:[23,57,69]

              };
              //var 出来的对象，他是个对象，如果直接传输，www-urlxxx传递的，黑色的
              //Content-Type: application/x-www-form-urlencoded; charset=UTF-8  请求方式
              //为什么用json      因为普通的 请求 是 整很多个  k-v 结构，后台收取特别麻烦，所以需要把复杂的对象转换成json对象
              //然后  后台接收就会方便很多了，前后端项目，一般都是用json传递

              $.ajax({
                  url:"/api/admin/ajax04",
                  type:'POST',
                  dataType:'JSON',
                  //data:adminInfo,     //普通的k-v   结构  请求方式是：Content-Type: application/x-www-form-urlencoded; charset=UTF-8
                  data:JSON.stringify(adminInfo),   //变成json对象后，就需要Content-Type  要改为  application/json;charset=UTF-8
                  contentType:"application/json;charset=UTF-8",
                  success:function (res) {
                      console.log(res)
                  }

              });

            });
          //传多个对象   应用场景  不常用不常见，因为发货单，上面收货人对象，下面产品对象
          $('#ajax05').click(function () {
            $.ajax({
                  url:"/api/admin/ajax05",
                  type:'POST',
                  dataType:'JSON',
                  data:{
                      'lover.name':'老王',
                      'lover.age':20,
                      'dog.dogId':1001,
                      'dog.dogSex':'男'
                  },
                 success:function (res) {
                      console.log(res)
                  }

              });

            });
          //多个对象 批量传参
          $('#ajax06').click(function () {
                var loverList=[];
                for (var i=0;i<5;i++){
                    var lover={
                        name:'莱阳'+i,
                        age:20
                    }
                    loverList.push(lover)
                }
                //多个对象， 就属于复杂，复杂用json
              $.ajax({
                  url:'/api/admin/ajax06',
                  //type:'POST',     get请求是无法 传输 json 协议的 和 json数据的！！！
                  //get  没有方法体
                  type:'POST',
                  dataType:'JSON',
                  data:JSON.stringify(loverList),
                  contentType:"application/json;charset=utf-8",
                  success:function (res) {
                      console.log(res)
                  }
              });
            });
          //用map传参+json
          $('#ajax07').click(function () {
              var map = {
                  'adminName':'rows',
                  'adminPwd':'123456',
                  'adminPwdR':'123456',
                  'adminTime':'2000-01-02 00:02:03'
              }
              $.ajax({
                  url:"/api/admin/ajax07",
                  type:'POST',
                  dataType:'JSON',
                  data:JSON.stringify(map),
                  success:function (res) {
                      console.log(res)
                  },
                  contentType:"application/json;charset=utf-8"
              });
          });
          //传 对象+常用类型  混合，常用于 带参数的分页查询
          $('#ajax08').click(function () {
              $.ajax({
                  url:'/api/admin/ajax08',
                  type:'POST',
                  dataType:'JSON',
                  data:{    //4个kv  是3个参数组成
                      'name':'小王',//lover对象
                      'age':22,
                      'pageSize':5,
                      'page':2
                  },
                  success:function (r) {
                     console.log(r)
                  }
              });
          });
        });
    </script>
</body>
</html>
