<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="DocumentManagement_WebClient.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
    </form>
</body>
</html>
