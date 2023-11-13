<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="RetetarWebForms.Contact" Async="true" %>

<%@ Register Assembly="Recaptcha.Web" Namespace="Recaptcha.Web.UI.Controls" TagPrefix="uc" %>
<%@ Register TagPrefix="uc" TagName="status" Src="Components/ContactStatusControl.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="d-flex">
        <div class="mx-auto" runat="server" id="formular">
            <div class="mb-2">
                <label class="form-label" for="nume">Numele si prenumele</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Camp obligatoriu!" ControlToValidate="nume" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <input id="nume" class="form-control" runat="server" />
            </div>
            <div class="mb-2">
                <label class="form-label" for="email">Adresa de e-mail</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Camp obligatoriu!" ControlToValidate="email" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <input id="email" class="form-control" runat="server" />
            </div>
            <div class="mb-2">
                <label class="form-label" for="telefon">Numarul de telefon</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Camp obligatoriu!" ControlToValidate="telefon" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <input id="telefon" class="form-control" runat="server" />
            </div>
            <div class="mb-2">
                <label class="form-label" for="mesaj">Mesajul dumneavoastra</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Camp obligatoriu!" ControlToValidate="mesaj" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                <textarea id="mesaj" class="form-control" runat="server" rows="4"></textarea>
            </div>
            <div id="secure_form" class="pt-2 pb-2"></div>
            <uc:RecaptchaWidget ID="Recaptcha" runat="server" />
            <p id="lblMessage" class="form-label text-danger" runat="server"></p>
            <input id="SubmitBtn" class="btn btn-success mt-2" type="submit" value="Trimite" runat="server" onserverclick="SubmitBtn_ServerClick" />
        </div>
        <div runat="server" id="formStatus" visible="False">
            <uc:status ID="status" runat="server" />
        </div>
    </div>
</asp:Content>
