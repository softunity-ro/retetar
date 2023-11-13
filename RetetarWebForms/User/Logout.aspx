<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="RetetarWebForms.Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div>
        <h2>Deconectare utilizator</h2>
        <asp:LoginStatus ID="LoginStatus" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/default.aspx" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyScript" runat="server">
</asp:Content>
