<%@ Control Language="C#" CodeBehind="RecipesControl.ascx.cs" Inherits="RetetarWebForms.Components.RecipesControl" %>

<asp:ObjectDataSource runat="server" ID="RecipeCategoryDS" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCategoryId" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.RecipesTableAdapter">
    <SelectParameters>
        <asp:QueryStringParameter QueryStringField="id" DefaultValue="1" Name="categoryId" Type="Int32"></asp:QueryStringParameter>
    </SelectParameters>
</asp:ObjectDataSource>
<dic class="container">
    <div class="row g-4">
        <asp:Repeater runat="server" ID="RecipeRepeater" DataSourceID="RecipeCategoryDS">            
            <ItemTemplate>
                <div class="col-sm-4">
                    <div class="recipe-widget">
                        <asp:HyperLink runat="server" CssClass="link-success" Style="width: 100%;"
                            NavigateUrl='<%# "/Recipe.aspx?id=" + Eval("Id") %>'>
							<img class="recipe-widget-image img-thumbnail" 
							     src="<%# (Eval("ImagePath").ToString() == "") ? "/img/logo.png" : Eval("ImagePath") %>" 
							     alt="retetar"/>
							<h3 class="recipe-widget-name text-center"><%# Eval("Name") %></h3>
                        </asp:HyperLink>
                        <p class="text-center mb-0 mt-2"><%# Eval("CategoryName") %> - <%# Eval("PublishDate", "{0:dd/MM/yyyy}") %></p>
                        <p class="fs-4 p-2"><%# string.Concat(Eval("Description").ToString().Take(100)) %> ...</p>

                        <asp:HyperLink runat="server" CssClass="btn btn-lg btn-success mb-2"
                            NavigateUrl='<%# "/Recipe.aspx?id=" + Eval("Id") %>'>
							Citeste reteta
                        </asp:HyperLink>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</dic>
