<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="DocumentManagement_WebClient.Home1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <style>
        .container{
            display:flex;
            align-items:center;
            flex-direction:column;
            justify-content:center;
            margin-top:2%;
        }
        .addDocument{
            margin-left:2%;
            background-color:lightgray;
            padding:3%;
            border-radius:10px;
        }
        .docHeading{
            font-size:2vw;
        }
        .nav {
            display: inline-block;
            text-align: center;
            text-decoration: none;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size:x-large;
            background-color:white;
            border:none; 
            border-radius:4px;
            font-size:20px;
        }
        .uploadDoc{
            color:white;
        }
        .file-upload {
            cursor: pointer;      
        }
        .file-upload input {
            top: 0;
            left: 0;
            margin: 0;
           
            opacity: 0;
             
        }
        .upload {
            margin-top:2%;
            margin-left:5%;
            display:flex;
            justify-content:space-evenly;
            margin-right:2%;
        }
        .addDoc_btn{
            padding-left:1%;
            padding-right:1%;
            background-color:darkslateblue;
            color:white;
            text-decoration:none;
            cursor:pointer;
            border:none;
            padding:1%;
            transition:0.3s;
            border-radius:4px;
        }
        .addDoc_btn:hover{
       
            background-color:aliceblue;
            color:black;
        }
        .logout_btn{
            cursor:pointer;
            background-color:darkslateblue;
            color:white;
            border:none;
            padding:0.5% 1%;
            margin-right:20px;
            border-radius:4px;
        }
        .buttons_right 
        {
            display:flex;
            justify-content:flex-end;
            margin-top:20px;
        }
        td
        {
            text-align:center;
        }
        table
        {
            width:45vw;
        }
        .css-3d-text {
            text-align:center;
    font-size: 62px;
    color: #36342e;
    font-family: Montserrat, sans-serif;
    text-shadow: 0px 0px 0 rgb(5,3,0),
                 -1px 0px 0 rgb(-13,-15,0),
                 -2px 0px 0 rgb(-30,-32,0),
                 -3px 0px 0 rgb(-48,-50,0),
                 -4px 0px 0 rgb(-66,-68,0),
                 -5px 0px  0 rgb(-84,-86,0),
                 -6px 0px 5px rgba(184,162,162,0.85),
                 -6px 0px 1px rgba(184,162,162,0.5),
                 0px 0px 5px rgba(184,162,162,.2);
 }
        .center_align
        {
            text-align:center;
        }
    </style>
    <link href="//fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="buttons_right">
                    <asp:HyperLink CssClass="logout_btn" Font-Underline="false" ID="edit_user" runat="server" style="font-size:large;"  NavigateUrl="EditUser.aspx">Edit User</asp:HyperLink>
                    <asp:Button CssClass="logout_btn" name="logout" onClick="Logout" runat="server" text="Logout"/>
        </div>
        <div class="css-3d-text">Document Management System</div>
        <div class="center_align"><asp:Label  ID="User_Action" runat="server" Text=""></asp:Label></div>
        <div class="container">
         <div class="addDocument">
            <div class="docHeading">Add Document</div><br/>
            <asp:DropDownList CssClass="nav" ID="document_type" runat="server">
                <asp:ListItem Text="Select Document Type" />                           
                <asp:ListItem Text="Aadhar" />                           
                <asp:ListItem Text="Pan Card" />   
                <asp:ListItem Text="Passport" />                           
                <asp:ListItem Text="Driving License" />                           
                <asp:ListItem Text="Electricity Bill" />                           
                <asp:ListItem Text="Ration Card" />                      
            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <%--<label class="file-upload" >
                Upload Document
                <asp:FileUpload ID="myfile" runat="server" />
            </label>--%>
            <asp:FileUpload  ID="documentFile" runat="server" />
            <br /><br />
            <asp:Button CssClass="addDoc_btn" ID="Button1" runat="server" Text="Submit" OnClick="HandleAdd" />
             <br /><br />
             <asp:Label ID="Status" runat="server" Text=""></asp:Label><br /><br />
        </div>

            <div>
                <asp:DataList ID="UserDocs" runat="server">
                    <HeaderTemplate>
                    <table class="table mr-5 mt-5 dark table_container" cellspacing="3">
                        <thead>
                            <tr>
                                <th  scope="col">Sr No</th>
                                <th  scope="col">Document Type</th>
                                <th  scope="col">Open</th>
                                <th scope="col">Delete</th>
                            </tr>
                        </thead>
                </HeaderTemplate>
                 <ItemTemplate>
                    <tbody>
                        <tr class="table_text">
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("documentType") %></td>
                            <td>
                            <asp:LinkButton ID="OpenFile" OnClick="OpenFile_Click" CommandArgument='<%# Eval("documentPath")%>' runat="server"><i class="fa-solid fa-envelope-open-text"></i></asp:LinkButton></td>
                            <td><asp:LinkButton OnClick="HandleDelete" CommandArgument='<%# Eval("documentId") %>'  ID="LinkButton2" runat="server"><i class="fas fa-trash-alt"></i></asp:LinkButton></td>
                        </tr>
                    </tbody>
                </ItemTemplate>


                </asp:DataList>
            
            </div>



        </div>
    </form>
</body>
</html>
