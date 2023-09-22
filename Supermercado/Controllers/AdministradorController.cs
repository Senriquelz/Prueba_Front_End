using Microsoft.AspNetCore.Mvc;
using Supermercado.Data;
using System.Data;
using System.Data.SqlClient;

namespace Supermercado.Controllers
{
    public class AdministradorController : Controller
    {
        private SqlConnection _connection;


        #region Vistas

        public IActionResult Index()
        {
            return View("~/Views/Administrador/AdministradorIndex.cshtml");
        }

        public IActionResult UsuariosLista()
        {
            return View("~/Views/Administrador/UsuariosLista.cshtml");
        }

        public IActionResult ClientesLista()
        {
            return View("~/Views/Administrador/ClientesLista.cshtml");
        }

        public ActionResult VistaCrearUsuarios()
        {
            return View("~/Views/Administrador/CrearUsuario.cshtml");
        }

        public IActionResult VistaCrearClientes()
        {
            return View("~/Views/Administrador/CrearCliente.cshtml");
        }
        public IActionResult VistaCrearProductos()
        {
            return View("~/Views/Administrador/CrearProducto.cshtml");
        }

        #endregion


        [HttpPost]
        public ActionResult CrearUsuario(string NombreUsuario, string ClaveUsuario, int TipoUsuario)
        {
            if (!ModelState.IsValid)
            {
                return VistaCrearUsuarios();
            }

            _connection = Connection.GetConnection();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable(); // Tabla que se obtiene de un select
            DataSet ds = new DataSet(); // Arreglo de DataTables

            using (var command = new SqlCommand("pr_sp_usuarios_agregar", _connection)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                command.Parameters.Add("@NombreUsuario", SqlDbType.VarChar, 100).Value = NombreUsuario;
                command.Parameters.Add("@ClaveUsuario", SqlDbType.VarChar, 100).Value = ClaveUsuario;
                command.Parameters.Add("@TipoUsuario", SqlDbType.Int).Value = TipoUsuario;

                _connection.Open();

                da.SelectCommand = command;
                da.Fill(dt);

            }

            _connection.Close();

            ds.Tables.Add(dt);

            long idUsuario = (long)dt.Rows[0]["IdUsuario"]; // long Int64
            string usuario = (string)dt.Rows[0]["NombreUsuario"];

            // Fuente: https://developingsoftware.com/aspnet-mvc-how-to-display-a-message-after-calling-redirecttoaction/#:~:text=Create%20a%20view%20to%20display%20the%20message%20Create,%28%21String.IsNullOrEmpty%28message%29%29%20%7B%20%3Cdiv%20class%3D%22message%22%3E%20%3Cp%3E%40message%3C%2Fp%3E%20%3C%2Fdiv%3E%20%7D%20%7D
            // Es repetitivo, se puede enviar el mensaje que viene desde la base
            // o usar agregar un mensaje propio
            if (idUsuario == 0) // Hubo un error o no se creó el usuario
            {
                string mensaje = (string)dt.Rows[0]["MensajeError"];
                TempData["idUsuario"] = idUsuario;
                TempData["CreateUserMessage"] = mensaje;
            }

            if (idUsuario > 0) // El usuario fue creado con éxito
            {
                string mensaje = (string)dt.Rows[0]["MensajeError"];
                TempData["idUsuario"] = (int)idUsuario;
                TempData["CreateUserMessage"] = mensaje;
            }

            //    Action (nombre del método), Nombre del controlador
            return RedirectToAction("Index", "Administrador"); // Devolver index de administrador

        }


        [HttpPost]
        public ActionResult CrearProducto(string Codigo, string Categoria, decimal Precio, string Descripcion)
        {
            if (!ModelState.IsValid)
            {
                return VistaCrearUsuarios();
            }

            _connection = Connection.GetConnection();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable(); // Tabla que se obtiene de un select
            DataSet ds = new DataSet(); // Arreglo de DataTables

            using (var command = new SqlCommand("pr_sp_productos_agregar", _connection)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                command.Parameters.Add("@CodigoProducto", SqlDbType.VarChar, 100).Value = Codigo;
                command.Parameters.Add("@CategoriaProducto", SqlDbType.VarChar, 100).Value = Categoria;
                command.Parameters.Add("@PrecioProducto", SqlDbType.Decimal).Value = Precio;
                command.Parameters.Add("@DescripcionProducto", SqlDbType.VarChar, 100).Value = Descripcion;

                _connection.Open();

                da.SelectCommand = command;
                da.Fill(dt);

            }

            _connection.Close();

            ds.Tables.Add(dt);


            long idProducto = (long)dt.Rows[0]["IdProducto"]; // long Int64
            string msgError = (string)dt.Rows[0]["MensajeError"];

            // PENDIENTEEEEEEE
            // Fuente: https://developingsoftware.com/aspnet-mvc-how-to-display-a-message-after-calling-redirecttoaction/#:~:text=Create%20a%20view%20to%20display%20the%20message%20Create,%28%21String.IsNullOrEmpty%28message%29%29%20%7B%20%3Cdiv%20class%3D%22message%22%3E%20%3Cp%3E%40message%3C%2Fp%3E%20%3C%2Fdiv%3E%20%7D%20%7D
            // Es repetitivo, se puede enviar el mensaje que viene desde la base
            // o usar agregar un mensaje propio
            if (idProducto == 0) // Hubo un error o no se creó el usuario
            {
                TempData["idProducto"] = idProducto;
                TempData["CreateProductMessage"] = msgError;
            }

            if (idProducto > 0) // El usuario fue creado con éxito
            {
                TempData["idProducto"] = (int)idProducto;
                TempData["CreateProductMessage"] = msgError;
            }

            //    Action (nombre del método), Nombre del controlador
            return RedirectToAction("Index", "Administrador"); // Devolver index de administrador

        }
    }
}
