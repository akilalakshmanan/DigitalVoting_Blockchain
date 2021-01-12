<%@ Control Language="C#" AutoEventWireup="true" CodeFile="leftmenu.ascx.cs" Inherits="leftmenu" %>
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
        <asp:MenuItem NavigateUrl="addparty.aspx" Text="Add Party" Value="" >
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="addzone.aspx" Text="Add Zone" Value="" >
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="addcandidate.aspx" Text="Add Candidate" Value="">
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="addcandzone.aspx" Text="Candidate/Zone Allotment" Value="" ></asp:MenuItem>
        
        <asp:MenuItem NavigateUrl="addelection.aspx" Text="Election Date Fixing" Value="" ></asp:MenuItem>
        <asp:MenuItem NavigateUrl="viewresult.aspx" Text="View Result" Value="" ></asp:MenuItem>
          <asp:MenuItem NavigateUrl="viewwinnerzonewise.aspx" Text="View Winners" Value="" ></asp:MenuItem>
              <asp:MenuItem NavigateUrl="viewblockchain.aspx" Text="View BlockChain Records" Value="" ></asp:MenuItem> 
        <asp:MenuItem NavigateUrl="changepassadmin.aspx" Text="Change Password" Value="" ></asp:MenuItem>
        
        <asp:MenuItem NavigateUrl="admin_logout.aspx" Text="Logout" Value="Logout" >
        </asp:MenuItem>
    </Items>
</asp:Menu>
&nbsp;
