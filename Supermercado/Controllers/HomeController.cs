using Microsoft.AspNetCore.Mvc;
using Supermercado.Data;
using Supermercado.Models;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Supermercado.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private SqlConnection _connection;


        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }


        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }


        [HttpPost]
        public ActionResult Login(string NombreUsuario, string ClaveUsuario)
        {
            _connection = Connection.GetConnection();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable(); // Tabla que se obtiene de un select
            DataSet ds = new DataSet(); // Arreglo de DataTables

            using (var command = new SqlCommand("pr_sp_validar_login", _connection)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                command.Parameters.Add("@nombreUsuario", SqlDbType.VarChar, 100).Value = NombreUsuario;
                command.Parameters.Add("@claveUsuario", SqlDbType.VarChar, 100).Value = ClaveUsuario;

                _connection.Open();

                //command.ExecuteNonQuery();

                da.SelectCommand = command;
                da.Fill(dt);

            }

            _connection.Close();

            ds.Tables.Add(dt);

            int tipoUsuario = (int)dt.Rows[0]["TipoUsuario"];
            int idUsuario = (int)dt.Rows[0]["TipoUsuario"];


            // 1: Admin, 2: Supervisor
            if (tipoUsuario == 1 || tipoUsuario == 2)
            {
                TempData["idUsuario"] = (int)idUsuario;
                TempData["tipoUsuario"] = (int)tipoUsuario;

                Usuario user = new Usuario();
                user.TipoUsuario = tipoUsuario;

                HttpContext.Session.SetInt32("tipoUsuario", tipoUsuario);

                // Fuente: https://stackoverflow.com/questions/2677072/asp-net-mvc-what-is-the-correct-way-to-redirect-to-pages-actions-in-mvc
                //return RedirectToAction("Index", "Administrador", new { TipoUsuario = tipoUsuario }); // Devolver index de administrador
                return View("~/Views/Administrador/AdministradorIndex.cshtml");
            }

            //// 2: Supervisor
            //if (tipoUsuario == 2)
            //{
            //    return View("SupervisorIndex"); // Devolver index del supervisor
            //}

            // 3: Cajero
            if (tipoUsuario == 3)
            {
                return RedirectToAction("Index", "Cajero"); // Devolver index de administrador
            }

            return View();
        }




    }




}


