<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="~/Components/SliderControl.ascx.cs" Inherits="RetetarWebForms.Components.SliderControl" %>
<%@ Register TagPrefix="uc" TagName="slide" Src="~/Components/SlideControl.ascx" %>

<asp:ObjectDataSource ID="LastFiveRecipesDS" runat="server" SelectMethod="GetData" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.RecipesTableAdapter">
</asp:ObjectDataSource>

<div class="slideShow">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="LastFiveRecipesDS" DataKeyNames="Id" OnItemDataBound="ListView1_ItemDataBound">
        <EmptyDataTemplate>
        </EmptyDataTemplate>
        <ItemTemplate>
            <uc:slide runat="server" ID="slide" RecipeId='<%# Eval("Id") %>' ImageSource='<%# Eval("ImagePath") %>' Description='<%# Eval("Description") %>' Title='<%# Eval("Name") %>'/>
        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer">
                <span runat="server" id="itemPlaceholder"></span>
            </div>
        </LayoutTemplate>
    </asp:ListView>

    <button type="button" class="slide-btn slide-previous-btn" onclick="previousSlide(true)">
        <span class="bi bi-arrow-left-circle-fill"></span>
    </button>
    <button type="button" class="slide-btn slide-next-btn" onclick="nextSlide(true)">
        <span class="bi bi-arrow-right-circle-fill"></span>
    </button>
</div>