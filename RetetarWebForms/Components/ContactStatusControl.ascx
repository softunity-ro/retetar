<%@ Control Language="C#" CodeBehind="ContactStatusControl.ascx.cs" Inherits="RetetarWebForms.Components.ContactStatusControl" %>

<%
	if (IsSuccess)
	{
%>
	<h1 class="text-success">Mesajul a fost trimis cu succes!</h1>
<%
	}
	else
	{
%>
	<h1 class="text-danger">Am întâmpinat o eroare la trimiterea mesajului!</h1>
<%
	}
%>