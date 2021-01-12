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
public partial class addcandidatezone : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {

            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
            cls.cmd.CommandText = "select candidateid from  candidateslist";
            SqlDataReader r = cls.cmd.ExecuteReader();
            DropDownList1.Items.Add("Select");
            while (r.Read())
            {
                DropDownList1.Items.Add(r[0].ToString());
            }
            r.Close();
            cls.cmd.CommandText = "select ZoneId from  ZoneDetails";
            r = cls.cmd.ExecuteReader();
            DropDownList2.Items.Add("Select");
            while (r.Read())
            {
                DropDownList2.Items.Add(r[0].ToString());
            }
            r.Close();
            cls.cmd.CommandText = "select PartyId from  Parties";
            r = cls.cmd.ExecuteReader();
            DropDownList3.Items.Add("Select");
            while (r.Read())
            {
                DropDownList3.Items.Add(r[0].ToString());
            }
            r.Close();
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
            cls.cmd.CommandText = "Delete From Candidate_ZoneDetails Where CandidateID="  + DropDownList1.SelectedItem.Text + " and ZoneId=" + DropDownList2.SelectedItem.Text;
            cls.cmd.ExecuteNonQuery();
            cls.cmd.CommandText = "insert into Candidate_ZoneDetails([CandidateID], [ZoneId],PartyId) values(" + DropDownList1.SelectedItem.Text + ","+ DropDownList2.SelectedItem.Text + ","+ DropDownList3.SelectedItem.Text + ")";
            if (cls.cmd.ExecuteNonQuery() > 0)
            {
                lblMessage.Text = "Candidate Zone Details Saved";
            }
            else
            {
                lblMessage.Text = "Candidate Zone Details Not Saved";
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
        SqlDataSource1.SelectCommand = "Select * From Candidate_ZoneDetails";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
    }
}
