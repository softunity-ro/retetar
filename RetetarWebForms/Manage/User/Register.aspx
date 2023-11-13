<%@ Page Title="Inregistrare utilizator" Language="C#" MasterPageFile="~/Main.master" CodeBehind="Register.aspx.cs" Inherits="RetetarWebForms.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-12 text-center">
                <h2 class="bg-warning pb-1">Inregistrare utilizator</h2>

                <h3 runat="server" ID="errorText" class="text-danger"></h3>
            </div>
            <div class="col-sm-auto">
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
                <div class="mb-3 text-center text-danger">
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                </div>
                <div class="mb-3 text-center">
                    <asp:Button ID="RegisterButton" runat="server" CssClass="btn btn-warning" Text="Inregistreaza" ValidationGroup="LoginControl" OnClick="RegisterButton_OnClick"/>
                </div>
            </div>
        </div>
        <div class="text-center">
            <asp:HyperLink runat="server" CssClass="link-primary" NavigateUrl="~/User/Login.aspx">Autentificare</asp:HyperLink>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyScript" runat="server"></asp:Content>