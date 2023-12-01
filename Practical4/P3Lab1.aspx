<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="P3Lab1.aspx.cs" Inherits="Practical4.P3Lab1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div> Select category: 
            <asp:DropDownList ID="ddlcategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="CategoryName" DataValueField="CategoryID">
            </asp:DropDownList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString2 %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <asp:Repeater ID="rptProducts" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <td colspan="4">Product List</td>
                        </tr>
                        <tr>
                            <td>No.</td>
                            <td>Product ID</td>
                            <td>Product Name</td>
                            <td>Unit Price</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Container.ItemIndex %></td>
                            <td><%# Eval("ProductID") %></td>
                            <td><%# Eval("ProductName") %></td>
                            <td><%# Eval("UnitPrice") %></td>
                        </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                            </FooterTemplate>

            </asp:Repeater>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString2 %>" SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice] FROM [Alphabetical list of products] WHERE ([CategoryID] = @CategoryID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlcategory" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
