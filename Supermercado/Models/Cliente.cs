using System.ComponentModel.DataAnnotations;

namespace Supermercado.Models
{
    public class Cliente
    {
        public long IdCliente { get; set; }

        [Required(ErrorMessage = "Se requiere que ingrese un número de cédula o de RUC")]
        public string? Identificacion { get; set; }

        [Required]
        public string? Nombre { get; set; }

        public string? Direccion { get; set; }

        public string? Telefono { get; set; }

        public string? Correo { get; set; }
    }
}
