<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="RetetarWebForms.Manage.Recipe.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <asp:ObjectDataSource runat="server" ID="RecepesDS" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataIncludeCategoryName" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.RecipesTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="Content" Type="String"></asp:Parameter>
            <asp:Parameter Name="ImagePath" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="CategoryId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="Description" Type="String"></asp:Parameter>
            <asp:Parameter Name="Content" Type="String"></asp:Parameter>
            <asp:Parameter Name="PublishDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="ImagePath" Type="String"></asp:Parameter>
            <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:ListView ID="RecipeList" runat="server" DataSourceID="RecepesDS" DataKeyNames="Id">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>Nu exista nici o reteta inregistrata!</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table runat="server" id="itemPlaceholderContainer" style="" class="table table-bordered table-autosize table-striped">
                <tr runat="server" style="" class="bg-success-subtle">
                    <th runat="server" class="text-center" colspan="2">
                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn btn-primary" NavigateUrl="~/Manage/Recipe/New.aspx">
                                <i class="bi-plus"></i> Reteta noua
                        </asp:HyperLink>
                    </th>
                    <th runat="server" class="text-center">Categoria</th>
                    <th runat="server" class="text-center">Titlu</th>
                    <th runat="server" class="text-center">Descriere scurta</th>
                    <th runat="server" class="text-center">Data publicarii</th>
                    <th runat="server" class="text-center">Imaginea reprezentativa</th>
                </tr>
                <tr runat="server" id="itemPlaceholder"></tr>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-danger m-1 w-100">
							<i class="bi bi-x"></i> Sterge
                    </asp:LinkButton>

                    <asp:HyperLink ID="EditButton" runat="server" CssClass="btn btn-sm btn-primary m-1 w-100"
                        NavigateUrl='<%# "Edit.aspx?id=" + Eval("Id") %>'>
							<i class="bi bi-pencil"></i> Editeaza
                    </asp:HyperLink>
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("CategoryName") %>' runat="server" ID="CategoryIdLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("PublishDate") %>' runat="server" ID="PublishDateLabel" />
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="50px" />
                </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>