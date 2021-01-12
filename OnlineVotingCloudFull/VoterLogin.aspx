<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoterLogin.aspx.cs" Inherits="VoterLogin" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Voter Login Page</title>
    <link href="Stylesheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
<center>
    <form id="form1" runat="server">
    <div>
        <table style="width: 722px">
            <tr>
                <td><center>
                <h1 style="background-color:Aqua">ELECTION COMMISSION OF INDIA </h1>
                   </center>
                    <uc1:header ID="Header1" runat="server"  />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <br />
                    <table style="width: 534px; height: 205px;">
                        <tr>
                            <td align="center" colspan="1" rowspan="5">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/IndianFlag.jpg" /></td>
                            <td colspan="3" align="center">
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14pt" Text="VOTER LOGIN"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Voter Id"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Width="150px" ></asp:TextBox></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 26px">
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                            <td style="height: 26px">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="150px"></asp:TextBox></td>
                            <td style="height: 26px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Button ID="Button1" runat="server" Text="Login" Width="96px" Height="31px" OnClick="Button1_Click" /></td>
                        </tr>
                        <tr>
                            <td align="left" colspan="3">
                                <asp:Label ID="Label4" runat="server" Text="-" Width="280px" ForeColor="Red"></asp:Label></td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    
    
    </div>
    </form>
    </center>
</body>
</html>