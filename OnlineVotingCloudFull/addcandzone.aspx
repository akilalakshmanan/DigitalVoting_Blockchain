<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addcandzone.aspx.cs" Inherits="addcandzone" %>
<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Candidate/Zone Creation Page</title>
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
                            <td rowspan="1" style="width: 6px" valign="top">
                                <table style="width: 540px">
                                    <tr>
                                        <td colspan="3" align="center">
                                        <hr color="#073A71"  width="400"/>
                                            <asp:Label ID="Label1" runat="server" Text="CANDIDATE/ZONE ALLOTMENT" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Candidate ID"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                            </asp:DropDownList></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Zone ID"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList2" runat="server">
                                            </asp:DropDownList></td>
                                        <td>
                                        </td>
                                    </tr>
                                      <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Party ID"></asp:Label></td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList3" runat="server">
                                            </asp:DropDownList></td>
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
                                        <td colspan="3">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT [CandidateID], [ZoneId]  FROM [Candidate_Zonedetails]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="CandidateID" HeaderText="CandidateID" InsertVisible="False"
                                ReadOnly="True" SortExpression="CandidateID" />
                            <asp:BoundField DataField="ZoneId" HeaderText="ZoneId" SortExpression="ZoneId" />
                            
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

