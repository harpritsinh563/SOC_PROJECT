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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <style>
        .container{
            display:flex;
            align-items:center;
            flex-direction:column;
            justify-content:center;
            margin:auto;
            margin-top:10%;
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
            border:none;
            padding:1%;
            border-radius:4px;
        }
        .logout_btn{
            position:absolute;
            right:7vw;
            top:2vw;
            background-color:darkslateblue;
            color:white;
            text-decoration:none;
            border:none;
            padding:0.5% 1%;
            border-radius:4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button CssClass="logout_btn" name="logout" onClick="Unnamed_Click" runat="server" text="Logout"/>
            
        <div class="container">
         <div class="addDocument">
            <div class="docHeading">Add Document</div>
            <asp:DropDownList CssClass="nav" ID="document_type" runat="server">
                <asp:ListItem Text="Select Document Type" />                           
                <asp:ListItem Text="Aadhar" />                           
                <asp:ListItem Text="Pan Card" />                           
                <asp:ListItem Text="Ration Card" />                      
            </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <%--<label class="file-upload" >
                Upload Document
                <asp:FileUpload ID="myfile" runat="server" />
            </label>--%>
            <asp:FileUpload ID="documentFile" runat="server" />
            <asp:Label ID="Status" runat="server" Text=""></asp:Label><br /><br />
             <asp:Button CssClass="addDoc_btn" ID="Button1" runat="server" Text="Submit" OnClick="HandleAdd" />
        </div>

            <div>
                <asp:DataList ID="UserDocs" runat="server">
                    <HeaderTemplate>
                    <table class="table mr-5 mt-5 table_container" cellspacing="4">
                        <thead>
                            <tr>
                                <th scope="col">Sr No</th>
                                <th scope="col">Document Type</th>
                                <th scope="col">Open</th>
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
                            <asp:LinkButton ID="OpenFile" OnClick="OpenFile_Click" CommandArgument='<%# Eval("documentPath")%>' runat="server">Open</asp:LinkButton></td>
                            <td><asp:LinkButton OnClick="HandleDelete" CommandArgument='<%# Eval("documentId") %>'  ID="LinkButton2" runat="server">Delete</asp:LinkButton></td>
                            
                        </tr>
                    
                        
                    </tbody>
                </ItemTemplate>


                </asp:DataList>
            
            </div>



        </div>
    </form>
</body>
</html>
