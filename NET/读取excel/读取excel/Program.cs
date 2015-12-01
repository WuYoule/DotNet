using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace 读取excel
{
    class Program
    {
        static void Main(string[] args)
        {
            //LoadDataFromExcel("D:\\test.xlsx");
            //DeleteDataFormExcel("D:\\test.xlsx");
            SaveDataTableToExcel("D:\\test1.xlsx");
            //createSheet("D:\\test.xlsx");

        }

        //获取excel表中数据
        public static DataSet LoadDataFromExcel(string filePath)
        {
            try
            {
                string strConn;
                if (Path.GetExtension(filePath) == ".xls")
                    strConn = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + filePath + ";" + ";Extended Properties=\"Excel 8.0;HDR=YES;IMEX=1\"";
                else
                    strConn = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + filePath + ";" + ";Extended Properties=\"Excel 12.0;HDR=YES;IMEX=1\"";
                DataSet OleDsExcle = new DataSet();
                using (OleDbConnection OleConn = new OleDbConnection(strConn))
                {
                    OleConn.Open();
                    String sql = "SELECT * FROM  [Sheet1$]";//可是更改Sheet名称，比如sheet2，等等 
                    using (OleDbDataAdapter OleDaExcel = new OleDbDataAdapter(sql, OleConn))
                    {
                        OleDaExcel.Fill(OleDsExcle);
                    }
                }
                //String DataRow = "";
                // for (int i = 0; i < OleDsExcle.Tables[0].Columns.Count; i++) //获取列名
                // {
                //     DataRow += OleDsExcle.Tables[0].Columns[i].ColumnName;
                //     if (i < OleDsExcle.Tables[0].Columns.Count - 1) DataRow += " ";
                // }
                //Console.WriteLine(DataRow); 

                for (int i = 0; i < OleDsExcle.Tables[0].Rows.Count; i++) //获取数据
                {
                    string DataRow = "";
                    for (int j = 0; j < OleDsExcle.Tables[0].Columns.Count; j++)
                    {
                        DataRow += OleDsExcle.Tables[0].Rows[i][j].ToString();

                    }
                    Console.WriteLine(DataRow);

                }
                return OleDsExcle;
            }
            catch (Exception err)
            {
                Console.WriteLine("数据绑定Excel失败!失败原因：" + err.Message);

                return null;
            }


        }

        //更新excel表中数据
        public static void DeleteDataFormExcel(string filePath)
        {
            string strConn;
            if (Path.GetExtension(filePath) == ".xls")
                strConn = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + filePath + ";" + ";Extended Properties=\"Excel 8.0;HDR=YES;IMEX=0\"";
            else
                strConn = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + filePath + ";" + ";Extended Properties=\"Excel 12.0;HDR=YES;IMEX=0\"";
            OleDbConnection OleConn = new OleDbConnection(strConn);
            OleConn.Open();
            String sql = "UPDATE [Sheet1$] SET 号码=999 where 编号=3";//可是更改Sheet名称，比如sheet2，等等   
            OleDbCommand cmd = new OleDbCommand(sql, OleConn);
            int i = cmd.ExecuteNonQuery();
            OleConn.Close();


        }



        public static void SaveDataTableToExcel(string filePath)
        {

            List<string> list = new List<string>();
            DataSet ds = new DataSet();
            string strConn = "Data Source=.;Initial Catalog=testExcel;Integrated Security=True";
            string sql = "SELECT * FROM test1";
            SqlConnection Conn = new SqlConnection(strConn);
            try
            {
                if (Conn.State == ConnectionState.Closed)
                    Conn.Open();
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT TOP 1 * FROM [test1]";
                    cmd.Connection = Conn;
                    SqlDataReader dr = cmd.ExecuteReader();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        list.Add(dr.GetName(i));
                    }
                }
                Conn.Close();
                using (SqlDataAdapter sa = new SqlDataAdapter(sql, Conn))
                {
                    sa.Fill(ds);
                }

            }
            catch (Exception e)
            { throw e; }
            finally
            {
                if (Conn.State == ConnectionState.Open)
                    Conn.Close();
                Conn.Dispose();
            }

            createSheet(filePath, list, ds.Tables[0]);






        }

        //创建sheet
        public static void createSheet(string filePath, List<string> columnNames, System.Data.DataTable dt)
        {
            string strConn;
            if (Path.GetExtension(filePath) == ".xls")
                strConn = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + filePath + ";" + ";Extended Properties=\"Excel 8.0;HDR=YES;IMEX=0\"";
            else
                strConn = "Provider=Microsoft.ACE.OLEDB.12.0;" + "Data Source=" + filePath + ";" + ";Extended Properties=\"Excel 12.0;HDR=YES;IMEX=0\"";
            //实例化一个Oledbconnection类(实现了IDisposable,要using)  
            using (OleDbConnection ole_conn = new OleDbConnection(strConn))
            {
                ole_conn.Open();
                string sql = "CREATE table info ( [" + columnNames[0] + "] VarChar,[" + columnNames[1] + "] VarChar,[" + columnNames[2] + "] VarChar,[" + columnNames[3] + "] VarChar)";
                using (OleDbCommand ole_cmd = ole_conn.CreateCommand())
                {

                   
                    ole_cmd.ExecuteNonQuery();


                    for (int i = 0; i < dt.Rows.Count; i++) //获取数据
                    {
                        string DataRow = "";
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            DataRow += "'" + dt.Rows[i][j].ToString() + "'" + ",";

                        }
                        ole_cmd.CommandText = "INSERT INTO info (" + columnNames[0] + "," + columnNames[1] + "," + columnNames[2] + "," + columnNames[3] + ") VALUES(" + DataRow.Trim(',') + ")";
                        ole_cmd.ExecuteNonQuery();
                    }





                }
            }
        }
    }
}
