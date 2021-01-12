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

public partial class addcandidate : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if ((cls.con.State != ConnectionState.Open))
        {
            cls.con.Open();
        }
        cls.cmd.CommandText = "select max(candidateid) from  candidateslist";
        if ((cls.cmd.ExecuteScalar() == null))
        {
            TextBox1.Text = "1";
        }
        else
        {
            int sno = int.Parse(cls.cmd.ExecuteScalar().ToString()) + 1;
            TextBox1.Text = sno.ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if ((cls.con.State != ConnectionState.Open))
            {
                cls.con.Open();
            }
            string g = "";
            if (RadioButton1.Checked)
            {
                g = "Married";
            }
            else
            {
                g = "Unmarried";
            }
            string fname = "";
            bool saved;
            if ((FileUpload1.PostedFile == null))
            {
                fname = "";
                cls.cmd.CommandText = "insert into CandidatesList([CandidateID], [CandidateName], [Address], [Phone], [Gender], [DOB], [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs], [FingerPrintImage], [NumberofAttempt]) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + DropDownList1.SelectedItem.Text + "','"  + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + g + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + fname + "','" + TextBox13.Text + "')" ;
                cls.cmd.ExecuteNonQuery();
                saved = true;
            }
            else

            {

                DateTime d = DateTime.ParseExact(TextBox6.Text, "dd/MM/yyyy", null);

                string[] fn = FileUpload1.PostedFile.FileName.Split(new char[] { '\\' });
                fname = fn[fn.Length - 1];
                FileUpload1.PostedFile.SaveAs((Server.MapPath(".") + ("\\CandidateFingerPrintImages\\" + fname)));
                System.IO.FileStream f = new System.IO.FileStream((Server.MapPath(".") + ("\\CandidateFingerPrintImages\\" + fname)), System.IO.FileMode.Open);
                byte[] b=new byte[f.Length];
                f.Read(b, 0, b.Length);
                // Dim ms As New System.IO.MemoryStream(b)
                cls.cmd.CommandText = "insert into CandidatesList([CandidateID], [CandidateName], [Address], [Phone], [Gender], [DOB], [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs],  [NumberofAttempt]) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + DropDownList1.SelectedItem.Text + "','" + string.Format("{0:MM-dd-yyyy}",d) + "','" + TextBox7.Text + "','" + TextBox8.Text + "','"+  g + "','" + TextBox10.Text + "','"+  TextBox11.Text + "','" + TextBox13.Text + "')";

                cls.cmd.ExecuteNonQuery();
                System.Data.SqlClient.SqlParameter p = new System.Data.SqlClient.SqlParameter("@image", SqlDbType.Image);
                p.Value = b;
                cls.cmd.CommandText = ("Update CandidatesList Set FingerPrintImage=@Image Where CandidateId=" + TextBox1.Text);
                cls.cmd.Parameters.Clear();
                cls.cmd.Parameters.Add(p);
                cls.cmd.ExecuteNonQuery();
                saved = true;
            }
            if ((saved == true))
            {
                lblMessage.Text = "Candidate Details Saved";
            }
            else
            {
                lblMessage.Text = "Candidate Details Not Saved";
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
        SqlDataSource1.SelectCommand = "SELECT [CandidateID], [CandidateName], [Address], [Phone], [Gender], Convert(varchar(10),DOB,103) as DOB, [FatherName], [MotherName], [MaritalStatus], [Occupation],[IncomePerMonthRs], [FingerPrintImage], [NumberofAttempt] FROM [CandidatesList]";
        SqlDataSource1.DataBind();
    }
}
