Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls

Partial Public Class Grid_Templates_CustomPostback
	Inherits System.Web.UI.Page
	Protected Function GetEditRowHtml(ByVal visibleIndex As Integer) As String
		Dim rowValue As String = Convert.ToString(grid.GetRowValues(visibleIndex, "Country"))
		Dim cbValue As String = Convert.ToString(cbCountries.Value)
		If rowValue = cbValue Then
			Return String.Format("<a href='JavaScript:grid.StartEditRow({0})'> Edit </a>", visibleIndex)
		End If
		Return "Read Only"
	End Function
	Protected Sub cbCountries_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
		grid.DataBind()
	End Sub
	Protected Sub grid_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Throw New InvalidOperationException("Data modifications are not allowed in the online demo")
	End Sub
End Class
