<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Recipe.aspx.cs" Inherits="RetetarWebForms.Recipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <asp:ObjectDataSource runat="server" ID="SimilaRecipesDS" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCategoryIdNotInId" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.RecipesTableAdapter" UpdateMethod="Update">
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
        <SelectParameters>
            <asp:Parameter Name="categoryId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </SelectParameters>
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
    <asp:ObjectDataSource ID="RecipeDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataById" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.RecipesTableAdapter" UpdateMethod="Update" OnSelected="RecipeDS_Selected">
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
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" DefaultValue="1" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
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

    <asp:ListView ID="RecipeList" runat="server" DataSourceID="RecipeDS" DataKeyNames="Id">
        <EmptyDataTemplate>
            <h1 class="text-center text-danger">Nu am gasit reteta!</h1>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div class="container pt-2">
                <div class="row gx-5">
                    <div class="col-sm-12">
                        <h1 class="text-center recipe-title mt-2 text-success"><%# Eval("Name") %></h1>
                        <div class="text-center mt-2">
                            <span>Din categoria: </span><a class="link-primary" href="/Category.aspx?id=<%# Eval("CategoryId") %>"><%# Eval("CategoryName") %></a>
                            <span>Publicata la data: <%# Eval("PublishDate", "{0:dd/MM/yyyy}") %></span>
                        </div>
                    </div>
                    <div class="col-sm-8 mt-2">
                        <div class="recipe-content rounded-3 p-3 bg-secondary-subtle shadow h-100">
                            <%# Eval("Content") %>
                        </div>
                    </div>
                    <div class="col-sm-4 recipe-similar mt-2 p-2">
                        <h4 class="bg-success text-white p-2 mb-3 shadow-sm">Alte retete din categoria <a class="text-white fw-bolder text-decoration-none" href="/Category.aspx?id=<%# Eval("CategoryId") %>"><%# Eval("CategoryName") %></a></h4>
                        <asp:ListView ID="AlteReteteLS" runat="server" DataSourceID="SimilaRecipesDS" DataKeyNames="Id">
                            <EmptyDataTemplate>
                                <span>Ne pare rau dar nu mai avem alte retete similare.</span>
                            </EmptyDataTemplate>
                            <ItemTemplate>
                                <div class="col-12 shadow bg-success-subtle p-2 float-none">
                                    <a class="link-success" runat="server" href='<%# "Recipe.aspx?id=" + Eval("Id") %>'>
                                        <asp:Image ID="Image1" CssClass="float-start me-2 mb-2" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="100px" />
                                        <h5 class="text-center"><%# Eval("Name") %></h5>
                                    </a>
                                    <p class="mb-0"><%# Eval("Description") %></p>
                                </div>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <div runat="server" id="itemPlaceholderContainer" class="row gy-4">
                                    <div runat="server" id="itemPlaceholder"></div>
                                </div>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>

        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer" style="">
                <div runat="server" id="itemPlaceholder"></div>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
