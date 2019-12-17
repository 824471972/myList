
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.changer.hk/jquery/1.11.2/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        body{
            background-color: #fff0f0;
        }
        .head{
            height: 80px;
            text-align: center;
            color: red;
            font-size: 20px;
            font-family: 微软雅黑,sans-serif;
        }
        .main{
            width: 600px;
            height: 200px;
            margin: 4em auto 4em auto;
            overflow: hidden;
            background-color: #ffffff;
            text-align: center;
            border: 2px solid #ffffff;
            border-radius: 20px;
        }
        .main a{
            display: block;
            width: 6em;
            height: 1.5em;
            color: #999;
            margin: 4px auto 4px auto;
            text-decoration: none;
            border: 1px solid red;
            border-radius: 5px;
            float: left;
        }
        .main a:hover{
            background-color: brown;
        }
        div.nav{
            width: 1200px;
            margin: auto;
            background-color: #ff6666;
            overflow: hidden;
        }
        ul.nav{
            list-style-type: none;
        }
        ul.nav li{
            float: left;
            padding: 0.5em 5.2em 0.5em 5.2em;
        }
        ul.nav a{
            text-decoration: none;
            color: white;
        }
        .button{
            width: 380px;
            margin: 80px auto;
        }
        .button a{
            margin: 10px;
        }
        .main h1{
            color: #ff6666;
            padding: 10px;
            text-align: center;
        }
        .puttable{
			width:400px;
			margin: 80px auto;
			        
        }
    </style>

</head>
<body>
	<div class="head">
    <h1 class="title">广东海洋大学牙科医院</h1>
</div>
<div class="nav">
    <ul class="nav">
        <li><a href="main.html">首页</a></li>
            <li><a href="hospitalText.html">医院概况</a></li>
            <li><a href="doctorText.html">医生信息</a></li>
            <li><a href="serverText.html">医疗介绍</a></li>
            <li><a href="mainSearch.html">预约与查询服务</a></li>
    </ul>
</div>
	<%
	
	String getIDSting = request.getParameter("id");
	String serchID  =  new String(getIDSting.getBytes("ISO-8859-1"),"utf-8");
	String name = null;
	int age = 1;
	String serverKind = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://123.56.5.186:3306/yahospital?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		System.out.print("2\n");
		String username = "root";
		String password = "3?HSJdoJ1C#h";
		Connection conn = DriverManager.getConnection(url, username, password);
		System.out.print("13\n");
		
		if(conn != null){
			//out.print("数据库连接成功！\n");
			String sersql = "SELECT id,name,age,serverKind FROM patientorder WHERE id=?";
			//String sql = "insert into patientorder (id,name,age,sex,date,severKind) values('5546','煌健','18','男','1','他要去补牙然后洗牙')";
			stmt = conn.prepareStatement(sersql);
			stmt.setString(1, serchID);
			stmt.executeQuery();
			rs = stmt.executeQuery();
			
		}
		
	}catch (Exception e){
		e.printStackTrace();
		out.print("数据库连接异常！");
	}
	%>
	
	<div class="puttable">
	<table border="1">
		<tr>
			<th>服务id</th>
			<th>名字</th>
			<th>年龄</th>
			<th>服务内容</th>
		</tr>
	<%
		while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("id") %>
		<td><%=rs.getString("name")%></td>
		<td><%=rs.getString("age")%></td>
		<td><%=rs.getString("serverKind")%></td>
	</tr>
	<%
		}
	%>
	</table>
	</div>

</body>
</html>