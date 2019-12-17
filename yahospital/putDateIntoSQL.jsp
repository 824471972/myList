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
            margin: 1em;
            text-align: center;
            color: red;
            font-size: 20px;
            font-family: 微软雅黑,sans-serif;
        }
        .main{
            max-width: 400px;
            max-height: 300px;
            margin: 4em auto 4em auto;
            padding: 5em;
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
        }
        .main a:hover{
            background-color: brown;
            color: white;
        }
        form table{
            text-align: left;
        }
        form table tr td{
            padding: 3px;
        }
        form table tr td textarea{
            width: 300px;
            height: 50px;
        }
        .submit{
            width: 30px;
            height: 20px;
            border: 1px solid lightskyblue;
            border-radius: 5px;
            background-color: lightskyblue;
            color: #ffffff;
        }
        #age{
            width: 50px;
        }
        #name{
            width: 100px;
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
        .ms{
        	text-align:center;
        	margin-top:100px;
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
	/*
	String postBian = "ISO-8859-1";
	String getBian = "utf-8";
	*/
	String idstring = request.getParameter("id");
	String namestring = request.getParameter("name");
	String sexstring = request.getParameter("sex");
	String agestring = request.getParameter("age");
	String doctorstring = request.getParameter("doctor");
	String datestring = request.getParameter("date");
	String serverKindstring = request.getParameter("serverKind");
	
	String id=new String(idstring.getBytes("ISO-8859-1"),"utf-8");
	String name=new String(namestring.getBytes("ISO-8859-1"),"utf-8");
	String sex=new String(sexstring.getBytes("ISO-8859-1"),"utf-8");
	String age=new String(agestring.getBytes("ISO-8859-1"),"utf-8");
	String doctor=new String(doctorstring.getBytes("ISO-8859-1"),"utf-8");
	String date=new String(datestring.getBytes("ISO-8859-1"),"utf-8");
	String serverKind =new String(serverKindstring.getBytes("ISO-8859-1"),"utf-8");
	
	//String c = "  ";
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://123.56.5.186:3306/yahospital?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
		String username = "root";
		String password = "3?HSJdoJ1C#h";
		Connection conn = DriverManager.getConnection(url, username, password);
		//System.out.print("\n"+id+c+name+c+sex+c+age+c+doctor+c+date+c+serverKind);
		
		if(conn != null){

			String serchIdSQl = "SELECT id FROM patientorder WHERE id = ?";
			pstmt = conn.prepareStatement(serchIdSQl);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			boolean isK = false;
			if(rs.next()){
				isK = true;
			}else{
				isK = false;
			}
			
			
			System.out.print(isK);
			if(!isK)
			{
			
			
			//String sersql = "SELECT name,age,serverKind FROM patientorder ";
			String insql = "insert into patientorder (id,name,sex,age,doctor,date,serverKind) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(insql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, sex);
			pstmt.setString(4, age);
			pstmt.setString(5, doctor);
			pstmt.setString(6, date);
			pstmt.setString(7, serverKind);
			pstmt.execute();
			
		%>
			<p class="ms">预约成功</p>
		<%
			conn.close();
			}
			else{

					out.print("     数据库中已有相同的病人ID，同一个病人ID不可预约两次");
				
			}
		
		}
		
	}catch (Exception e){
		e.printStackTrace();
		out.print("数据库连接异常！");
	}
	%>
</body>
</html>