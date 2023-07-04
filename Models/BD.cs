using System.Data.SqlClient;
using Dapper;
using TP_06_Elecciones_2023.Models;

namespace TP_06_Elecciones_2023.Models;

public static class BD
{
    private static string connectionString = @"Server = localhost; DataBase = BD_Elecciones; Trusted_Connection = True;";

    public static void agregarCandidato(Candidato can, string archivoFoto)
    {
        string sql = "INSERT INTO Candidatos(IdPartido, Apellido, Nombre, FechaNacimiento, Foto, Postulacion) VALUES(@pIdPartido, @pApellido, @pNombre, @pFechaNacimiento, @pFoto, @pPostulacion)";
        
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            can.Foto = archivoFoto;
            db.Execute(sql, new{pIdPartido = can.IdPartido, pApellido = can.Apellido, pNombre = can.Nombre, pFechaNacimiento = can.FechaNacimiento, pFoto = can.Foto, pPostulacion = can.Postulacion});
        }
    }

    public static void eliminarCandidato(int idCandidato)
    {
        string sql = "DELETE FROM Candidatos WHERE IdCandidato = @pIdCandidatoEliminar";

        using(SqlConnection db = new SqlConnection(connectionString))
        {
            db.Execute(sql, new {pIdCandidatoEliminar = idCandidato});
        }
    }

    public static Partido verInfoPartido(int idPartido)
    {

        Partido partidoDevolver = null;

        using(SqlConnection db = new SqlConnection(connectionString))
        {   
            string sql = "SELECT * FROM Partidos WHERE IdPartido = @pIdPartidoMostrar";
            partidoDevolver = db.QueryFirstOrDefault<Partido>(sql, new {pIdPartidoMostrar = idPartido});
        }

        return partidoDevolver;
    }

    public static Candidato verInfoCandidato(int idCandidato)
    {
        
        Candidato candidatoDevolver = null;

        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sql = "SELECT * FROM Candidatos WHERE IdCandidato = @pIdCandidatoMostrar";
            candidatoDevolver = db.QueryFirstOrDefault<Candidato>(sql, new {pIdCandidatoMostrar = idCandidato});
        }

        return candidatoDevolver;
    }

    public static List<Partido> listarPartidos()
    {
        List<Partido> listaPartidos = null;

        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sql = "SELECT * FROM Partidos";
            listaPartidos = db.Query<Partido>(sql).ToList();
        }

        return listaPartidos;
    }

    public static List<Candidato> listarCandidatos(int idPartido)
    {
        List<Candidato> listaCandidatos = null;
       
        using(SqlConnection db = new SqlConnection(connectionString))
        {
            string sql = "SELECT * FROM Candidatos WHERE IdPartido = @pIdPartido";
            listaCandidatos = db.Query<Candidato>(sql, new{pIdPartido = idPartido}).ToList();
        }

        return listaCandidatos;
    }
}