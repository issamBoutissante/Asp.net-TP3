using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace Asp.net_TP_13
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        static string conString = ConfigurationManager.ConnectionStrings["monConnection"].ConnectionString;
        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
        [WebMethod]
        public  void GetTable(GridView grid,string tableName)
        {
            SqlConnection connection = new SqlConnection(conString);
            SqlCommand command = new SqlCommand($"select * from [{tableName}]", connection);
            connection.Open();
            Console.WriteLine("done");
            grid.DataSource = command.ExecuteReader();
            grid.DataBind();
            connection.Close();
        }
    }
}
