using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Grid_Templates_CustomPostback : System.Web.UI.Page {
    protected string GetEditRowHtml(int visibleIndex) {
        string rowValue = Convert.ToString(grid.GetRowValues(visibleIndex, "Country"));
        string cbValue = Convert.ToString(cbCountries.Value);
        if(rowValue == cbValue)
            return string.Format("<a href='JavaScript:grid.StartEditRow({0})'> Edit </a>", visibleIndex);
        return "Read Only";
    }
    protected void cbCountries_SelectedIndexChanged(object sender, EventArgs e) {
        grid.DataBind();
    }
    protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        throw new InvalidOperationException("Data modifications are not allowed in the online demo");
    }
}
