<%@ Page Language="C#" AutoEventWireup="false" CodeFile="viewcandidatesvoter.aspx.cs" Inherits="viewcandidatesvoter" %>
<%@ Register Src="voterleftmenu.ascx" TagName="voterleftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>View Candidates Page</title>
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
                                            <asp:Label ID="Label1" runat="server" Text="VIEW CANDIDATES" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label>
                                            </td>
                                    </tr>
                                </table>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="589px" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="CandidateID" HeaderText="CandidateID" SortExpression="CandidateID" />
                            <asp:BoundField DataField="CandidateName" HeaderText="CandidateName" SortExpression="CandidateName" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                            <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" />
                            <asp:BoundField DataField="MotherName" HeaderText="MotherName" SortExpression="MotherName" />
                            <asp:BoundField DataField="MaritalStatus" HeaderText="MaritalStatus" SortExpression="MaritalStatus" />
                            <asp:BoundField DataField="Occupation" HeaderText="Occupation" SortExpression="Occupation" />
               <asp:BoundField DataField="IncomePerMonthRs" HeaderText="IncomePerMonthRs" SortExpression="IncomePerMonthRs" />
                            <asp:BoundField DataField="NumberofAttempt" HeaderText="NumberofAttempt" SortExpression="NumberofAttempt" />
                        </Columns>
                    </asp:GridView>
                            </td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT [CandidateID], [CandidateName], [Address],  [Gender],Convert(Varchar(10),[DOB],103) AS DOB, [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs], [NumberofAttempt] FROM CandidatesList"></asp:SqlDataSource>
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
