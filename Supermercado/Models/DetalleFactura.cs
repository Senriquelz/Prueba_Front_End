namespace Supermercado.Models
{
    public class DetalleFactura
    {
        public long IdDetalle { get; set; }

        public long IdProducto { get; set; }

        public int Cantidad { get; set; }

        public string? UnidadMedida { get; set; }

        // Precio del producto
        public decimal Precio { get; set; }

        // IVA del campo Precio
        public decimal IVA { get; set; }

        // Precio + (Precio * 0.12)
        public decimal Subtotal { get; set; }


    }
}
