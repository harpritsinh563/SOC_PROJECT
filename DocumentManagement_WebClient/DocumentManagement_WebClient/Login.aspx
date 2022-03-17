<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DocumentManagement_WebClient.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                    
           <div> Login</div>
        <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <p>
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
        <p>
            <asp:Label ID="status" runat="server"></asp:Label>
        </p>
        </div>
    </form>
</body>
</html>
