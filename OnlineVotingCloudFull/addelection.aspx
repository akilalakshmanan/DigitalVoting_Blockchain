<%@ Page Language="C#" AutoEventWireup="false" CodeFile="addelection.aspx.cs" Inherits="addelection" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Election Creation Page</title>
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
                                <uc2:leftmenu id="Leftmenu1" runat="server">
                                </uc2:leftmenu></td>
                            <td rowspan="1" style="width: 6px" valign="top" align="center">
                                <table style="width: 540px">
                                    <tr>
                                        <td colspan="3" align="center">
                                        <hr color="#073A71"  width="400"/>
                                            <asp:Label ID="Label1" runat="server" Text="ELECTION DATE FIXING" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Election Date"></asp:Label></td>
                                        <td>
                                            &nbsp;<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:Button ID="Button1" runat="server" Text="Save" Font-Bold="True" OnClick="Button1_Click" /></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="height: 17px">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="height: 17px">
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="SNo" HeaderText="SNo" InsertVisible="False"
                                ReadOnly="True" SortExpression="SNo" />
                            <asp:BoundField DataField="ElectionDate" HeaderText="ElectionDate" SortExpression="ElectionDate" />
                            
                        </Columns>
                    </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT [SNo], convert(varchar(10),ElectionDate,103) as ElectionDate  FROM [Elections]"></asp:SqlDataSource>
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
