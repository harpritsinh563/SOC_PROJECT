<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DocumentManagement_WebClient.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <style>
         * {
            margin:0;
            padding:0;
        }
        .container {
            margin-top:4%;
            
            text-align:center;
          
        }
        .button_cls {
                border-radius:1vw;
                font-size:large;
                font-weight:500;
                border:none;
                color:white;
                margin-left: 10%;
                cursor:pointer;
                background-color:#0099FF;
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
        .fields_container
        {           
            height:700px;
            width:600px;
            margin-left:20px;
            display:flex;
            align-items:center;
            flex-direction:column;
        }
        .text_field
        {            
            display:flex;
            width:250px;
            margin:5px;
            margin-bottom:20px;
            flex-direction:column;
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
                 <div class="fields_container"> 
                     <div class="text_field">
                        <asp:TextBox ID="Name" runat="server" CssClass="input_dec"  BorderStyle="Groove"  placeholder="Enter Name" ></asp:TextBox>
                         <asp:RequiredFieldValidator Display = "Dynamic" ForeColor="Red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Name" ControlToValidate="Name"></asp:RequiredFieldValidator>
                     </div>
                     <div class="text_field">
                        <asp:TextBox ID="Contact" runat="server"  BorderStyle="Groove"  placeholder="Enter Contact Number" class="input_dec"></asp:TextBox>
                         <asp:RequiredFieldValidator Display = "Dynamic" ForeColor="Red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Contact" ControlToValidate="Contact"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
ControlToValidate="Contact" Display="Dynamic" ErrorMessage="RegularExpressionValidator"  
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                     </div>
                     <div class="text_field">
                        <asp:TextBox ID="Address" runat="server"  BorderStyle="Groove"  placeholder="Enter Address" class="input_dec"></asp:TextBox>
                         <asp:RequiredFieldValidator Display = "Dynamic" ForeColor="Red" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Address" ControlToValidate="Address"></asp:RequiredFieldValidator>
                     </div>
                     <div class="text_field">
                        <asp:TextBox ID="Email" runat="server"  BorderStyle="Groove"  placeholder="Enter Email id" class="input_dec"></asp:TextBox>
                         <asp:RequiredFieldValidator ForeColor="Red" Display = "Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email" ControlToValidate="Email"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email"
    ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
    Display = "Dynamic" ErrorMessage = "Invalid email address"/>
                     </div>
                      <div class="text_field">
                          <asp:TextBox ID="Username" runat="server"  BorderStyle="Groove" placeholder="Enter Username" class="input_dec" ></asp:TextBox>
                         <asp:RequiredFieldValidator Display = "Dynamic" ForeColor="Red" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Username" ControlToValidate="Username"></asp:RequiredFieldValidator>
                     </div>
                    <div class="text_field">
                          <asp:TextBox ID="Password" runat="server"  BorderStyle="Groove" Textmode="Password" placeholder="Enter Password" class="input_dec"></asp:TextBox>
                         <asp:RequiredFieldValidator Display = "Dynamic" ForeColor="Red" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter Password" ControlToValidate="Password"></asp:RequiredFieldValidator>
                        <asp:regularexpressionvalidator id="rev1" runat="server" Display = "Dynamic" ForeColor="Red" controltovalidate="Password" errormessage="Password requires minimum 8 characters with atleast 1 Alphabet,1 special character,1 digit" validationexpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!%*?&amp;]{8,}">
</asp:regularexpressionvalidator>
                     </div>
                     <div class="text_field">
                         <asp:TextBox ID="ConfirmPassword" runat="server"  BorderStyle="Groove" Textmode="Password" placeholder="Re-enter Password" class="input_dec" ></asp:TextBox>
                         <asp:RequiredFieldValidator Display = "Dynamic" ForeColor="Red" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter Password Again" ControlToValidate="ConfirmPassword"></asp:RequiredFieldValidator>
                         <asp:CompareValidator ForeColor="Red" ID="CompareValidator1" runat="server" ControlToCompare="ConfirmPassword" ControlToValidate="Password" ErrorMessage="Password does not match"></asp:CompareValidator>
                     </div>
                     <asp:Button ID="Button1"  class="button_cls" runat="server" Text="Sign up"   Height="51px" ToolTip="Click here to signup" Width="113px" style="margin-right:10%" OnClick="Button1_Click" />
                     <asp:Label ID="register" runat="server" Text="Already Have An Account?? " style="font-size:large; margin-left:2%"></asp:Label>
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl="Login.aspx">Login</asp:HyperLink>
                 </div>
                     

                 
                 </div>
                 </div>
        <asp:Label ID="Status" runat="server" Text=""></asp:Label>
                 </form>
             </div>
</body>
</html>
