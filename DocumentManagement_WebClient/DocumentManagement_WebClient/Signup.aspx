<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DocumentManagement_WebClient.Signup" %>

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
            margin-top:20%;
            
            text-align:center;
          
        }
        .signup_Button {
                border-radius:1vw;
                font-size:large;
                font-weight:500;
                margin-left: 10%;
                cursor:pointer;
        }
        .signup_con {
            margin-top:2%;
        }
        
        .auto-style1 {
            width: 100%;
            height: 100%;
        }
        .login_img {
          display: grid;
          grid-template-columns: 50% 50%;
          width:100vw;
          height:100vh;
        
        }
        .icons {
            font-size:large;
            margin-right:4px;
        }
        .input_dec {
            padding:1.5%;
            border-radius:0.4vw;
            font-weight:300;
        }
        </style>
</head>
<body>

    <div class="login_img">
        <img alt="loginImg" class="auto-style1" src="images/1.jpg"  />
    <form id="form2" runat="server">
       
             <div class="container">
                 <div class="signup_con">
                     <asp:Label ID="registererr" runat="server" Visible="false"></asp:Label>
                 <h1>Register</h1>
                 <br/>
                  <br/>
                 
                    <asp:TextBox ID="Email" runat="server"  BorderStyle="Groove" Textmode="Email" placeholder="Email id" class="input_dec"></asp:TextBox>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter email" ControlToValidate="email"></asp:RequiredFieldValidator>
                 <br />--%>
                 <br />
                  <br />
                 <asp:TextBox ID="Username" runat="server"  BorderStyle="Groove" placeholder="Username" class="input_dec" ></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter username" ControlToValidate="username"></asp:RequiredFieldValidator>
                 <br />--%>
                 <br />
                 <br />
                 <asp:TextBox ID="Password" runat="server"  BorderStyle="Groove" Textmode="Password" placeholder="Password" class="input_dec"></asp:TextBox>
            
<%--                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter password" ControlToValidate="pass"></asp:RequiredFieldValidator>
                    
                 <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Enter Valid Password" ControlToValidate="pass" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                 
                 <br />--%>
                 <br />
                     <br />
<%--                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="Label6" runat="server" Text=""><i class="fas fa-lock icons"></i></asp:Label>
                 &nbsp;&nbsp;&nbsp;&nbsp;--%>
                 <asp:TextBox ID="ConfirmPassword" runat="server"  BorderStyle="Groove" Textmode="Password" placeholder="Re-enter Password" class="input_dec" ></asp:TextBox>
                 <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Confirm password" ControlToValidate="repass"></asp:RequiredFieldValidator>
                 <br/>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="repass" ControlToValidate="pass" ErrorMessage="Password does not match"></asp:CompareValidator>
                 <br />
                 --%><br />
                     <br />

                 <asp:Button ID="Button1"  class="signup_Button" runat="server" Text="Sign up"  BackColor="#0099FF" BorderColor="Black" Height="51px" ToolTip="Click here to signup" Width="113px" style="margin-right:10%" OnClick="Button1_Click" />
                <br/>
                 <br/>


                 <asp:Label ID="register" runat="server" Text="Already Have An Account?? " style="font-size:large; margin-left:2%"></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" style="font-size:large " NavigateUrl="Login.aspx">Login</asp:HyperLink>
                 </div>
                 </div>
        <asp:Label ID="Status" runat="server" Text=""></asp:Label>
                 </form>
             </div>

<%--    <form id="form1" runat="server">
        <div>
         <div>            
            Signup          
        </div>
        <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <p>
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        </p>
        <asp:TextBox ID="ConfirmPassword" runat="server"></asp:TextBox>
        <p>
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Signup" />
        <asp:Label ID="Status" runat="server" Text=""></asp:Label>
        </div>
    </form>--%>
</body>
</html>
