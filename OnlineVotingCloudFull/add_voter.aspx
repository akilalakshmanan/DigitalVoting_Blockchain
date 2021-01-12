<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_voter.aspx.cs" Inherits="add_voter" %>
<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Voter Creation Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 649px">
            <tr>
                <td><center>
                <h1 style="background-color:Aqua">ELECTION COMMISSION OF INDIA </h1>
                   </center>
                    <uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="height: 630px">
                    <table width="100%">
                        <tr>
                            <td style="width: 6px" rowspan="1" valign="top">
                                </td>
                            <td rowspan="1" style="width: 6px" valign="top" align="center">
                                <table style="width: 540px">
                                    <tr>
                                        <td colspan="3" align="center">
                                        <hr color="#073A71"  width="400"/>
                                            <asp:Label ID="Label1" runat="server" Text="VOTER CREATION" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            <asp:Label ID="Label2" runat="server" Text="Voter ID"></asp:Label></td>
                                        <td style="height: 26px; width: 360px;">
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                        <td style="height: 26px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                                ErrorMessage="Id must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Voter Name"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                                ErrorMessage="Name must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox3" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                                ErrorMessage="Address must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="Phone"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                                                ErrorMessage="Phone must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label></td>
                                        <td style="width: 360px">
                                            &nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text="DOB [dd/MM/yyyy]"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6"
                                                ErrorMessage="DOB must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="Father Name"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7"
                                                ErrorMessage="Father Name must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Mother Name"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6"
                                                ErrorMessage="DOB must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            EMail Id</td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
                                        <td>
                                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox6"
                                                ErrorMessage="DOB must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 22px">
                                            <asp:Label ID="Label10" runat="server" Text="Marital Status"></asp:Label></td>
                                        <td style="height: 22px; width: 360px;">
                                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="m" Text="Married" Checked="True" />
                                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="m" Text="Unmarried" /></td>
                                        <td style="height: 22px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Occupation"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox10"
                                                ErrorMessage="Occupation must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="Income / Month (Rs)"></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox11"
                                                ErrorMessage="Income must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label17" runat="server" Text="Aadhaar No."></asp:Label></td>
                                        <td style="width: 360px">
                                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox13"
                                                ErrorMessage="Aadhaar No. must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 23px">
                                            <asp:Label ID="Label13" runat="server" Text="Finger Print Image"></asp:Label></td>
                                        <td style="height: 23px; width: 360px;">
                                            <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                                        <td style="height: 23px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 23px">
                                            <asp:Label ID="Label16" runat="server" Text="Iris Print Image"></asp:Label></td>
                                        <td style="width: 360px; height: 23px">
                                            <asp:FileUpload ID="FileUpload2" runat="server" /></td>
                                        <td style="height: 23px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 23px">
                                            <asp:Label ID="Label14" runat="server" Text="Password"></asp:Label></td>
                                        <td style="height: 23px; width: 360px;">
                                            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox></td>
                                        <td style="height: 23px">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox5"
                                                ErrorMessage="Password must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td style="height: 23px">
                                            <asp:Label ID="Label15" runat="server" Text="Zone ID"></asp:Label></td>
                                        <td style="height: 23px; width: 360px;">
                                            <asp:DropDownList ID="DropDownList2" runat="server">
                                            </asp:DropDownList></td>
                                        <td style="height: 23px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td style="width: 360px">
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr2 %>" SelectCommand="SELECT [VoterID], [VoterName], [Address], [Phone], [Gender], DOB, [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs],AadhaarNo FROM [EncVotersList]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="VoterID" HeaderText="VoterID" SortExpression="VoterID" />
                            <asp:BoundField DataField="VoterName" HeaderText="VoterName" SortExpression="VoterName" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                            <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" />
                            <asp:BoundField DataField="MotherName" HeaderText="MotherName" SortExpression="MotherName" />
                            <asp:BoundField DataField="MaritalStatus" HeaderText="MaritalStatus" SortExpression="MaritalStatus" />
                            <asp:BoundField DataField="Occupation" HeaderText="Occupation" SortExpression="Occupation" />
                            <asp:BoundField DataField="IncomePerMonthRs" HeaderText="IncomePerMonthRs" SortExpression="IncomePerMonthRs" />
                               <asp:BoundField DataField="AadhaarNo" HeaderText="AadhaarNo" SortExpression="AadhaarNo" />
                        </Columns>
                    </asp:GridView><asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="VoterID" HeaderText="VoterID" SortExpression="VoterID" />
                            <asp:BoundField DataField="VoterName" HeaderText="VoterName" SortExpression="VoterName" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                            <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" />
                            <asp:BoundField DataField="MotherName" HeaderText="MotherName" SortExpression="MotherName" />
                            <asp:BoundField DataField="MaritalStatus" HeaderText="MaritalStatus" SortExpression="MaritalStatus" />
                            <asp:BoundField DataField="Occupation" HeaderText="Occupation" SortExpression="Occupation" />
                            <asp:BoundField DataField="IncomePerMonthRs" HeaderText="IncomePerMonthRs" SortExpression="IncomePerMonthRs" />
                            <asp:BoundField DataField="AadhaarNo" HeaderText="AadhaarNo" SortExpression="AadhaarNo" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
