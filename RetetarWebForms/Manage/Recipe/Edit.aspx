<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="RetetarWebForms.Manage.Recipe.Edit" ValidateRequest="false" EnableEventValidation="false" %>

<%@ Register TagPrefix="re" TagName="imageBrowserControl" Src="~/Components/ImageBrowser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="documentHead" runat="server">
    <link rel="stylesheet" href="/css/editor.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
        <asp:ObjectDataSource ID="CategoryDS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.CategoriesTableAdapter" UpdateMethod="Update">
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

        <asp:ObjectDataSource runat="server" ID="RecipeDS" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataById" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.RecipesTableAdapter" UpdateMethod="UpdateWithCurrrentDate" DeleteMethod="Delete" InsertMethod="Insert">
            <DeleteParameters>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                <asp:Parameter Name="Content" Type="String"></asp:Parameter>
                <asp:Parameter Name="ImagePath" Type="String"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="id" Name="id" Type="Int32"></asp:QueryStringParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryId" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Name" Type="String"></asp:Parameter>
                <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                <asp:Parameter Name="Content" Type="String"></asp:Parameter>
                <asp:Parameter Name="ImagePath" Type="String"></asp:Parameter>
                <asp:Parameter Name="Original_Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:ObjectDataSource>

        <asp:ListView ID="RecipeList" runat="server" DataSourceID="RecipeDS" DataKeyNames="Id" OnItemUpdated="RecipeList_ItemUpdated">
            <EditItemTemplate>
                <div class="row">
                    <div class="mb-1 col-sm-4">
                        <asp:Label CssClass="form-label" ID="CategoryIdLabel" runat="server" Text="Categoria:" AssociatedControlID="CategoryIdDropDownList"></asp:Label>
                        <asp:DropDownList CssClass="form-control" ID="CategoryIdDropDownList" runat="server" DataSourceID="CategoryDS"
                            DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("CategoryId") %>' AppendDataBoundItems="True">
                            <asp:ListItem Text="-- Alegeti --" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger"
                            ErrorMessage="Alegeti o categorie!" ControlToValidate="CategoryIdDropDownList"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-1 col-sm-8">
                        <asp:Label CssClass="form-label" ID="Label4" runat="server" Text="Imagine reprezentativa:" AssociatedControlID="ImagePathTextBox"></asp:Label>
                        <div class="row">
                            <div class="col-sm-auto">
                                <asp:LinkButton ID="imageBtn" CssClass="btn btn-primary" runat="server" OnClick="imageBtn_Click" CausesValidation="False" UseSubmitBehavior="False">
									<i class="bi bi-image"></i> Alege imaginea
                                </asp:LinkButton>
                            </div>
                            <div class="col-sm-8 flex-grow-1">
                                <asp:TextBox CssClass="form-control" Text='<%# Bind("ImagePath") %>' runat="server" ID="ImagePathTextBox" />
                            </div>
                        </div>

                        <asp:Panel ID="imageBrowserPanel" runat="server" ClientIDMode="Static" Visible="False">
                            <div class="row">
                                <div class="col">
                                    <asp:LinkButton ID="closeBtn" runat="server" OnClick="closeBtn_Click" UseSubmitBehavior="false" CausesValidation="false" CssClass="m-2 btn btn-danger d-inline-block">
										<span class="bi bi-x-lg"></span> Inchide
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <re:imageBrowserControl ID="imageBrowser" runat="server" OnOnSelectedImageChanged="imageBrowser_OnSelectedImageChanged" EnableViewState="False" ValidateRequestMode="Disabled" />
                        </asp:Panel>
                    </div>
                    <div class="mb-1 col-sm-12">
                        <asp:Label CssClass="form-label" ID="Label2" runat="server" Text="Denumire reteta:" AssociatedControlID="NameTextBox"></asp:Label>
                        <asp:TextBox CssClass="form-control" Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="text-danger"
                            ErrorMessage="Introduceti denumirea retetei!" ControlToValidate="NameTextBox"></asp:RequiredFieldValidator>
                    </div>
                    <div class="mb-1 col-sm-12">
                        <asp:Label CssClass="form-label" ID="Label3" runat="server" Text="Descriere scurta (pentru promovare):" AssociatedControlID="DescriptionTextBox"></asp:Label>
                        <asp:TextBox CssClass="form-control" Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" Rows="4" TextMode="MultiLine" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="text-danger"
                            ErrorMessage="O descriere scurta este necesara!" ControlToValidate="DescriptionTextBox" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <asp:TextBox ClientIDMode="Static" ID="Content" runat="server" Text='<%# Bind("Content") %>' Style="display: none;"></asp:TextBox>
                        <asp:Label CssClass="form-label" ID="Label1" runat="server" Text="Continutul retetei" AssociatedControlID="RecipeContent"></asp:Label>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Introduceti continut de minim 100 de caractere!" CssClass="text-danger"
                            Display="Dynamic" ControlToValidate="Content" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                        <asp:Panel ID="RecipeContent" runat="server" ClientIDMode="Static"><%# Eval("Content") %></asp:Panel>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="mb-1 col-sm-12">
                        <asp:LinkButton runat="server" CommandName="Update" ID="InsertButton" CssClass="btn btn-success">
							<i class="bi bi-save"></i> Salveaza reteta
                        </asp:LinkButton>
                        <asp:HyperLink runat="server" ID="CancelButton" CssClass="btn btn-danger" NavigateUrl="Index.aspx">
							<i class="bi bi-x"></i> Anuleaza
                        </asp:HyperLink>
                    </div>
                    <div class="col-sm-12 mt-2 mb-2">
                        <asp:ValidationSummary ID="ValidationSummary1" CssClass="text-danger" runat="server" />
                    </div>
                </div>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>Nu am gasit reteta!</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">CategoryId:
					<asp:TextBox Text='<%# Bind("CategoryId") %>' runat="server" ID="CategoryIdTextBox" /><br />
                    Name:
					<asp:TextBox Text='<%# Bind("Name") %>' runat="server" ID="NameTextBox" /><br />
                    Description:
					<asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                    Content:
					<asp:TextBox Text='<%# Bind("Content") %>' runat="server" ID="ContentTextBox" /><br />
                    ImagePath:
					<asp:TextBox Text='<%# Bind("ImagePath") %>' runat="server" ID="ImagePathTextBox" /><br />
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                    <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="">Id:
					<asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                    CategoryId:
					<asp:Label Text='<%# Eval("CategoryId") %>' runat="server" ID="CategoryIdLabel" /><br />
                    Name:
					<asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /><br />
                    Description:
					<asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /><br />
                    Content:
					<asp:Label Text='<%# Eval("Content") %>' runat="server" ID="ContentLabel" /><br />
                    PublishDate:
					<asp:Label Text='<%# Eval("PublishDate") %>' runat="server" ID="PublishDateLabel" /><br />
                    ImagePath:
					<asp:Label Text='<%# Eval("ImagePath") %>' runat="server" ID="ImagePathLabel" /><br />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    <br />
                    <br />
                </span>
            </ItemTemplate>
            <LayoutTemplate>
                <div runat="server" id="itemPlaceholderContainer" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">Id:
					<asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" /><br />
                    CategoryId:
					<asp:Label Text='<%# Eval("CategoryId") %>' runat="server" ID="CategoryIdLabel" /><br />
                    Name:
					<asp:Label Text='<%# Eval("Name") %>' runat="server" ID="NameLabel" /><br />
                    Description:
					<asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /><br />
                    Content:
					<asp:Label Text='<%# Eval("Content") %>' runat="server" ID="ContentLabel" /><br />
                    PublishDate:
					<asp:Label Text='<%# Eval("PublishDate") %>' runat="server" ID="PublishDateLabel" /><br />
                    ImagePath:
					<asp:Label Text='<%# Eval("ImagePath") %>' runat="server" ID="ImagePathLabel" /><br />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                    <br />
                    <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodyScript" runat="server">
    <script src="/js/lib/katex.min.js"></script>
    <script src="/js/lib/highlight.min.js"></script>
    <script src="/js/lib/quill-v1/quill.js"></script>
    <script src="/js/lib/quill-v1/modules/quill-blot-formatter/quill-blot-formatter.min.js"></script>
    <script type="module" src="/js/editor.js"></script>
</asp:Content>
