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

public partial class leftmenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Label1.Text = "Welcome, " + Session["un"].ToString();
    }
}