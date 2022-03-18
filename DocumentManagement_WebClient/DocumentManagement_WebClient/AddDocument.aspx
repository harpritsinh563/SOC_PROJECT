<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDocument.aspx.cs" Inherits="DocumentManagement_WebClient.AddDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
        
    </form>
</body>
</html>
