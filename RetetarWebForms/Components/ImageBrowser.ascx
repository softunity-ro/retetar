<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ImageBrowser.ascx.cs" Inherits="RetetarWebForms.Components.ImageBrowser" %>

<div runat="server" class="container container-sm <%# PanelCssClass %>" style="<%# PanelStyle %>">

	<asp:Panel ID="panelNew" Visible="False" runat="server">
		<div class="row">
			<div class="col-sm-auto">
				<asp:Label ID="Label2" runat="server" Text="Alegeti o imagine: "></asp:Label>
				<asp:FileUpload ID="newImage" CssClass="form-control" ClientIDMode="Static"
					runat="server" accept="image/png, image/jpeg, image/png, image/gif" ValidationGroup="newCategoryVal" />

				<br />

				<asp:RequiredFieldValidator ID="newImageRequiredValidator" runat="server"
					ErrorMessage="Alegeti o imagine pentru categorie" ValidationGroup="imageGroup"
					CssClass="text-danger" ControlToValidate="newImage" Display="Dynamic">
				</asp:RequiredFieldValidator>

				<asp:RegularExpressionValidator ID="newImageFileTypeValidator" runat="server"
					ErrorMessage="Tip fisier invalid!" ControlToValidate="newImage" CssClass="text-danger"
					ValidationExpression="^.*\.(jpg|jpeg|gif|png|bmp)$" Display="Dynamic" ValidationGroup="imageGroup">
				</asp:RegularExpressionValidator>
			</div>

		</div>
		<div class="row">
			<div class="col-sm-auto">
				<asp:Button ID="btnSave" runat="server" Text="Salveaza imaginea" CssClass="btn btn-success m-2" OnClick="btnSave_Click" ValidationGroup="imageGroup" />
				<asp:Button ID="btnCancel" runat="server" Text="Anuleaza" CssClass="btn btn-danger m-2" OnClick="btnCancel_OnClick" CausesValidation="False" />
			</div>
		</div>
		<div class="row">
			<div class="col-md-auto">
				<asp:Image ClientIDMode="Static" ID="previewImage" runat="server" style="max-height: 450px;" />
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(() => {
				$('#newImage').change(function () {
					var file = this.files[0];
					console.log(file);
					if (file) {
						var reader = new FileReader();
						reader.onload = function (event) {
							console.log(event.target.result);
							$('#previewImage').attr('src', event.target.result);
						}
						reader.readAsDataURL(file);
					}
				});
			});
		</script>
	</asp:Panel>

	<asp:Panel ID="panelBrowse" runat="server">
		<div class="row m-2">
			<div class="col-sm-auto">
				<asp:LinkButton CssClass="btn btn-warning m-1" ID="btnNew" runat="server" OnClick="btnNew_OnClick" style="position:absolute;" CausesValidation="False">
					<span class="bi bi-plus"></span> Adauga imagine noua
				</asp:LinkButton>
			</div>
		</div>

		<div class="row m-2 mt-5">
			<asp:ListView ID="ImageList" runat="server" ItemType="RetetarWebForms.Models.ImageFileDto">
				<ItemTemplate>
					<div class="col-sm-auto">
						<asp:ImageButton ID="ImagePreview" runat="server" ImageUrl='<%# Eval("WebPath") %>' Height="150px" CssClass="img-thumbnail" OnClick="ImagePreview_OnClick" CausesValidation="False" />
						<br />
						<asp:Label runat="server"></asp:Label>
					</div>
				</ItemTemplate>
			</asp:ListView>
		</div>
	</asp:Panel>

</div>
