<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_Templates_CustomPostback" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v8.1" Namespace="DevExpress.Web.ASPxGridView"  TagPrefix="dxwgv" %>

<%-- EndRegion --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Custom Edit Buttons</title>
</head>
<body>
	<form id="form1" runat="server" enableviewstate="true">

	<br />
	You may edit customers from the country: <dxe:ASPxComboBox ID="cbCountries" runat="server" DataSourceID="dsCountries" TextField="Country" SelectedIndex="0" AutoPostBack="true" OnSelectedIndexChanged="cbCountries_SelectedIndexChanged" />
	<br />
	<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="dsMain" KeyFieldName="CustomerID" Width="100%" OnRowUpdating="grid_RowUpdating">
		<Columns>
			<dxwgv:GridViewDataColumn FieldName="CustomerID" VisibleIndex="0">
				<DataItemTemplate>
					<%#GetEditRowHtml(Container.VisibleIndex)%>
				</DataItemTemplate>
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="ContactName" VisibleIndex="1">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="2">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="3">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="4">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="5">
			</dxwgv:GridViewDataColumn>
		</Columns>
	</dxwgv:ASPxGridView>
	<%-- BeginRegion DataSource--%>
	<asp:AccessDataSource ID="dsMain" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT * FROM [Customers]" >
	</asp:AccessDataSource>
	<asp:AccessDataSource ID="dsCountries" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT distinct Country FROM [Customers]" >
	</asp:AccessDataSource>
	<%-- EndRegion --%>
	</form>
</body>
</html>
