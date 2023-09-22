using System.ComponentModel.DataAnnotations;

namespace Supermercado.Models
{
    public class Factura
    {
        [Required]
        public long IdFactura { get; set; }

        [Required]
        public string? IdentificacionCliente { get; set; }

        // Fuente: https://soporteacc.com/help-center/articles/52/crear-puntos-de-emision
        // 3 dígitos, corresponde al número de sede en la que se emite factura
        public string? Establecimiento { get; set; }

        // 3 dígitos, corresponde al número del cajero que emite la factura
        // Esto se puede obtener usando el IdUsuario del cajero agregándole
        // los ceros que necesite detrás
        public string? PuntoEmision { get; set; }

        // 9 dígitos, lo emite el SRI, pero en este caso se puede usar
        // el IdFactura que devuelva la base y agregarle los ceros
        // que necesite detrás
        public string? NumeroFactura { get; set; }

        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date)]
        public DateTime Fecha { get; set; }
        
        // Estos campos se calculan al final en base a los
        // detalles agregados (productos que se compraron)
        public decimal Subtotal { get; set; }
        public decimal TotalIVA { get; set; }
        public decimal Total { get; set; }

         
    }
}
