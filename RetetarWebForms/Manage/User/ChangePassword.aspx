<%@ Page Title="Schimbare parola" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="RetetarWebForms.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-sm-12 text-center">
                <h2 class="bg-primary text-white pb-1">Schimbare parola utilizator: <asp:Label ID="UserLabel" CssClass="text-dark" runat="server" Text="Label"></asp:Label></h2>
                <h3 runat="server" id="errorText" class="text-danger"></h3>
            </div>
            <input runat="server" id="UserId" type="hidden" />
            <div class="col-sm-auto">
                <div class="mb-3">
                    <asp:Label ID="Label1" CssClass="form-label" runat="server" AssociatedControlID="OldPassword">Parola veche:</asp:Label>
                    <asp:TextBox ID="OldPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="OldPassword" CssClass="text-danger" ErrorMessage="Introduceti parola veche" ForeColor="Red" Text="Introduceti parola veche" ValidationGroup="LoginControl" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <asp:Label ID="Label2" CssClass="form-label" runat="server" AssociatedControlID="NewPassword">Parola noua:</asp:Label>
                    <asp:TextBox ID="NewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NewPassword" CssClass="text-danger" ErrorMessage="Introduceti parola noua" ForeColor="Red" Text="Introduceti parola noua" ValidationGroup="LoginControl" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3">
                    <asp:Label ID="Label3" CssClass="form-label" runat="server" AssociatedControlID="NewPasswordPair">Confirmare parola noua:</asp:Label>
                    <asp:TextBox ID="NewPasswordPair" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NewPasswordPair" CssClass="text-danger" ErrorMessage="Introduceti parola noua" ForeColor="Red" Text="Introduceti parola noua" ValidationGroup="LoginControl" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div class="mb-3 text-center text-danger">
                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                </div>
                <div class="mb-3 text-center">
                    <asp:Button ID="SaveButton" runat="server" CssClass="btn btn-primary" Text="Schimba parola" ValidationGroup="LoginControl" OnClick="SaveButton_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyScript" runat="server"></asp:Content>
