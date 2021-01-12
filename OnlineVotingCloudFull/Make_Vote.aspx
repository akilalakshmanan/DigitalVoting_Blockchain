<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Make_Vote.aspx.cs" Inherits="Make_Vote" %>
<%@ Register Src="voterleftmenu.ascx" TagName="voterleftmenu" TagPrefix="uc1" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc2" %>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="stylesheet.css" rel="stylesheet" type="text/css" />
    <title>Make Vote</title>
    
</head>
<body leftmargin="0" topmargin="0"> 
    <center><form id="form1" runat="server">  &nbsp;<uc2:header ID="Header1" runat="server" />
        <table  border="0" class="fullcontent" width="1000">
                   
                    <tr>
                        <td align="left">
                           
                            <table style="width: 734px">
                                            <tr>
                                                <td style="width: 100%; height: 25px" valign="top">
                                                    <uc1:voterleftmenu ID="Voterleftmenu2" runat="server" />
                                                </td>
                                                <td style="height: 25px; width: 100%;">
                                                    
                                                        <h3 align="center">
                                                            MAKE VOTE</h3>
                                                    
                                                   
                                                        
                                                            <table border="0" cellpadding="5" cellspacing="0" width="400">
                                                                <tr>
                                                                    <td style="width: 142px"  >
                                                                        <strong>
                                                                        Voter Id</strong></td>
                                                                    <td  >
                                                                        <asp:TextBox ID="TextBox1" runat="server" MaxLength="15" Width="146px" Enabled="False"
                                                                            ></asp:TextBox></td>
                                                                    <td style="width: 26px" >
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Voter Id Should Not Be Empty" ControlToValidate="TextBox1" Font-Bold="True"
                                                                         >*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 142px">
                                                                        Zone Id</td>
                                                                    <td align="center">
                                                                        <asp:Label ID="Label2" runat="server" Text="-"></asp:Label></td>
                                                                    <td style="width: 26px">
                                                                    </td>
                                                                </tr>
                                                                 <tr>
                                                                    <td style="width: 142px"  >
                                                                        <strong>Party ID</strong></td>
                                                                    <td align="left"  >
                                                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="151px">
                                                                        </asp:DropDownList></td>
                                                                    <td style="width: 26px"  >
                                                                        </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 142px">
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:Button ID="Button2" runat="server" Text="Request OTP" Font-Bold="True" Font-Size="12px" OnClick="Button2_Click" CausesValidation="False" /></td>
                                                                    <td style="width: 26px">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 142px">
                                                                        Finger Print</td>
                                                                    <td align="center">
                                                                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                                                                    <td style="width: 26px">
                                                                    </td>
                                                                </tr>
                                                                 <tr>
                                                                    <td style="width: 142px">
                                                                        Iris Print</td>
                                                                    <td align="center">
                                                                        <asp:FileUpload ID="FileUpload2" runat="server" /></td>
                                                                    <td style="width: 26px">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 142px">
                                                                        Enter received OTP</td>
                                                                    <td align="center">
                                                                        <asp:TextBox ID="TextBox2" runat="server" MaxLength="15" Width="146px"></asp:TextBox></td>
                                                                    <td style="width: 26px">
                                                                    </td>
                                                                </tr>
                                                                <tr style="color: #000000">
                                                                    <td   align="center" style="width: 142px; height: 32px;">
                                                                        &nbsp;</td>
                                                                    <td style="height: 32px;" align="center"  >
                                                                        <asp:Button ID="Button1" runat="server" Text="Vote" Font-Bold="True" Font-Size="12px" OnClick="Button1_Click" /></td>
                                                                    <td style="height: 32px; width: 26px;"  >
                                                                        &nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center"   colspan="3">
                                                                        <asp:Label ID="Label1" runat="server"></asp:Label>&nbsp;<br />
                                                                        <asp:ValidationSummary ID="ValidationSummary1" cssClass="errormessagebackcolor" runat="server"  ShowMessageBox="True" ForeColor="" />
                                    </td>
                                                                </tr>
                                                            </table>
                                                          
                                                  
                                                    <!-- Text Contents End -->
                                                </td>
                                            </tr>
                                        </table>
                        
                            </td>
                    </tr>
                    <tr>
                        <td colspan="1">
                            &nbsp;</td>
                    </tr>
                </table>


    </form></center>        
</body>
</html>
