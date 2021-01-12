using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class viewresult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SqlDataSource1.SelectCommand = "SELECT SNo,A.ZoneID, ZoneName,B.CandidateId,CandidateName,VoteCount ,Convert(varchar(10),ElectionDate,103) as ElectionDate FROM ZoneDetails A, CandidatesList B ,VotesCount C where A.ZoneId=C.ZoneId and B.CandidateId=C.CandidateId";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
    }
}
