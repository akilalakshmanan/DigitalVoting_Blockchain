<%@ Page Language="C#" AutoEventWireup="false" CodeFile="viewelectiondatevoter.aspx.cs" Inherits="viewelectiondatevoter" %>
<%@ Register Src="voterleftmenu.ascx" TagName="voterleftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>View Election Date Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 649px">
            <tr>
                <td>
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td style="width: 6px" rowspan="1" valign="top">
                                <uc2:voterleftmenu ID="Voterleftmenu1" runat="server" />
                            </td>
                            <td rowspan="1" style="width: 6px" valign="top">
                                <table style="width: 540px">
                                    <tr>
                                        <td colspan="3" align="center">
                                        <hr color="#073A71"  width="400"/>
                                            <asp:Label ID="Label1" runat="server" Text="VIEW ELECTION DATE" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                </table>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="589px" DataKeyNames="SNo" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="SNo" HeaderText="SNo" InsertVisible="False" ReadOnly="True"
                                SortExpression="SNo" />
                           
                            <asp:BoundField DataField="ElectionDate" HeaderText="ElectionDate" ReadOnly="True"
                                SortExpression="ElectionDate" />
                        </Columns>
                    </asp:GridView>
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label></td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT SNo,Convert(varchar(10),ElectionDate,103) as ElectionDate FROM Elections"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
