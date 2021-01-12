using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class addparty: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // if(Page.IsPostBack ==false)
       // TextBox2.Text = "0";


    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
            cls.cmd.CommandText = "insert into parties(PartyName,TotalCount) values('"+ TextBox1.Text + "',0)";
            if (cls.cmd.ExecuteNonQuery() > 0)
            {
                lblMessage.Text = "Party Details Saved";
            }
            else
            {
                lblMessage.Text = "Party Details Not Saved";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.Message;
        }
        finally
        {
            cls.con.Close();
        }
        SqlDataSource1.SelectCommand = "SELECT * FROM [Parties]";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
    }
}
