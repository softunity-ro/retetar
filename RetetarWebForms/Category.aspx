<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="RetetarWebForms.Category" %>

<%@ Register TagPrefix="re" TagName="recipes" Src="~/Components/RecipesControl.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <asp:ObjectDataSource runat="server" ID="CategoryDS" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetById" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.CategoriesTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" DefaultValue="1" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
            <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>

    <h1 class="text-center mt-2"><%: CategoryName %></h1>

    <re:recipes runat="server" ID="RecipesCtrl" />
</asp:Content>
