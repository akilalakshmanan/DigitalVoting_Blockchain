<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewblockchain.aspx.cs" Inherits="viewblockchain" %>

<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc3" %>

<%@ Register Src="voterleftmenu.ascx" TagName="voterleftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>View BlockChain Page</title>
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
                                <uc3:leftmenu ID="Leftmenu1" runat="server" />
                            </td>
                            <td rowspan="1" style="width: 6px" valign="top">
                                <table style="width: 540px">
                                    <tr>
                                        <td colspan="3" align="center" style="width: 2082px">
                                        <hr color="#073A71"  width="400"/>
                                            <asp:Label ID="Label1" runat="server" Text="VIEW BLOCKCHAIN" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="width: 2082px">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label>
                                            </td>
                                    </tr>
                                </table>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="789px" AllowPaging="True" AllowSorting="True" DataKeyNames="VoterId">
                        <Columns>
                            <asp:BoundField DataField="VoterId" HeaderText="VoterId" ReadOnly="True" SortExpression="VoterId" />
                            <asp:BoundField DataField="EntryTime" HeaderText="EntryTime" SortExpression="EntryTime" />
               <asp:BoundField DataField="HashKeyValue" HeaderText="HashKeyValue" SortExpression="HashKeyValue" />
                 <asp:BoundField DataField="AccessType" HeaderText="AccessType" SortExpression="AccessType" />
                <asp:BoundField DataField="SNo" HeaderText="SNo" SortExpression="SNo" />

                        </Columns>
                    </asp:GridView>
                            </td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT [VoterId], [EntryTime],HashKeyValue,AccessType,SNo FROM BlockChain Order By SNo"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="height: 17px">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
