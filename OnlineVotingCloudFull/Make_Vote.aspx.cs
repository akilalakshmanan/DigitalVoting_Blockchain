using System;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Make_Vote : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((Session["un"].ToString() == ""))
        {
            Response.Redirect("voterlogin.aspx");
            return;
        }
        if ((Page.IsPostBack == false))
        {
            TextBox1.Text = Session["un"].ToString();
            if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
            cls.cmd.CommandText = "Select ZoneId From VotersList Where VoterId=" + Session["un"].ToString();
            Label2.Text = cls.cmd.ExecuteScalar().ToString();
            cls.cmd.CommandText = "select B.CandidateId,A.CandidateName from CandidatesList A,Candidate_ZoneDetails B Where A.CandidateId=B.CandidateId and B.ZoneId=" + Label2.Text;
            SqlDataReader r = cls.cmd.ExecuteReader();
            while (r.Read())
            {
                DropDownList1.Items.Add(r[0].ToString() + ":" + r[1].ToString());
            }
            r.Close();
        }

 if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
            cls.cmd.CommandText = "Select Count(*) From Elections Where ElectionDate ='" + String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "'";
            if (int.Parse(cls.cmd.ExecuteScalar().ToString())== 0)
            {
                Button1.Enabled = false;
                Button2.Enabled = false;
                Label1.Text = "Today is not Election Date.";
                return;
            }



    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
        }
        if (cls.con2.State != ConnectionState.Open)
        {
            cls.con2.Open();
        }
        cls.cmd.CommandText = "Select Count(*) From VotesMade Where VoterId=" + Session["un"].ToString() + " and ElectionDate='" + String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "'";
        if (int.Parse(cls.cmd.ExecuteScalar().ToString()) > 0)
        {
            Label1.Text = "Vote Already Made.";
            if (cls.con.State != ConnectionState.Closed)
            {
                cls.con.Close();
            }
            return;

        }
        if (TextBox2.Text == "")
        {
            TextBox2.Focus();
            return;
        }
        cls.cmd.CommandText = "select OTP From OTPs Where VoterId='" + Session["un"].ToString() + "'  and SNo in (Select Max(SNo) From OTPs Where VoterId='" + Session["un"].ToString() + "')";
        string otpinDB = cls.cmd.ExecuteScalar().ToString();

        if (TextBox2.Text != otpinDB)
        {
            Label1.Text = "OTP Not matched.";
            TextBox2.Focus();
            return;
        }

        cls.cmd.CommandText = "select EntryTime From OTPs Where VoterId='" + Session["un"].ToString() + "' and SNo in (Select Max(SNo) From OTPs Where VoterId='" + Session["un"].ToString() + "')";
        DateTime dt1 = (DateTime)(cls.cmd.ExecuteScalar());
        DateTime dt2 = DateTime.Now;
        TimeSpan ts = dt2 - dt1;

        if (Math.Abs(ts.TotalMinutes)>60)
        {
            Label1.Text = "OTP Time Limit Crossed. Regenerate OTP and retry.";
            Button2.Focus();
            return;
        }
        cls.cmd.CommandText = "select FingerPrintImage From VotersList Where VoterId=" + Session["un"].ToString();
        if (cls.cmd.ExecuteScalar() == DBNull.Value)
        {

        }
        else if ((cls.cmd.ExecuteScalar() == null))
        {

        }
        else
        {
            try
            {
                string fn = (Server.MapPath(".") + ("\\VoteImages\\" + (DateTime.Now.Ticks + ".jpg")));
                FileUpload1.PostedFile.SaveAs(fn);
                //             Dim fn() As String = Split(FileUpload1.PostedFile.FileName, "\")
                //            fname = fn(UBound(fn))
                //           FileUpload1.PostedFile.SaveAs(Server.MapPath(".") & "\CandidateFingerPrintImages\" & fname)
                System.IO.FileStream f = new System.IO.FileStream(fn, System.IO.FileMode.Open);
                cls.cmd.CommandText = "select DataLength(FingerPrintImage) From VotersList Where VoterId=" + Session["un"].ToString();

                byte[] b1 = new byte[int.Parse(cls.cmd.ExecuteScalar().ToString())];
                byte[] b2 = new byte[f.Length];
                cls.cmd.CommandText = "select FingerPrintImage From VotersList Where VoterId=" + Session["un"].ToString();
                b1 = ((byte[])(cls.cmd.ExecuteScalar()));
                f.Read(b2, 0, b2.Length);
                bool found1;
                found1 = true;
                for (int i = 0; (i
                            <= (f.Length - 1)); i++)
                {
                    if ((b1[i] != b2[i]))
                    {
                        found1 = false;
                        break;
                    }
                }


                string fn2 = (Server.MapPath(".") + ("\\VoteImages\\"
                                            + (DateTime.Now.Ticks + ".jpg")));
                FileUpload2.PostedFile.SaveAs(fn2);
                //             Dim fn() As String = Split(FileUpload1.PostedFile.FileName, "\")
                //            fname = fn(UBound(fn))
                //           FileUpload1.PostedFile.SaveAs(Server.MapPath(".") & "\CandidateFingerPrintImages\" & fname)
                System.IO.FileStream f2 = new System.IO.FileStream(fn2, System.IO.FileMode.Open);
                cls.cmd.CommandText = "select DataLength(IrisPrintImage) From VotersList Where VoterId=" + Session["un"].ToString();

                b1 = new byte[int.Parse(cls.cmd.ExecuteScalar().ToString())];
                 b2 = new byte[f2.Length];
                cls.cmd.CommandText = "select IrisPrintImage From VotersList Where VoterId=" + Session["un"].ToString();
                b1 = ((byte[])(cls.cmd.ExecuteScalar()));
                f2.Read(b2, 0, b2.Length);
                bool found2;
                found2 = true;
                for (int i = 0; (i
                            <= (f2.Length - 1)); i++)
                {
                    if ((b1[i] != b2[i]))
                    {
                        found2 = false;
                        break;
                    }
                }



                if (found1 && found2)
                {

                    cls.cmd.CommandText = "Insert into VotesMade(VoterId,ElectionDate,VoteMade) Values ("+ Session["un"].ToString() + ",'"+ String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "\',1)";
                    cls.cmd.ExecuteNonQuery();

                    cls.cmd2.CommandText = cls.cmd.CommandText;
                    cls.cmd2.ExecuteNonQuery();

                    Label1.Text = "Vote Made.";
                    string  candidateid = (DropDownList1.SelectedItem.Text.Split(new char[] { ':' })[0]);
                  //  cls.cmd.CommandText = ("select Count(*) from Votescount where ZoneId="
                      //          + (Label2.Text + (" and CandidateId=" + candidateid)));
								
								  cls.cmd.CommandText = ("select Count(*) from Votescount where ElectionDate='" + String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "' and ZoneId=" + (Label2.Text + (" and CandidateId=" + candidateid)));
                    if ((int.Parse(cls.cmd.ExecuteScalar().ToString()) > 0))
                    {
                        
                        cls.cmd.CommandText = "Update VotesCount Set VoteCount=VoteCount+1 Where ZoneId="+ Label2.Text + " and CandidateId="+ candidateid + " and ElectionDate='"+ String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "'";
                        cls.cmd.ExecuteNonQuery();
                        cls.cmd.CommandText = "Select VoteCount From VotesCount Where ZoneId=" + Label2.Text + " and CandidateId=" + candidateid + " and ElectionDate='" + String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "'";
                        string votecountnew = (cls.cmd.ExecuteScalar().ToString());

                        string enczoneid = "";
                        string enccandidateid = "";
                        string encvotecount = "";
                        string encelectiondate = "";
                        EncryptMessage(ref enczoneid, Label2.Text);
                        EncryptMessage(ref enccandidateid, candidateid);
                        EncryptMessage(ref encvotecount, votecountnew);
                        EncryptMessage(ref encelectiondate, String.Format("{0:MM-dd-yyyy}", DateTime.Today));


                        cls.cmd.CommandText = "Update EncVotesCount Set VoteCount='" + encvotecount + "' Where ZoneId='" + enczoneid + "' and CandidateId='" + enccandidateid + "' and electionDate='" + encelectiondate + "'";
                        cls.cmd.ExecuteNonQuery();

                        cls.cmd2.CommandText = cls.cmd.CommandText;
                        cls.cmd2.ExecuteNonQuery();

                    }
                    else
                    {
                        cls.cmd.CommandText = "Insert into VotesCount(ZoneId,CandidateId,VoteCount,ElectionDate) Values(" + Label2.Text + "," + candidateid + ",1,'" + String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "')";
                        cls.cmd.ExecuteNonQuery();
                        cls.cmd2.CommandText = cls.cmd.CommandText;
                        cls.cmd2.ExecuteNonQuery();

                        string enczoneid = "";
                        string enccandidateid = "";
                        string encvotecount = "";
                        string encelectiondate = "";
                        EncryptMessage(ref enczoneid, Label2.Text);
                        EncryptMessage(ref enccandidateid, candidateid);
                        EncryptMessage(ref encvotecount, "1");
                        EncryptMessage(ref encelectiondate, String.Format("{0:MM-dd-yyyy}", DateTime.Today));

                        cls.cmd.CommandText = "Insert into EncVotesCount(ZoneId,CandidateId,VoteCount,ElectionDate) Values(" + Label2.Text + "," + candidateid + ",1,'" + String.Format("{0:MM-dd-yyyy}", DateTime.Today) + "')";
                        cls.cmd.ExecuteNonQuery();
                        cls.cmd2.CommandText = cls.cmd.CommandText;
                        cls.cmd2.ExecuteNonQuery();

                    }
                    Label1.Text = "Vote Count Added.";
                    string msg = cls.OneWayEncrpyt(TextBox1.Text + "^" + String.Format("{0:MM-dd-yyyy}", DateTime.Now));
                    int sno = 0;
                    try
                    {

                        try
                        {
                            cls.cmd.CommandText = "Select Max(SNo) From BlockChain ";
                          
                            if (cls.cmd.ExecuteScalar() == null)
                            {
                                sno = 1;
                            }
                            else if (cls.cmd.ExecuteScalar() == DBNull.Value)
                            {
                                sno = 1;
                            }
                            else
                            {
                                sno = int.Parse(cls.cmd.ExecuteScalar().ToString()) + 1;
                            }
                            if (sno > 1)
                            {
                                int snominusone = sno - 1;
                                cls.cmd.CommandText = "Select  HashKeyValue From BlockChain Where SNo=" + snominusone;
                                string hash = cls.cmd.ExecuteScalar().ToString();
                                msg = cls.OneWayEncrpyt(TextBox1.Text + "^" + String.Format("{0:MM-dd-yyyy}", DateTime.Now) + "^" + hash);
                                
                            }

                        }
                        catch (Exception ex) { }

                        cls.cmd.CommandText = "Insert into BlockChain (VoterId,EntryTime,HashKeyValue,AccessType,SNo,PreviousSNo) Values ('" + TextBox1.Text + "','" + String.Format("{0:MM-dd-yyyy hh:mm:ss tt}", DateTime.Now) + "','" + msg + "','Vote','" + sno.ToString() + "','0')";
                        cls.cmd.ExecuteNonQuery();
                       // cls.cmd.CommandText = "Insert into BlockChain (VoterId,EntryTime,HashKeyValue,AccessType) Values ('" + Session["un"].ToString() + "','" + String.Format("{0:MM-dd-yyyy hh:mm:ss tt}", DateTime.Now) + "','" + msg + "','Vote')";
                       // cls.cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex) { }
                    cls.con.Close();
                }
                else
                {
                    Label1.Text = "Finger/Iris Print Not Match";
                }
                f.Close();
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                if ((cls.con.State != ConnectionState.Closed))
                {
                    cls.con.Close();
                }
            down:
                int t;
            }
        }
    
    }
    public void EncryptMessage(ref string encaccno, string accno)//ref byte[] key)
    {/*
        clsColorCode.textmessage = accno;
        encaccno = clsColorCode.Encrypt();
        */
        clsTripleDES des = new clsTripleDES();
        encaccno = des.Encrypt(accno);
    }
    public string DecryptMessage(string encaccno)//ref byte[] key)
    {
      /*  clsColorCode.outputcolors.Clear();
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
    protected void Button2_Click(object sender, EventArgs e)
    {
  if (cls.con.State != ConnectionState.Open)
            {
                cls.con.Open();
            }
        cls.cmd.CommandText="select Emailid from voterslist Where VoterId = '" +   Session["un"].ToString() + "'";
        string email= cls.cmd.ExecuteScalar().ToString();
        Random rn=new Random();
        int x = rn.Next(10000000,999999999);
        try
        {
            clssendmail.MailSend(email, "OTP For Voting", "Your OTP is " + x.ToString());
            cls.cmd.CommandText = "Insert into OTPs(VoterId,EntryTime,OTP) values('" + Session["un"].ToString() + "','" + String.Format("{0:MM-dd-yyyy hh:mm:ss tt}", DateTime.Now) + "','" + x.ToString() + "')";
            cls.cmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            Label1.Text = ex.Message;
            return;
        }

        Label1.Text = "OTP sent to mail id " + email;
    }
}
