namespace Supermercado.Models
{
    public class Producto
    {
        public long IdProducto { get; set; }
        public string? Codigo { get; set; }
        public string? Descripcion { get; set; }
        public string? Categoria { get; set; }
        public decimal Precio { get; set; }

    }
}
