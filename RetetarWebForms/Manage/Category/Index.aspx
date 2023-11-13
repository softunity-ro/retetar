<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="~/Manage/Category/Index.aspx.cs" Inherits="RetetarWebForms.Manage.Category.Index" MaintainScrollPositionOnPostback="true" EnableEventValidation="false" %>

<%@ Register TagPrefix="re" TagName="categories" Src="~/Components/CategoryManagerControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <re:categories runat="server"></re:categories>
</asp:Content>
