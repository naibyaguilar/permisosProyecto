using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace permisosProyecto
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        accesEntities context;
        protected void Page_Load(object sender, EventArgs e)
        {
            context = new accesEntities();
        }


        [WebMethod]

        public static object getList() {
            int id = Convert.ToInt32(HttpContext.Current.Session["id"]);
            accesEntities context = new accesEntities();
            context.Configuration.ProxyCreationEnabled = false;
            var lista = context.usuarios.ToList();

            var listaa = (from us in context.usuarios
                         join per in context.UsuarioPermisos on us.id equals per.idusuario
                         where per.idpadre == id
                         select new
                         {
                             idusuario = us.id,
                             nombre = us.nombre,
                             correo = us.correo,
                             tipo = per.usuario.tipo.nombre,
                             permiso = per.permiso,
                         }).ToList();
            object data = new { data = listaa };
            return data;
        }

        [WebMethod]
        public static object getListHijos() {
            return 0;       
        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            
        }
        protected void btnSalir_Click(object sender, EventArgs e)
        {
           Session.Clear();
           Session.Abandon();
        }
    }
}