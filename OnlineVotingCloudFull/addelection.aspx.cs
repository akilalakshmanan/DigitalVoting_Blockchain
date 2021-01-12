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

public partial class addelection: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
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
            DateTime d = Calendar1.SelectedDate; // DateTime.ParseExact(TextBox1.Text, "dd/MM/yyyy", null);
            cls.cmd.CommandText = "Delete From Elections Where ElectionDate='"+ String.Format( "{0:MM-dd-yyyy}",d) + "'";
            cls.cmd.ExecuteNonQuery();
            cls.cmd.CommandText = "insert into Elections ([ElectionDate]) values('"+ String.Format( "{0:MM-dd-yyyy}",d)+ "')";
            if (cls.cmd.ExecuteNonQuery() > 0)
            {
                lblMessage.Text = "Election Date Fixed";
            }
            else
            {
                lblMessage.Text = "Election Date Not Fixed";
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
        SqlDataSource1.SelectCommand = "SELECT [SNo], convert(varchar(10),ElectionDate,103) as ElectionDate  FROM [Elections]";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
    }
}
