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

public partial class addZone: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
        }
        if ((Page.IsPostBack == false))
        {
            cls.cmd.CommandText = "select count(*) from zonedetails";
            int sno = int.Parse(cls.cmd.ExecuteScalar().ToString()) + 1;
            TextBox1.Text = sno.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
            cls.cmd.CommandText = "Delete From ZoneDetails Where ZoneID="+ TextBox1.Text + "";
            cls.cmd.ExecuteNonQuery();
            cls.cmd.CommandText = "insert into ZoneDetails([ZoneID], [ZoneName]) values("+ TextBox1.Text + ",'"+ TextBox2.Text + "')";
            if (cls.cmd.ExecuteNonQuery() > 0)
            {
                lblMessage.Text = "Zone Details Saved";
            }
            else
            {
                lblMessage.Text = "Zone Details Not Saved";
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
        SqlDataSource1.SelectCommand = "Select * From ZoneDetails";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
    }
}
