<%@ Control Language="C#" CodeBehind="MainMenuControl.ascx.cs" Inherits="RetetarWebForms.Components.MainMenuControl" %>

<nav class="navbar navbar-expand-lg bg-success shadow-sm" style="border-bottom: solid 5px #d1e7dd;">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <img id="logo-header" src="/img/logo.png" alt="Logo"/>
        </a>
        <button class="navbar-toggler text-white fs-1" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="bi bi-menu-button-wide-fill"></i> Meniu
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
            <ul class="navbar-nav mb-2 mb-lg-0 bg-white rounded-5" style="box-shadow: 5px 5px 0px 2px rgba(179,175,179,1);">
                <li class="nav-item">
                    <a class="nav-link active" href="/"><i class="bi bi-house"></i> Acasa</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-receipt-cutoff"></i> Categorii retete
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <asp:Repeater ID="CategoryRepeater" runat="server" DataSourceID="CategoryODS">
                            <ItemTemplate>
                                <li>
                                    <a class="dropdown-item" href="/Category.aspx?id=<%# Eval("Id") %>"><%# Eval("Name") %></a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:ObjectDataSource ID="CategoryODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCategoryNames" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.CategoriesTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_Id" Type="Int32"/>
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Name" Type="String"/>
                                <asp:Parameter Name="ImageUrl" Type="String"/>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Name" Type="String"/>
                                <asp:Parameter Name="ImageUrl" Type="String"/>
                                <asp:Parameter Name="Original_Id" Type="Int32"/>
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </ul>
                </li>

                <li class="nav-item">
                    <asp:HyperLink ID="ContactLink" runat="server" CssClass="nav-link" NavigateUrl="~/Contact.aspx"><i class="bi bi-envelope-at-fill"></i> Contact</asp:HyperLink>
                </li>
                <asp:LoginView ID="LoginView2" runat="server">
                    <LoggedInTemplate>
                        <li class="nav-item">
                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="nav-link" NavigateUrl="~/Manage/Index.aspx"><i class="bi bi-clipboard2-fill"></i> Administrare</asp:HyperLink>
                        </li>
                    </LoggedInTemplate>
                </asp:LoginView>
            </ul>
        </div>
        <div class="ms-auto">
            <div class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        <asp:LinkButton ID="btnLogin" runat="server" Text="Autentificare" CausesValidation="false" CssClass="btn btn-secondary" OnClick="btnLogin_Click">
                            <i class="bi bi-box-arrow-in-right"></i> Autentificare
                        </asp:LinkButton>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        <asp:LinkButton ID="btnLogout" runat="server" Text="Autentificare" CausesValidation="false" CssClass="btn btn-secondary" OnClick="btnLogout_Click">
                            <i class="bi bi-box-arrow-in-right"></i> Deconectare,
                            <asp:LoginName ID="LoginName1" runat="server"/>
                        </asp:LinkButton>
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
        </div>
    </div>
</nav>