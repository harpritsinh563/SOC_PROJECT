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
</head>
<body>
    <form id="form1" runat="server">
        <div>
         <div>
            <div>Add Document</div>
            <asp:DropDownList ID="document_type" runat="server">
                <asp:ListItem Text="Select Document Type" />                           
                <asp:ListItem Text="Aadhar" />                           
                <asp:ListItem Text="Pan Card" />                           
                <asp:ListItem Text="Ration Card" />                      
            </asp:DropDownList>

            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="HandleAdd" />
            <asp:FileUpload ID="documentFile" runat="server" />
            <asp:Label ID="Status" runat="server" Text=""></asp:Label>
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
            <asp:Button name="logout" onClick="Unnamed_Click" runat="server" text="Logout"/>
            
            </div>



        </div>
    </form>
</body>
</html>
