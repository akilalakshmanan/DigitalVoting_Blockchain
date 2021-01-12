<%@ Page Language="C#" AutoEventWireup="false" CodeFile="addcandidate.aspx.cs" Inherits="addcandidate" %>
<%@ Register Src="leftmenu.ascx" TagName="leftmenu" TagPrefix="uc2" %>

<%@ Register Src="header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Candidate Creation Page</title>
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
                                            <asp:Label ID="Label1" runat="server" Text="CANDIDATE CREATION" CssClass="myhead"></asp:Label><br />
                     <hr color="#073A71"  width="400"/></td>
                          
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="Candidate ID"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                                ErrorMessage="Party Name must not be empty">*</asp:RequiredFieldValidator></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="Candidate Name"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server" Rows="5" TextMode="MultiLine"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            <asp:Label ID="Label5" runat="server" Text="Phone"></asp:Label></td>
                                        <td style="height: 26px">
                                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                                        <td style="height: 26px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text="Gender"></asp:Label></td>
                                        <td>
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
                                        <td>
                                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text="Father Name"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label9" runat="server" Text="Mother Name"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 22px">
                                            <asp:Label ID="Label10" runat="server" Text="Marital Status"></asp:Label></td>
                                        <td style="height: 22px">
                                            &nbsp;<asp:RadioButton ID="RadioButton1" runat="server" GroupName="m" Text="Married" />
                                            <asp:RadioButton ID="RadioButton2" runat="server" GroupName="m" Text="Unmarried" /></td>
                                        <td style="height: 22px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label11" runat="server" Text="Occupation"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label12" runat="server" Text="Income / Month (Rs)"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 23px">
                                            <asp:Label ID="Label13" runat="server" Text="Finger Print Image"></asp:Label></td>
                                        <td style="height: 23px">
                                            &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" /></td>
                                        <td style="height: 23px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label14" runat="server" Text="Number of Attempts"></asp:Label></td>
                                        <td>
                                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT [CandidateID], [CandidateName], [Address], [Phone], [Gender], Convert(varchar(10),DOB,103) as DOB, [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs], [FingerPrintImage], [NumberofAttempt] FROM [CandidatesList]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="CandidateID" HeaderText="CandidateID" InsertVisible="False"
                                ReadOnly="True" SortExpression="CandidateID" />
                            <asp:BoundField DataField="CandidateName" HeaderText="CandidateName" SortExpression="CandidateName" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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
    
    </div>
    </form>
</body>
</html>
