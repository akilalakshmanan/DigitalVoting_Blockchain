using System;
using System.Data;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for cls
/// </summary>
public class cls
{
    public static SqlConnection con = new SqlConnection("Server=DESKTOP-0PADHCH\\sqlexpress;database=OnlineVoting;Integrated Security=true");//user id=sa;password=");
    public static SqlConnection con2 = new SqlConnection("Server=DESKTOP-0PADHCH\\sqlexpress;database=OnlineVoting2;Integrated Security=true");//user id=sa;password=");
    //Public con As New OleDbConnection("Server=.;database=OnFairness;user id=sa;password=") 
    public static SqlCommand cmd = new SqlCommand("", con);
    public static SqlCommand cmd2 = new SqlCommand("", con2);
    public cls()
    {

        //
        // TODO: Add constructor logic here
        //
    }


    public void Enable(ref Page f, bool mode)
    {
        foreach (Control x in f.Controls)
        {
            if ((x is TextBox))
            {
                ((TextBox)(x)).Enabled = mode;
            }
            else if ((x is DropDownList))
            {
                ((DropDownList)(x)).Enabled = mode;
            }
        }
    }

        public static string OneWayEncrpyt(string toEncrypt)
        {
         /*   byte[] data = System.Text.Encoding.ASCII.GetBytes(toEncrypt);
            data = new System.Security.Cryptography.SHA256Managed().ComputeHash(data);

            return System.Text.Encoding.ASCII.GetString(data);
            */
            SHA256 sha256 = SHA256Managed.Create();
            byte[] bytes = Encoding.UTF8.GetBytes(toEncrypt);
            byte[] hash = sha256.ComputeHash(bytes);
//            return System.Text.Encoding.ASCII.GetString(hash);
            return GetStringFromHash(hash);
    }
    public static string GetStringFromHash(byte[] hash)
    {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            result.Append(hash[i].ToString("X2"));
        }
        return result.ToString();
    }

}
