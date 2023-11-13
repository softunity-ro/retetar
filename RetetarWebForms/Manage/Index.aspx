<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="~/Manage/Index.aspx.cs" Inherits="RetetarWebForms.Manage.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
    <style>
        .img-small {
            max-width: 250px;
            max-height: 100px;
            height: 100px;
            object-fit: scale-down;
        }

        .ico-img {
            font-size: 100px;
            line-height: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <asp:ObjectDataSource ID="ReportsDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="RecipesCountByCategory" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.CategoriesTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="ImageUrl" Type="String"></asp:Parameter>
            <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>


    <div class="container-fluid">
        <div class="row g-4 mt-2 justify-content-center">
            <div class="col-sm-3 col-md-2">
                <asp:HyperLink runat="server" NavigateUrl="~/Manage/Recipe/New.aspx" CssClass="btn btn-outline-success w-75 h-100">
                    <div class="d-flex flex-column align-items-center shadow shadow-lg h-100">
                        <i class="bi bi-plus-lg img-small ico-img"></i>
                        <br/>
                        <h3 class="align-self-center">Reteta noua</h3>
                    </div>
                </asp:HyperLink>
            </div>
            <div class="col-sm-3 col-md-2">
                <asp:HyperLink runat="server" NavigateUrl="~/Manage/Recipe/Index.aspx" CssClass="btn btn-success w-75 h-100">
                    <div class="d-flex flex-column align-items-center shadow shadow-lg h-100">
                        <img class="img-small" src="/img/logo.png" alt="Gestiune Retete"/>
                        <br/>
                        <h3 class="align-self-center">Retete</h3>
                    </div>
                </asp:HyperLink>
            </div>
            <div class="col-sm-3 col-md-2">
                <asp:HyperLink runat="server" NavigateUrl="~/Manage/Category/Index.aspx" CssClass="btn btn-primary w-75 h-100">
                    <div class="d-flex flex-column align-items-center shadow shadow-lg h-100">
                        <img class="img-small" src="/img/gestiune_categorii.png" alt="Imagine administrare categorii"/>
                        <br/>
                        <h3 class="align-self-center">Categorii</h3>
                    </div>
                </asp:HyperLink>
            </div>
            <div class="col-sm-3 col-md-2">
                <asp:HyperLink runat="server" NavigateUrl="~/Manage/User/List.aspx" CssClass="btn btn-danger w-75 h-100">
                    <div class="d-flex flex-column align-items-center shadow shadow-lg h-100">
                        <img class="img-small" src="/img/padlock.png" alt="Imagine administrare acces"/>
                        <br/>
                        <h3 class="align-self-center">Accese</h3>
                    </div>
                </asp:HyperLink>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-sm-12">
                <asp:ListView ID="RecipesReport" runat="server" DataSourceID="ReportsDS" DataKeyNames="Id">
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                            <tr>
                                <td>Nu exista nici o categorie definita!</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td runat="server"/>
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <div class="col-sm-3 p-3 ">
                            <a href='<%# "../Category.aspx?id=" + Eval("Id") %>' class="d-block text-decoration-none text-dark shadow p-2">
                                <h3 class="text-center text-white bg-primary"><%# Eval("Name") %></h3>
                                <asp:Image ID="Image1" runat="server" CssClass="img-thumbnail" ImageUrl='<%# Eval("ImageUrl") %>' Height="75px"/>
                                Numar retete:
                                <asp:Label Text='<%# Eval("RecipesCount") %>' runat="server" ID="Label3"/>
                            </a>
                        </div>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div class="row g-2">
                            <div id="itemPlaceholder" runat="server"></div>
                        </div>
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>