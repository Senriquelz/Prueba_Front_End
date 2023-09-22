using System.Data;
using System.Data.SqlClient;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Supermercado.Data
{
    public class Connection
    {

        public static SqlConnection GetConnection()
        {
            // Fuente: https://stackoverflow.com/questions/15631602/how-can-i-set-an-sql-server-connection-string
            const String connectionString =
                "Data Source=LAPTOP-7DUCJFVM;" + // Nombre servidor
                "Initial Catalog=DbPrueba;" + // Nombre base de datos
                "User id=root;" + // usuario
                "Password=Sqlserverpassword2024;"; // Contraseña
            var conn = new SqlConnection(connectionString);
            return conn;
        }

    }
}
