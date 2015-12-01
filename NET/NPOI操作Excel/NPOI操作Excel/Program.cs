using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NPOI操作Excel
{
    class Program
    {
        static void Main(string[] args)
        {
            //ReadExcel("D:\\qq.xlsx");
            WriteExcel("D:\\qq.xlsx");
            //test("D:\\qq.xlsx");
        }


        static void ReadExcel(string filePath)
        {
            IWorkbook wk = null;
            //FileStream fs = null;
            StringBuilder sbr = new StringBuilder();
            // using ( fs = File.OpenRead(filePath))   //打开myxls.xls文件
            // {
            //fs = new FileStream(filePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            //if (filePath.IndexOf(".xlsx") > 0) // 2007版本
            // wk = new XSSFWorkbook(fs);
            //else if (filePath.IndexOf(".xls") > 0) // 2003版本
            // wk = new HSSFWorkbook(fs);
            wk = isExcelType(filePath);

            //把xls文件中的数据写入wk中
            //for (int i = 0; i < wk.NumberOfSheets; i++)  //NumberOfSheets是myxls.xls中总共的表数
            // {
            ISheet sheet = wk.GetSheetAt(0);   //读取当前表数据
            for (int j = 0; j <= sheet.LastRowNum; j++)  //LastRowNum 是当前表的总行数
            {
                IRow row = sheet.GetRow(j);  //读取当前行数据
                if (row != null)
                {
                    sbr.Append("-------------------------------------\r\n"); //读取行与行之间的提示界限
                    for (int k = 0; k <= row.LastCellNum; k++)  //LastCellNum 是当前行的总列数
                    {
                        ICell cell = row.GetCell(k);  //当前表格
                        if (cell != null)
                        {
                            sbr.Append(cell.ToString());   //获取表格中的数据并转换为字符串类型
                        }
                    }
                }
            }
            Console.WriteLine(sbr);
            // }
            // }

        }
        static string strConn = "Data Source=.;Initial Catalog=testExcel;Integrated Security=True";
        //获取表的列名
        static List<string> getColumnNameFormDB()
        {
            List<string> list = new List<string>();
            string sql = "SELECT TOP 1 * FROM [test1]";

            using (SqlConnection Conn = new SqlConnection(strConn))
            {
                Conn.Open();

                using (SqlCommand cmd = new SqlCommand(sql, Conn))
                {


                    SqlDataReader dr = cmd.ExecuteReader();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        list.Add(dr.GetName(i));
                    }

                }

                Conn.Close();
            }
            return list;

        }
        //获取表的数据（不包括列名）
        static DataTable getDataFormDB()
        {
            DataSet ds = new DataSet();
            string sql = "SELECT * FROM test1";
            using (SqlConnection conn = new SqlConnection(strConn))
            {
                conn.Open();
                using (SqlDataAdapter sda = new SqlDataAdapter(sql, conn))
                {
                    sda.Fill(ds);
                }
                conn.Close();
            }
            return ds.Tables[0];

        }
        static int WriteExcel(string filePath)
        {

            ISheet sheet = null;
            int i = 0;
            int j = 0;
            int count = 0;



            IWorkbook workbook = isExcelType(filePath);
            //if (File.Exists(filePath))
            //{
            // File.Delete(filePath);
            // }  
            try
            {
                if (workbook != null)
                {
                    sheet = workbook.CreateSheet("wqy");
                }
                else
                {
                    return -1;
                }


                DataTable data = getDataFormDB();

                IRow row1 = sheet.CreateRow(0);
                for (j = 0; j < data.Columns.Count; ++j)
                {
                    row1.CreateCell(j).SetCellValue(data.Columns[j].ColumnName);
                }
                ++count;

                for (i = 0; i < data.Rows.Count; ++i)
                {
                    IRow row2 = sheet.CreateRow(count);
                    for (j = 0; j < data.Columns.Count; ++j)
                    {
                        row2.CreateCell(j).SetCellValue(data.Rows[i][j].ToString());
                    }
                    ++count;
                }

                using (FileStream fs = File.OpenWrite(filePath))
                {
                    workbook.Write(fs); //写入到excel
                }
                return count;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: " + ex.Message);
                return -1;
            }

        }
        static IWorkbook isExcelType(string filePath)
        {
            IWorkbook wk = null;
            FileStream fs = new FileStream(filePath, FileMode.OpenOrCreate, FileAccess.ReadWrite);
            if (filePath.IndexOf(".xlsx") > 0) // 2007版本
                wk = new XSSFWorkbook(fs);
            else if (filePath.IndexOf(".xls") > 0) // 2003版本
                wk = new HSSFWorkbook(fs);

            fs.Close();
            return wk;

        }
        static void test(string path)
        {
            //创建工作薄

            // FileStream file = new FileStream(@"d:/qq.xlsx", FileMode.OpenOrCreate, FileAccess.ReadWrite);

            //XSSFWorkbook wk = new XSSFWorkbook(file);
            //if (File.Exists(path))  
            // {  
            //File.Delete(path);  
            // }  
            IWorkbook wk = null;
            wk = isExcelType(path);

            //创建一个名称为mySheet的表
            ISheet tb = wk.CreateSheet("some");
            //创建一行，此行为第二行
            IRow row = tb.CreateRow(1);
            for (int i = 0; i < 20; i++)
            {
                ICell cell = row.CreateCell(i);  //在第二行中创建单元格
                cell.SetCellValue(i);//循环往第二行的单元格中添加数据
            }
            using (FileStream fs = File.OpenWrite(path)) //打开一个xls文件，如果没有则自行创建，如果存在myxls.xls文件则在创建是不要打开该文件！
            {
                wk.Write(fs);   //向打开的这个xls文件中写入mySheet表并保存。

            }

        }

    }
}
