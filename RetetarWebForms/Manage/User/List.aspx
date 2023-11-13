<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="RetetarWebForms.Manage.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <h1>Lista utilizatori</h1>
    <a class="btn btn-success mb-2" href="Register.aspx">Utilizator nou</a>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="UsersDataSource" CssClass="table table-bordered table-hover" DataKeyNames="Id">
        <Columns>
            <asp:ButtonField CommandName="Delete" Text="Sterge" ControlStyle-CssClass="btn btn-danger">
                <ControlStyle CssClass="btn btn-danger"></ControlStyle>
            </asp:ButtonField>
            <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="/Manage/User/ChangePassword.aspx?id={0}" Text="Schimba parola" ControlStyle-CssClass="btn btn-primary" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Username" HeaderText="Nume utilizator" SortExpression="Username" />
            <asp:CheckBoxField DataField="ChangePasswordRequired" HeaderText="Schimbare parola necesara?" SortExpression="ChangePasswordRequired" />
            
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="UsersDataSource" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" DeleteMethod="Delete" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.UsersTableAdapter">
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="ChangePasswordRequired" Type="Boolean" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyScript" runat="server">
</asp:Content>
