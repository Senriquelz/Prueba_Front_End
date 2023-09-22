using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using Supermercado.Data;

namespace Supermercado.Controllers
{
    public class CajeroController : Controller
    {
        private SqlConnection _connection;


        public IActionResult Index()
        {
            return View("~/Views/Cajero/CajeroIndex.cshtml");
        }

        public ActionResult VistaCrearFactura()
        {
            return View("~/Views/Cajero/GenerarFactura.cshtml");
        }
        

        public IActionResult CajeroVenta()
        {
            return View();
        }

        public ActionResult ListarClientes()
        {
            return View("~/Views/Cajero/ListarClientes.cshtml");
        }


        // MÉTODO PENDIENTE
        [HttpPost]
        public ActionResult GenerarFactura(string IdentificacionCliente, string Establecimiento, string PuntoEmision)
        {
            if (!ModelState.IsValid)
            {
                return VistaCrearFactura();
            }

            _connection = Connection.GetConnection();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable(); // Tabla que se obtiene de un select
            DataSet ds = new DataSet(); // Arreglo de DataTables

            using (var command = new SqlCommand("pr_sp_factura_generar", _connection)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                command.Parameters.Add("@identificacionCliente", SqlDbType.VarChar, 100).Value = IdentificacionCliente;
                command.Parameters.Add("@establecimiento", SqlDbType.VarChar).Value = Establecimiento;
                command.Parameters.Add("@puntoEmision", SqlDbType.VarChar).Value = PuntoEmision;

                _connection.Open();

                da.SelectCommand = command;
                da.Fill(dt);

            }

            _connection.Close();

            ds.Tables.Add(dt);

            long idFactura = (long)dt.Rows[0]["IdFactura"];

            // Fuente: https://developingsoftware.com/aspnet-mvc-how-to-display-a-message-after-calling-redirecttoaction/#:~:text=Create%20a%20view%20to%20display%20the%20message%20Create,%28%21String.IsNullOrEmpty%28message%29%29%20%7B%20%3Cdiv%20class%3D%22message%22%3E%20%3Cp%3E%40message%3C%2Fp%3E%20%3C%2Fdiv%3E%20%7D%20%7D
            // Es repetitivo, se puede enviar el mensaje que viene desde la base
            // o usar agregar un mensaje propio
            if (idFactura == 0) // Hubo un error o no se creó el usuario
            {
                string mensaje = (string)dt.Rows[0]["MensajeError"];
                TempData["idFactura"] = idFactura;
                TempData["CreateInvoiceMessage"] = mensaje;
            }

            if (idFactura > 0) // El usuario fue creado con éxito
            {
                string mensaje = (string)dt.Rows[0]["MensajeError"];
                TempData["idFactura"] = (int)idFactura;
                TempData["CreateInvoiceMessage"] = mensaje;
            }

            //    Action (nombre del método), Nombre del controlador
            return RedirectToAction("Index", "Cajero"); // Devolver index de administrador

        }


    }
}
