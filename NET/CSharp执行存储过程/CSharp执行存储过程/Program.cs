using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharp执行存储过程
{
    class Program
    {
        static string strCon = "data source=120.26.113.179; Database=JSDWeiXin;user id=sa; password=jdhr@101";
        static void Main(string[] args)
        {
            executePro();
        }
        static void executePro()
        {
            using (SqlConnection connection = new SqlConnection(strCon))
            {

                SqlDataReader returnReader;
                connection.Open();
                // 创建参数
                IDataParameter[] parameters = {
                new SqlParameter("@Id", SqlDbType.Int)   };
                parameters[0].Value = 9;
                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "proc_find_stu";
                cmd.Parameters.AddRange(parameters);
                returnReader = cmd.ExecuteReader();
                while (returnReader.HasRows)
                {
                    while (returnReader.Read())
                    {
                        Console.WriteLine(returnReader["id"].ToString() + returnReader["unionid"].ToString() + returnReader["sex"].ToString() + returnReader["uname"].ToString());

                    }
                }
            }

        }
        static SqlCommand BuildQueryCommand(SqlConnection connection, string storedProcName, IDataParameter[] parameters)
        {
            SqlCommand command = new SqlCommand(storedProcName, connection);
            command.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
            {
                if (parameter != null)
                {
                    // 检查未分配值的输出参数,将其分配以DBNull.Value.
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    command.Parameters.Add(parameter);
                }
            }

            return command;
        }
    }
}
