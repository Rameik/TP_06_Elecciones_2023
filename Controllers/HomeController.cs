using Microsoft.AspNetCore.Mvc;
using TP_06_Elecciones_2023.Models;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace TP_06_Elecciones_2023.Controllers;

public class HomeController : Controller
{
    private IWebHostEnvironment Enviroment;

    public HomeController(IWebHostEnvironment enviroment){
        Enviroment = enviroment;
   }
    public IActionResult Index()
    {
        ViewBag.ListaPartidos = BD.listarPartidos();
        return View();
    }

    public IActionResult VerDetallePartido(int idPartido)
    {

        ViewBag.DatosPartido = BD.verInfoPartido(idPartido);
        ViewBag.ListaCandidatos = BD.listarCandidatos(idPartido);
        return View();
    }


    public IActionResult VerDetalleCandidato(int idCandidato)
    {
        ViewBag.DatosCandidato = BD.verInfoCandidato(idCandidato);
        return View();
    }


    public IActionResult AgregarCandidato(int idPartido)
    {
        ViewBag.IdPartido = idPartido;
        return View();
    }

    [HttpPost]
    public IActionResult GuardarCandidato(Candidato can, IFormFile archivo)
    {
        string ruta= "";
        if(archivo.Length>0){
            string wwwRootLocal = this.Enviroment.ContentRootPath + @"/wwwroot/imagenesCandidatos/" + can.Nombre + can.Apellido + "foto"+ ".jpg";
            ruta = @"/imagenesCandidatos/" + can.Nombre + can.Apellido + "foto"+ ".jpg";
            using(var stream = System.IO.File.Create(wwwRootLocal)){
                archivo.CopyToAsync(stream);
            }
        }
        BD.agregarCandidato(can, ruta);
        ViewBag.DatosPartido = BD.verInfoPartido(can.IdPartido);
        ViewBag.ListaCandidatos = BD.listarCandidatos(can.IdPartido);
        
        return View("VerDetallePartido");
    }

    public IActionResult EliminarCandidato(int idCandidato, int idPartido)
    {
        string nombre = "", apellido = "";
        ViewBag.ListaCandidatos = BD.listarCandidatos(idPartido);
        foreach (var item in ViewBag.ListaCandidatos)
        {
            if(item.IdCandidato == idCandidato){
                nombre = item.Nombre;
                apellido = item.Apellido;
            }
        }
        string wwwRootLocal = this.Enviroment.ContentRootPath + @"/wwwroot/imagenesCandidatos/" + nombre + apellido + "foto"+ ".jpg";
        System.IO.File.Delete(wwwRootLocal);
        BD.eliminarCandidato(idCandidato);
        ViewBag.DatosPartido = BD.verInfoPartido(idPartido);
        ViewBag.ListaCandidatos = BD.listarCandidatos(idPartido);
        return View("VerDetallePartido");
    }

    public IActionResult Elecciones()
    {
        return View();
    }

    public IActionResult Creditos()
    {
        return View();
    }
}
