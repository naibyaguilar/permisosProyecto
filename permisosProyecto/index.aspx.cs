using System;
using System.Linq;

namespace permisosProyecto
{
    public partial class index : System.Web.UI.Page
    {
        accesEntities context;
        string id, nombreus, nombretipo, permiso, nombrePadre,idpadre;
        protected void Page_Load(object sender, EventArgs e)
        {
            context = new accesEntities();
        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            string user = txtUs.Value.ToString().Trim();
            var usuario = context.usuarios.GroupJoin(context.UsuarioPermisos, us => us.id, p => p.idusuario, (us, p) => new { us, p }).FirstOrDefault(x => x.us.correo.Contains(user) && x.us.pass.Contains(txtPass.Value.ToString().Trim()));
            if (usuario.p.Count() > 0) { 
                id = usuario.p.ElementAt(0).usuario.id.ToString();
                nombreus= usuario.p.ElementAt(0).usuario.nombre.ToString();
                nombretipo  = usuario.p.ElementAt(0).usuario.tipo.nombre.ToString();
                permiso = usuario.p.ElementAt(0).permiso.ToString();
                nombrePadre= usuario.p.ElementAt(0).usuario1.nombre.ToString();
                idpadre = usuario.p.ElementAt(0).usuario1.id.ToString();
                Session["id"] = id;
                Session["nombreUs"] = nombreus;
                Session["nombreTipo"] = nombretipo;
                Session["permiso"] = permiso;
                Session["nombrePadre"] = nombrePadre;
                Session["idpadre"] = idpadre;
                Response.Redirect("inicio.aspx");
            }
            

        }
    }
}