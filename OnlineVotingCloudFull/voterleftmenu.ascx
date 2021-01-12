<%@ Control Language="C#" AutoEventWireup="false" CodeFile="voterleftmenu.ascx.cs" Inherits="voterleftmenu" %>
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<asp:Menu ID="Menu1" runat="server" BackColor="#D6F2FD" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" StaticSubMenuIndent="10px">
    <StaticSelectedStyle BackColor="#1C5E55" />
    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
    <DynamicMenuStyle BackColor="#E3EAEB" />
    <DynamicSelectedStyle BackColor="#1C5E55" />
    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
    <Items>
        <asp:MenuItem NavigateUrl="viewpartiesvoter.aspx" Text="View Parties" Value="View Parties" >
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="viewzonesvoter.aspx" Text="View Zones" Value="View Zones">
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="viewcandidatesvoter.aspx" Text="View Candidates" Value="View Candidates" ></asp:MenuItem>
        <asp:MenuItem NavigateUrl="viewelectiondatevoter.aspx" Text="View Election Date" Value="View Election Date" ></asp:MenuItem>
        <asp:MenuItem NavigateUrl="make_vote.aspx" Text="Make Vote" Value="Make Vote" ></asp:MenuItem>
        <%--<asp:MenuItem NavigateUrl="viewresultvoter.aspx" Text="View Result" Value="View Result" ></asp:MenuItem>--%>
        <asp:MenuItem NavigateUrl="chpassvoter.aspx" Text="Change Password" Value="Change Password" ></asp:MenuItem>
        <asp:MenuItem NavigateUrl="voter_logout.aspx" Text="Logout" Value="Logout" >
        </asp:MenuItem>
    </Items>
</asp:Menu>
