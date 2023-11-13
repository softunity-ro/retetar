<%@ Page Title="Retetar" Language="C#" MasterPageFile="~/Main.master" CodeBehind="Default.aspx.cs" Inherits="RetetarWebForms.Default" %>

<%@ Register TagPrefix="uc" TagName="slider" Src="~/Components/SliderControl.ascx" %>
<%@ Register TagPrefix="uc" TagName="categories" Src="~/Components/CategoriesControl.ascx" %>

<asp:Content ContentPlaceHolderID="documentHead" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/slider.css" />
</asp:Content>
<asp:Content ContentPlaceHolderID="bodyContent" runat="server">
        <uc:slider runat="server" ID="HomeSlider" />
        <hr />
        <h1 class="text-center">Categorii</h1>
        <uc:categories runat="server" />

        <script src="/js/slider.js" type="text/javascript"></script>
</asp:Content>
