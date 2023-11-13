<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="~/Components/SlideControl.ascx.cs" Inherits="RetetarWebForms.Components.SlideControl" %>

<a class="link-light text-decoration-none" href="/Recipe.aspx?id=<%: RecipeId %>">
    <div class='<%: IsActive ? "slide shadow bg-success text-white active-slide" : "slide shadow bg-success text-white" %>'>
        <div class="row">
            <img class="col-md-4 slide-img anim-img" src="<%: string.IsNullOrWhiteSpace(ImageSource) ? "/img/logo.png" : ImageSource %>" alt="<%: Title %>" />
            <div class="col-md-8 slide-desc">
                <div class="row">
                    <div class="col-12 slide-title text-center anim-title">
                        <%: Title %>
                    </div>
                    <div class="col-12 slide-desc">
                        <%: Description %>...
                    </div>
                </div>
            </div>
        </div>
    </div>
</a>
