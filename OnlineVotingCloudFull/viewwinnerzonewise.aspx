<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewwinnerzonewise.aspx.cs" Inherits="viewwinnerzonewise" %>
<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>View Winner Zone Page</title>
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
                                            <asp:Label ID="Label1" runat="server" Text="WINNER STATUS" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="-"></asp:Label>
                                            </td>
                                    </tr>
                                </table>
                    <asp:GridView ID="GridView1" runat="server" Width="589px" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                    </asp:GridView>
                            </td>
                        </tr>
                              
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT SNo,A.ZoneID, ZoneName,B.CandidateId,CandidateName,VoteCount ,Convert(varchar(10),ElectionDate,103) as ElectionDate FROM ZoneDetails A, CandidatesList B ,VotesCount C where A.ZoneId=C.ZoneId and B.CandidateId=C.CandidateId AND VoteCount in (Select Max(VoteCount) From VotesCount Group By ZoneId) "></asp:SqlDataSource>
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
