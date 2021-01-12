<%@ Page Language="C#" AutoEventWireup="false" CodeFile="changepassadmin.aspx.cs" Inherits="changepassadmin" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>
<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<%@ Register Src="footer.ascx" TagName="footer" TagPrefix="uc3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Change Admin Password</title>
  
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>  <center>
    <form id="form1" runat="server">
      
            <div>
                <table width="100%" border="0" class="fullcontent">
                    <tr>
                        <td>
                            <uc1:header ID="Header1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <table width="100%">
                                <tr>
                                    <td width="75%" align="center">
                                        <table width="100%">
                                            <tr>
                                                <td valign="top" width="100%">
                                                    <div class="pageHead">
                                                         
                                                           <h3> &nbsp;</h3>
                                                      
                                                    </div>
                                                    <div class="pad10pxLefRight aj">
                                                        <p align="center">
                                                            <table border="1"  align="center" cellpadding="5" cellspacing="0" width="250">
                                                                <tr>
                                                                    <td align="center" colspan="3">
                                                                        <hr align="center" color="#073a71" width="400" />
                                                                        <asp:Label ID="Label2" runat="server" CssClass="myhead" Text="CHANGE PASSWORD (ADMIN)"></asp:Label>
                                                                        <hr align="center" color="#073a71" width="400" />
                                                                        &nbsp;&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td  >
                                                                        Old Password</td>
                                                                    <td align="center">
                                                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"
                                                                            ></asp:TextBox></td>
                                                                    <td width="20"  >
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Old Password Should Not Be Empty" ControlToValidate="TextBox1" ForeColor="White"
                                                                         >*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                 <tr>
                                                                    <td  >
                                                                        New
                                                                        Password</td>
                                                                    <td align="center"  >
                                                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"
                                                                            ></asp:TextBox></td>
                                                                    <td width="20"  >
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                                            ErrorMessage="New Password Should Not Be Empty" ForeColor="White">*</asp:RequiredFieldValidator>
                                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1"
                                                                            ControlToValidate="TextBox2" ErrorMessage="Same Password" Operator="NotEqual">*</asp:CompareValidator></td>
                                                                </tr>
                                                                <tr>
                                                                    <td   align="center">
                                                                        &nbsp;</td>
                                                                    <td align="center"  >
                                                                        <asp:Button ID="Button1" runat="server" Text="Change" Font-Bold="True" Font-Size="12px" OnClick="Button1_Click1" /></td>
                                                                    <td width="20"  >
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center"   colspan="3">
                                                                        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>&nbsp;<br />
                                                                        <asp:ValidationSummary ID="ValidationSummary1" cssClass="errormessagebackcolor" runat="server" ShowMessageBox="True" />
                                    </td>
                                                                </tr>
                                                            </table>
                                                            &nbsp;</p>
                                                    </div>
                                                    <!-- Text Contents End -->
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" align="center">
                            <uc3:footer ID="Footer1" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
      
    </form>  </center>
</body>
</html>

