using System;
using System.Data;
using System.Data.SqlClient ;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class viewwinnerzonewise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack == false)
            fill();
    }
    void fill()
    {
    
          DataTable dt = new DataTable();
        DataColumn dc1 = new DataColumn("ZoneId");
        DataColumn dc2 = new DataColumn("CandidateId");
        DataColumn dc11 = new DataColumn("ZoneName");
        DataColumn dc21 = new DataColumn("CandidateName");
        DataColumn dc3 = new DataColumn("MaxVotes");
        dt.Columns.Clear();
        dt.Columns.Add(dc1);
        dt.Columns.Add(dc11);
        dt.Columns.Add(dc2);
        dt.Columns.Add(dc21);
        dt.Columns.Add(dc3);
        if (cls.con.State != ConnectionState.Open)
            cls.con.Open();
        cls.cmd.CommandText = "Select ZoneId From ZoneDetails";
        SqlDataReader r = cls.cmd.ExecuteReader();
        while (r.Read())
        {
            DataRow dr = dt.NewRow();
            dr[0] = r[0].ToString();
            dt.Rows.Add(dr);
        }
        r.Close();
        for(int i=0;i<dt.Rows.Count;i++)
        {
            cls.cmd.CommandText = "Select Max(VoteCount) From VotesCount Where ZoneId='" + dt.Rows[i][0].ToString() + "'";
            r=cls.cmd.ExecuteReader();
            if(r.Read())
            {
                dt.Rows[i][4] = r[0].ToString();
            }
            r.Close();

            if( dt.Rows[i][4] !=null)
            {
                int sno = 0;
                cls.cmd.CommandText = "Select SNo From VotesCount Where VoteCount='" + dt.Rows[i][4].ToString() + "' and ZoneId='" + dt.Rows[i][0].ToString() + "'";

                if (cls.cmd.ExecuteScalar() != null)
                {
                    sno = int.Parse(cls.cmd.ExecuteScalar().ToString());

                    cls.cmd.CommandText = "Select CandidateId From  VotesCount Where SNo=" + sno;
                    dt.Rows[i][2] = cls.cmd.ExecuteScalar().ToString();
                    cls.cmd.CommandText = "Select CandidateName From  CandidatesList Where CandidateId='" + dt.Rows[i][2].ToString() + "'";
                    dt.Rows[i][3] = cls.cmd.ExecuteScalar().ToString();
                    cls.cmd.CommandText = "Select ZoneName From  ZoneDetails Where ZoneId='" + dt.Rows[i][0].ToString() + "'"; 
                    dt.Rows[i][1] = cls.cmd.ExecuteScalar().ToString();
                }
            }
             

                GridView1.DataSource = dt;
                GridView1.DataBind();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
                fill();

      
    }
}
