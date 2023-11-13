<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryManagerControl.ascx.cs" Inherits="RetetarWebForms.Components.CategoryManagerControl" %>
<%@ Register TagPrefix="re" TagName="imageBrowser" Src="~/Components/ImageBrowser.ascx" %>

<asp:ObjectDataSource ID="CategorySource" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.CategoriesTableAdapter" UpdateMethod="Update" OnInserting="CategorySource_Inserting">
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

<%-- Categorie noua --%>
<asp:Panel ID="Panel1" runat="server" Visible="False">
    <div class="row m-2">
        <asp:Label runat="server" ID="lblError" CssClass="text-danger"></asp:Label>
    </div>
    <div class="row m-2">
        <div class="col-sm-auto">
            <asp:Label ID="Label1" runat="server" Text="Nume categorie" AssociatedControlID="txtCategorie"></asp:Label>
            <asp:TextBox ID="txtCategorie" runat="server"></asp:TextBox>

            <br/>
            <asp:RequiredFieldValidator ID="newCategoryNameRequiredVal" runat="server"
                                        ErrorMessage="Introduceti numele categoriei" ValidationGroup="newCategoryVal"
                                        CssClass="text-danger" ControlToValidate="txtCategorie" Display="Dynamic">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="newCategoryvalidator" runat="server"
                                            ErrorMessage="Numele catergorie trebuie sa aiba minim 4 caractere si maxim 50"
                                            ControlToValidate="txtCategorie" ValidationExpression="^[a-zA-Z0-9 ]{4,50}$"
                                            CssClass="text-danger" Display="Dynamic" ValidationGroup="newCategoryVal">
            </asp:RegularExpressionValidator>
        </div>
        <div class="col-sm-auto">
            <asp:Label ID="Label2" runat="server" Text="Imagine categorie"></asp:Label>
            <asp:TextBox ID="txtImagine" runat="server" ValidationGroup="newCategoryVal"></asp:TextBox>
            <asp:Button runat="server" ID="btnNewImageBrowse" OnClick="btnNewImageBrowse_OnClick" Text="Alege imaginea" ValidateRequestMode="Disabled" UseSubmitBehavior="false"/>
            <br/>
            <asp:Panel ID="newImageBrowserPanel" CssClass="imageBrowserPanel" runat="server" ClientIDMode="Static" Visible="false">
                <div class="row">
                    <div class="col">
                        <asp:LinkButton ID="closeNewBtn" runat="server" OnClick="closeNewBtn_Click" UseSubmitBehavior="false" CausesValidation="false" CssClass="m-2 btn btn-danger d-inline-block">
                            <span class="bi bi-x-lg"></span> Inchide
                        </asp:LinkButton>
                    </div>
                </div>
                <re:imageBrowser runat="server" ID="newSelectImage" Visible="False" OnOnSelectedImageChanged="newSelectImage_OnOnSelectedImageChanged" ValidateRequestMode="Disabled"></re:imageBrowser>
            </asp:Panel>

            <asp:RequiredFieldValidator ID="newImageRequiredValidator" runat="server"
                                        ErrorMessage="Alegeti o imagine pentru categorie" ValidationGroup="newCategoryVal"
                                        CssClass="text-danger" ControlToValidate="txtImagine" Display="Dynamic">
            </asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="newImageValidator" runat="server"
                                            ErrorMessage="Tip fisier invalid!" ControlToValidate="txtImagine" CssClass="text-danger"
                                            ValidationExpression="^.*\.(jpg|jpeg|gif|png|bmp)$" Display="Dynamic" ValidationGroup="newCategoryVal">
            </asp:RegularExpressionValidator>
        </div>
        <div class="col-md-12 m-2">
            <asp:LinkButton ID="btnAddNew" runat="server" Text="Inregistreaza" CssClass="btn btn-primary" OnClick="btnAddNew_Click" ValidationGroup="newCategoryVal">
                <i class="bi bi-save"></i> Inregistreaza
            </asp:LinkButton>
            <asp:LinkButton ID="btnCancel" runat="server" Text="Anuleaza" CssClass="btn btn-danger" OnClick="Anuleaza_Click">
                <i class="bi bi-x"></i> Anuleaza
            </asp:LinkButton>
        </div>
    </div>
</asp:Panel>

<asp:LinkButton ID="btnNew" CssClass="btn btn-primary m-2" runat="server" OnClick="btnNew_Click">
    <span class="bi bi-plus"></span> Categorie noua
</asp:LinkButton>

<%-- Editare categorii --%>
<asp:Panel ID="Panel2" runat="server">
    <asp:ListView ID="CategoryList" runat="server" DataSourceID="CategorySource" DataKeyNames="Id" OnItemUpdated="CategoryList_ItemUpdated">
        <EditItemTemplate>
            <div class="col-sm-3">
                <div class="shadow-lg m-2 p-2">
                    <div class="mb-2">
                        <span>Id: </span>
                        <asp:Label ID="IdLabel1" CssClass="form-label" runat="server" Text='<%# Eval("Id") %>'/>
                    </div>
                    <div class="mb-2">

                        <asp:Label runat="server" ID="lblEditError" CssClass="text-danger"></asp:Label>

                        <asp:Label ID="Label3" CssClass="form-label" runat="server" Text="Name:" AssociatedControlID="NameTextBox"></asp:Label>


                        <asp:TextBox ID="NameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Name") %>' ValidationGroup="editCat"/>
                        <asp:RequiredFieldValidator ID="editCategoryNameRequiredVal" runat="server"
                                                    ErrorMessage="Introduceti numele categoriei" ValidationGroup="editCat"
                                                    CssClass="text-danger" ControlToValidate="NameTextBox" Display="Dynamic" ViewStateMode="Inherit">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                        ValidationGroup="editCat" CssClass="text-danger" ControlToValidate="NameTextBox" Display="Dynamic"
                                                        ValidationExpression="^[a-zA-Z0-9 ]{4,50}$" ErrorMessage="Numele categoriei trebuie sa fie intre 4 si 50 de caractere."/>


                    </div>

                    <div class="mb-2">
                        <asp:Label ID="Label4" CssClass="form-label" runat="server" Text="ImageUrl:"
                                   AssociatedControlID="editImagePreview">
                        </asp:Label>


                        <asp:TextBox ID="ImageUrlTextBox" CssClass="form-control" runat="server"
                                     Text='<%# Bind("ImageUrl") %>' ValidationGroup="editCat"/>
                        <asp:RegularExpressionValidator ID="editImageValidator" runat="server" ControlToValidate="ImageUrlTextBox"
                                                        CssClass="text-danger" Display="Dynamic" ErrorMessage="Tip fisier invalid!"
                                                        ValidationExpression="^.*\.(jpg|jpeg|gif|png|bmp)$" ValidationGroup="editCat">
                        </asp:RegularExpressionValidator>

                        <asp:RequiredFieldValidator ID="editImageRequiredValidator" runat="server"
                                                    ErrorMessage="Alegeti o imagine pentru categorie" ValidationGroup="editCat"
                                                    CssClass="text-danger" ControlToValidate="ImageUrlTextBox" Display="Dynamic">
                        </asp:RequiredFieldValidator>


                        <div class="d-flex justify-content-center m-2">
                            <asp:Image runat="server" ID="editImagePreview" Height="200px" CssClass="img-thumbnail"
                                       ImageUrl='<%# Eval("ImageUrl") %>'/>
                        </div>
                        <div class="d-flex justify-content-center m-2">
                            <asp:Button runat="server" ID="btnEditImageBrowse" CssClass="btn btn-primary"
                                        OnClick="btnEditImageBrowse_OnClick" Text="Schimba imaginea"
                                        UseSubmitBehavior="False" CausesValidation="false"/>
                        </div>

                        <asp:Panel ID="editImageBrowserPanel" CssClass="imageBrowserPanel" runat="server" ClientIDMode="Static" Visible="false">
                            <div class="row">
                                <div class="col">
                                    <asp:LinkButton ID="closeEditBtn" runat="server" OnClick="closeEditBtn_Click" UseSubmitBehavior="false" CausesValidation="false" CssClass="m-2 btn btn-danger d-inline-block">
                                        <span class="bi bi-x-lg"></span> Inchide
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <re:imageBrowser runat="server" ID="editSelectImage" OnOnSelectedImageChanged="editSelectImage_OnOnSelectedImageChanged"
                                             Visible="False"/>
                        </asp:Panel>
                    </div>

                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" ValidationGroup="editCat" CommandName="Update" CssClass="btn btn-success">
                        <i class="bi bi-save"></i> Actualizeaza
                    </asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger">
                        <i class="bi bi-x"></i> Anuleaza
                    </asp:LinkButton>
                    <br/>
                    <br/>
                </div>
            </div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>Nu este nici o categorie definita!</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <div class="col-sm-auto shadow-lg">
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'/>
                <br/>
                ImageUrl:
                <asp:TextBox ID="ImageUrlTextBox" runat="server" Text='<%# Bind("ImageUrl") %>'/>
                <br/>
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert"/>
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear"/>
                <br/>
                <br/>
            </div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="col-3">
                <div class="shadow m-2 p-2">
                    <div class="input-group input-group-sm">
                        <asp:Label CssClass="input-group-text" runat="server" Text="Id:" AssociatedControlID="IdTextBox"></asp:Label>
                        <asp:TextBox ID="IdTextBox" CssClass="form-control" runat="server" Text='<%# Eval("Id") %>' ReadOnly="true"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <asp:Label CssClass="input-group-text" runat="server" Text="Categorie:" AssociatedControlID="TextBox1"></asp:Label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Eval("Name") %>' ReadOnly="true"/>
                    </div>
                    <div class="input-group input-group-sm">
                        <asp:Label CssClass="input-group-text" runat="server" Text="Imagine:" AssociatedControlID="TextBox2"></asp:Label>
                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Text='<%# Eval("ImageUrl") %>' ReadOnly="true"/>
                    </div>

                    <div class="d-flex justify-content-center m-2">
                        <asp:Image runat="server" CssClass="img-thumbnail" Height="200px" ImageUrl='<%# Eval("ImageUrl") %>'/>
                    </div>

                    <div class="d-flex justify-content-center">
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" CssClass="btn btn-primary m-1">
                            <i class="bi bi-pencil-fill"></i> Editeaza
                        </asp:LinkButton>

                        <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger m-1">
                            <i class="bi bi-x"></i> Sterge
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" class="row g-2">
                <div runat="server" id="itemPlaceholder" class="col-sm-auto"></div>
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Panel>