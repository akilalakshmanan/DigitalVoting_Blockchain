using System;
using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class add_voter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Page.IsPostBack == false))
        {
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
            cls.cmd.CommandText = "select coalesce(max(Voterid),0) from  Voterslist";
            if (cls.cmd.ExecuteScalar() == null)
            {
                TextBox1.Text = "1";
            }
            else
            {
                int sno = int.Parse(cls.cmd.ExecuteScalar().ToString()) + 1;
                TextBox1.Text = sno.ToString();
            }
            cls.cmd.CommandText = "select zoneid from zonedetails";
            SqlDataReader r;
            r = cls.cmd.ExecuteReader();
            while (r.Read())
            {
                DropDownList2.Items.Add(r[0].ToString());
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
            if (cls.con2.State != ConnectionState.Open)
            {
                cls.con2.Open();
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
            string VoterID = "";
            string VoterName = "";
            string Address = "";
            string Phone = "";
            string Gender = "";
            string DOB = "";
            string FatherName = "";
            string MotherName = "";
            string MaritalStatus = "";
            string Occupation = "";
            string IncomePerMonthRs = "";
            string Password = "";
            string ZoneId = "";

            string emailid = "";
            string aadhaarno = "";
            EncryptMessage(ref VoterID, TextBox1.Text);
            EncryptMessage(ref VoterName, TextBox2.Text);
            EncryptMessage(ref Address, TextBox3.Text);
            EncryptMessage(ref Phone, TextBox4.Text);

            EncryptMessage(ref Gender, DropDownList1.SelectedItem.Text);


            EncryptMessage(ref DOB, TextBox6.Text);
            EncryptMessage(ref FatherName, TextBox7.Text);
            EncryptMessage(ref MotherName, TextBox8.Text);
            EncryptMessage(ref MaritalStatus, g);
            EncryptMessage(ref Occupation, TextBox10.Text);
            EncryptMessage(ref IncomePerMonthRs, TextBox11.Text);
            EncryptMessage(ref Password, TextBox5.Text);
            EncryptMessage(ref ZoneId, DropDownList2.SelectedItem.Text);
            EncryptMessage(ref emailid, TextBox12.Text);
            EncryptMessage(ref aadhaarno, TextBox13.Text);

            cls.cmd.CommandText="Select count(*) from VotersList Where AadhaarNo='" + TextBox13.Text + "'";
            if(int.Parse(cls.cmd.ExecuteScalar().ToString())>0)
            {
            lblMessage.Text="Aadhaar No. already found in database. Retr with other Aadhaar No.";
                return;
            }

            cls.cmd.CommandText = "insert into EncVotersList([VoterID], [VoterName], [Address], [Phone], [Gender], [DOB], [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs],[Password],ZoneId,EMailId,AadhaarNo) values('" + VoterID.Replace("'", "''") + "','" + VoterName.Replace("'", "''") + "','" + Address.Replace("'", "''") + "','" + Phone.Replace("'", "''") + "','" + Gender.Replace("'", "''") + "','" + DOB.Replace("'", "''") + "','" + FatherName.Replace("'", "''") + "','" + MotherName.Replace("'", "''") + "','" + MaritalStatus.Replace("'", "''") + "','" + Occupation.Replace("'", "''") + "','" + IncomePerMonthRs.Replace("'", "''") + "','" + Password.Replace("'", "''") + "','" + ZoneId.Replace("'", "''") + "','" + emailid.Replace("'", "''") + "','" + aadhaarno.Replace("'", "''") + "')";
            cls.cmd.ExecuteNonQuery();
            cls.cmd2.CommandText = cls.cmd.CommandText;
            cls.cmd2.ExecuteNonQuery();

            if ((FileUpload1.PostedFile == null))
            {
                fname = "";

                DateTime d = DateTime.ParseExact(TextBox6.Text, "dd/MM/yyyy", null);
                cls.cmd.CommandText = "insert into VotersList([VoterID], [VoterName], [Address], [Phone], [Gender], [DOB], [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs],[Password],ZoneId,EMailId,AadhaarNo) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + DropDownList1.SelectedItem.Text + "','" + String.Format("{0:MM-dd-yyyy}", d) + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + g + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + TextBox5.Text + "'," + DropDownList2.SelectedItem.Text + ",'" + TextBox12.Text + "','" + TextBox13.Text  +"')";
                cls.cmd.ExecuteNonQuery();

                cls.cmd2.CommandText = cls.cmd.CommandText;
                cls.cmd2.ExecuteNonQuery();
                saved = true;
            }
            else
            {
                //      FileUpload1.PostedFile.SaveAs(Server.MapPath(".") & "\VoterFingerPrintImages\" & fname)
                string[] fn = FileUpload1.PostedFile.FileName.Split(new char[] { '\\' });
                fname = fn[fn.Length - 1];

               

                FileUpload1.PostedFile.SaveAs((Server.MapPath(".") + ("\\VoterFingerPrintImages\\" + fname)));
                System.IO.FileStream f = new System.IO.FileStream((Server.MapPath(".") + ("\\VoterFingerPrintImages\\" + fname)), System.IO.FileMode.Open);
                byte[] b = new byte[f.Length];
                f.Read(b, 0, b.Length);


                DateTime d = DateTime.Today;

                try
                {
                    d = DateTime.ParseExact(TextBox6.Text, "dd/MM/yyyy", null);
                }
                catch (Exception ex)
                {
                    d = DateTime.ParseExact(TextBox6.Text, "dd-MM-yyyy", null);

                }
                cls.cmd.CommandText = "insert into VotersList([VoterID], [VoterName], [Address], [Phone], [Gender], [DOB], [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs],[Password],ZoneId,EMailId,AadhaarNo) values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + DropDownList1.SelectedItem.Text + "','" + String.Format("{0:MM-dd-yyyy}", d) + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + g + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + TextBox5.Text + "'," + DropDownList2.SelectedItem.Text + ",'" + TextBox12.Text + "','" + TextBox13.Text + "')";
                cls.cmd.ExecuteNonQuery();

                cls.cmd2.CommandText = cls.cmd.CommandText;
                cls.cmd2.ExecuteNonQuery();

                System.Data.SqlClient.SqlParameter p = new System.Data.SqlClient.SqlParameter("@image", SqlDbType.Image);
                p.Value = b;
                cls.cmd.CommandText = "Update VotersList Set FingerPrintImage=@Image Where VoterId=" + TextBox1.Text;
                cls.cmd.Parameters.Clear();
                cls.cmd.Parameters.Add(p);
                cls.cmd.ExecuteNonQuery();


                //=======================
                if (FileUpload2.PostedFile != null)
                {
                    string[] fn2 = FileUpload2.PostedFile.FileName.Split(new char[] { '\\' });
                    string fname2 = fn2[fn2.Length - 1];
                    FileUpload2.PostedFile.SaveAs((Server.MapPath(".") + ("\\VoterIrisPrintImages\\" + fname2)));
                    System.IO.FileStream f2 = new System.IO.FileStream((Server.MapPath(".") + ("\\VoterIrisPrintImages\\" + fname2)), System.IO.FileMode.Open);
                    byte[] b2 = new byte[f2.Length];
                    f2.Read(b2, 0, b2.Length);

                    System.Data.SqlClient.SqlParameter p2 = new System.Data.SqlClient.SqlParameter("@image", SqlDbType.Image);
                    p2.Value = b2;
                    cls.cmd.CommandText = "Update VotersList Set IrisPrintImage=@Image Where VoterId=" + TextBox1.Text;
                    cls.cmd.Parameters.Clear();
                    cls.cmd.Parameters.Add(p2);
                    cls.cmd.ExecuteNonQuery();
                }


                saved = true;
            }
            if ((saved == true))
            {

                try
                {
                    clssendmail.MailSend(TextBox12.Text, "Confirmation", "You are added in voter list with id : " + TextBox1.Text);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = ex.Message;
                    return;
                }
                lblMessage.Text = "Voter Details Saved";

                string msg = cls.OneWayEncrpyt (TextBox1.Text + "^" + TextBox2.Text + "^" +  String.Format("{0:MM-dd-yyyy}", DateTime.Now)) ;

                try
                {
                    cls.cmd.CommandText = "Select Max(SNo) From BlockChain ";
                    int sno = 0;
                    if (cls.cmd.ExecuteScalar() == null)
                    {
                        sno = 1;
                        msg = cls.OneWayEncrpyt(TextBox1.Text + "^" + TextBox2.Text + "^" + TextBox13.Text + "^" + String.Format("{0:MM-dd-yyyy}", DateTime.Now));
                    }
                    else if (cls.cmd.ExecuteScalar() == DBNull.Value)
                    {
                        sno = 1;
                         msg = cls.OneWayEncrpyt(TextBox1.Text + "^" + TextBox2.Text + "^" + TextBox13.Text + "^" + String.Format("{0:MM-dd-yyyy}", DateTime.Now));
                    }
                    else
                    {
                        sno = int.Parse(cls.cmd.ExecuteScalar().ToString()) + 1;
                    }
                    if (sno > 1)
                    {
                        int snominusone=sno-1;
                        cls.cmd.CommandText = "Select  HashKeyValue From BlockChain Where SNo=" + snominusone;
                        string hash = cls.cmd.ExecuteScalar().ToString();

                       msg = cls.OneWayEncrpyt(TextBox1.Text + "^" + TextBox2.Text + "^" + TextBox13.Text + "^" + String.Format("{0:MM-dd-yyyy}", DateTime.Now) + "^" +  hash);
                      // Response.Write(msg);
                    }

                cls.cmd.CommandText="Insert into BlockChain (VoterId,EntryTime,HashKeyValue,AccessType,SNo,PreviousSNo) Values ('" + TextBox1.Text + "','" +  String.Format("{0:MM-dd-yyyy hh:mm:ss tt}", DateTime.Now) + "','" + msg + "','Registration','" + sno.ToString() + "','0')";
                cls.cmd.ExecuteNonQuery();
                }
                catch (Exception ex){}
            }
            else
            {
                lblMessage.Text = "Voter Details Not Saved";
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
        SqlDataSource1.SelectCommand = "SELECT [VoterID], [VoterName], [Address], [Phone], [Gender],  DOB, [FatherName], [MotherName], [MaritalStatus], [Occupation], [IncomePerMonthRs],AadhaarNo FROM [EncVotersList]";
        SqlDataSource1.DataBind();
        GridView1.DataBind();
        //  GridView2.DataBind();
    }
    public void EncryptMessage(ref string encaccno, string accno)//ref byte[] key)
    {
        //clsColorCode.textmessage = accno;
        //encaccno = clsColorCode.Encrypt();

        clsTripleDES des = new clsTripleDES();
        encaccno = des.Encrypt(accno);

    }
    public string DecryptMessage(string encaccno)//ref byte[] key)
    {

        /*clsColorCode.outputcolors.Clear();
        int r, g, b;
        for (int i = 0; i < encaccno.Length; i += 3)
        {
            r = ((int)encaccno[i]);
            g = ((int)encaccno[i + 1]);
            b = ((int)encaccno[i + 2]);

            clsColorCode.outputcolors.Add(Color.FromArgb(r, g, b));
        }
        return clsColorCode.Decrypt();
        */
        string accno = "";
        clsTripleDES des = new clsTripleDES();
        accno = des.Decrypt(encaccno);
        return accno;
    }
    int i;

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                for (i = 0; i <= e.Row.Cells.Count - 1; i++)
                {
                    if (e.Row.Cells[i].Text != "")
                    {
                        e.Row.Cells[i].Text = DecryptMessage(e.Row.Cells[i].Text);
                    }
                }
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }
}
