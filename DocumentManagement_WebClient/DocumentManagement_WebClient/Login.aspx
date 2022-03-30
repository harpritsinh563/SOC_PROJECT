<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DocumentManagement_WebClient.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    
    <style>
        
        * {
            margin:0;
            padding:0;
        }
        .container {
            margin-top:30%;
            margin-left:0%;
            text-align:center;
          
        }
        .login_Button {
            border-radius:1vw;
            font-size:large;
            font-weight:500;
            margin-left: 0px;
            cursor:pointer;
        }
        .login_con {
            margin-top:7%;
        }
        
        .auto-style1 {
            width: 100%;
            height: 100%;
        }
        .login_img {
          display: grid;
          grid-template-columns: 55% 45%;
          width:100vw;
          height:100vh;
        
        }
        .icons {
            font-size:large;
            margin-right:4px;
        }
          
         .input_dec {
            padding:0.5%;
            border-radius:0.4vw;
            font-weight:300;
        }
        
    </style>
</head>
<body>
    <div class="login_img">
        <img alt="loginImg" class="auto-style1" src="Images/1.jpg"  />
      <form id="form1" runat="server" >
          
        <div class="container">
            <asp:Label ID="loginerr" runat="server" Visible="false" ></asp:Label>
            <h1>Login</h1>

            <div class="login_con">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="userLabel" runat="server" Text="Username" > <i class="far fa-user icons" >  </i></asp:Label>
            <asp:TextBox ID="Username" runat="server" BorderStyle="Groove" Height="33px" Width="286px" style="margin-left: 0px" class="input_dec" placeholder="Username" ></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter username" ControlToValidate="Username"></asp:RequiredFieldValidator>--%>
               
            <br/>
            <br/>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="PassLabel" runat="server" Text="Passward"> <i class="fas fa-lock icons"></i></asp:Label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" BorderStyle="Groove" Height="33px" Width="286px" style="margin-left: 0px" class="input_dec" placeholder="Password"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter password" ControlToValidate="Password"></asp:RequiredFieldValidator>--%>
              <br/>
            <br/>
            <asp:Button class="login_Button" ID="Button1" runat="server" Text="Login" BackColor="#0099FF" BorderColor="Black" Height="51px" ToolTip="Click here to Login" Width="113px" onClick="Button1_Click"/>
             <br/>
             <br/>
                <asp:Label ID="register" runat="server" Text="New User?? " style="font-size:large" ></asp:Label>
                <asp:HyperLink ID="signup" runat="server" style="font-size:large" NavigateUrl="Signup.aspx">Sign up</asp:HyperLink>
             </div>
            <p>
            <asp:Label ID="status" runat="server"></asp:Label>
        </p>
          </div>
        </form>
       </div>
</body>
</html>
