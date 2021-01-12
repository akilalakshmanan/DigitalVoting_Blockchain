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

public partial class VoterLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_save_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (cls.con.State != ConnectionState.Open)
        {
            cls.con.Open();
        
        
        }

        
                 cls.cmd.CommandText = "select count(*) from VotersList where VoterId='" + TextBox1.Text + "' and Password='" + TextBox2.Text + "'";


            if (Convert.ToInt16(cls.cmd.ExecuteScalar().ToString()) > 0)
            {
                Session["un"] = TextBox1.Text;
                Session["ut"] = "voter";
            
                string msg = cls.OneWayEncrpyt(TextBox1.Text +  "^" + String.Format("{0:MM-dd-yyyy}", DateTime.Now));

                try
                {
                    cls.cmd.CommandText = "Select Max(SNo) From BlockChain ";
                    int sno = 0;
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
                    try
                    {
                        if (sno > 1)
                        {
                            int snominusone = sno - 1;
                            cls.cmd.CommandText = "Select  HashKeyValue From BlockChain Where SNo=" + snominusone;
                            string hash = cls.cmd.ExecuteScalar().ToString();
                            msg = cls.OneWayEncrpyt(sno.ToString() + "^" +  hash);
                            Response.Write(msg);
                        }

                    }
                    catch (Exception ex) { }


                    cls.cmd.CommandText = "Insert into BlockChain (VoterId,EntryTime,HashKeyValue,AccessType,SNo,PreviousSNo) Values ('" + TextBox1.Text + "','" + String.Format("{0:MM-dd-yyyy hh:mm:ss tt}", DateTime.Now) + "','" + msg + "','Login','" + sno.ToString() + "','0')";
                    cls.cmd.ExecuteNonQuery();
/*cls.cmd.CommandText = "Select SNo From BlockChain  Where VoterId='" + TextBox1.Text + "' and SNo in (Select Max(SNo) From BlockChain  Where VoterId='" + TextBox1.Text +"')";
                    int prevsno =int.Parse (cls.cmd.ExecuteScalar().ToString());

                    cls.cmd.CommandText = "Insert into BlockChain (VoterId,EntryTime,HashKeyValue,AccessType,SNo,PreviousSNo) Values ('" + TextBox1.Text + "','" + String.Format("{0:MM-dd-yyyy hh:mm:ss tt}", DateTime.Now) + "','" + msg + "','Login','" + sno.ToString()  + "','" + prevsno.ToString() + "')";
                    cls.cmd.ExecuteNonQuery();*/
                }
                catch (Exception ex) { }
                cls.con.Close();
                Response.Redirect("voteroptions.aspx");

            }
            else
            {

                cls.con.Close();
                Label4.Text = "Invalid Voter Id/Password.";

            }
           
        
    }
 
}
