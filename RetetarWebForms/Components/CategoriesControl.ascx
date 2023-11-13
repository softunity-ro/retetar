<%@ Control Language="C#" CodeBehind="CategoriesControl.ascx.cs" Inherits="RetetarWebForms.Components.CategoriesControl" %>

<div class="row pt-3">
	<asp:Repeater ID="Repeater1" runat="server" DataSourceID="CategoriesODS">
		<ItemTemplate>
			<div class="col-sm-4 p-3 category-wrapper">
				<a href="/Category.aspx?id=<%# Eval("Id") %>" style="text-decoration: none; color: #000000;">
					<div class="category-widget d-flex flex-column">
						<img class="category-widget-image" src="<%# Eval("ImageUrl") %>" alt="retetar"/>
						<h3 class="category-widget-name align-self-end text-center" style="width: 100%;" ><%# Eval("Name") %></h3>
					</div>
				</a>
			</div>
		</ItemTemplate>
	</asp:Repeater>
	<asp:ObjectDataSource ID="CategoriesODS" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="RetetarWebForms.App_Code.RetetarDataSetTableAdapters.CategoriesTableAdapter" UpdateMethod="Update">
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
</div>