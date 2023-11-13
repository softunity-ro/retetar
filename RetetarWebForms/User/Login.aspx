<%@ Page Title="Autentificare" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RetetarWebForms.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-12 text-center">
                <h2 class="bg-success text-white pb-1">Autentificare</h2>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Pentru a accesa panoul de administrare introduceti credentialele in formularul de mai jos."></asp:Label>
                </p>
            </div>
            <div class="col-sm-auto">
                <asp:Login ID="LoginControl" runat="server" OnAuthenticate="LoginControl_Authenticate" LoginButtonText='Autentifica' FailureText="Credentialele nu sunt valide, va rugam reincercati." RememberMeText="Tine-ma minte." TitleText="" UserNameLabelText="Nume utilizator:" PasswordLabelText="Parola:" UserNameRequiredErrorMessage="Introduceti userul" DestinationPageUrl="~/Manage/Index.aspx" PasswordRequiredErrorMessage="Introduceti parola" RememberMeSet="True" RenderOuterTable="false">
                    <LayoutTemplate>
                        <div class="mb-3">
                            <asp:Label ID="UserNameLabel" CssClass="form-label" runat="server" AssociatedControlID="UserName">Nume utilizator:</asp:Label>
                            <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" CssClass="text-danger" ErrorMessage="Introduceti userul" ForeColor="Red" Text="Introduceti userul" ValidationGroup="LoginControl" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3">
                            <asp:Label ID="PasswordLabel" CssClass="form-label" runat="server" AssociatedControlID="Password">Parola:</asp:Label>
                            <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="Introduceti parola" ForeColor="Red" Text="Introduceti parola" ValidationGroup="LoginControl" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="mb-3 text-center">
                            <asp:CheckBox ID="RememberMe" runat="server" Text="Tine-ma minte." />
                        </div>
                        <div class="mb-3 text-center text-danger">
                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                        </div>
                        <div class="mb-3 text-center">
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="btn btn-success" Text="Autentifica" ValidationGroup="LoginControl" />
                        </div>
                    </LayoutTemplate>
                </asp:Login>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyScript" runat="server">
</asp:Content>
