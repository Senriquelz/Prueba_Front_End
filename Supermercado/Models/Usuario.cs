using Microsoft.AspNetCore.Mvc;
using Microsoft.Build.Framework;
using System.ComponentModel.DataAnnotations;
using RequiredAttribute = System.ComponentModel.DataAnnotations.RequiredAttribute;
//using RequiredAttribute = System.ComponentModel.DataAnnotations.RequiredAttribute;


namespace Supermercado.Models
{
    public class Usuario
    {

        public long IdUsuario { get; set; }

        // 1: Administrador
        // 2: Supervisor
        // 3: Vendedor
        [Required(ErrorMessage = "Se necesita ingresar un tipo de usuario")]
        //[System.ComponentModel.DataAnnotations.Required(ErrorMessage = "Se necesita ingresar un tipo de usuario")]
        [Display(Name = "Tipo de Usuario")] // DataAnotation
        public int TipoUsuario { get; set; }

        [System.ComponentModel.DataAnnotations.Required(ErrorMessage = "Se necesita ingresar una nombre de usuario", AllowEmptyStrings = false)]
        [StringLength(100)]
        [Display(Name = "Usuario")]
        public string? NombreUsuario { get; set; }

        [System.ComponentModel.DataAnnotations.Required(ErrorMessage = "Se necesita ingresar una clave", AllowEmptyStrings = false)]
        [StringLength(100)]
        [Display(Name = "Clave")]
        public string? ClaveUsuario { get; set; }

    }
}
