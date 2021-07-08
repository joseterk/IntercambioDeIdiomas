using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntercambioDeIdiomas
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("CrearPerfil.aspx",true);
            //ProbarBD();
        }

        private void ProbarBD()
        {

            using (IntercambioIdiomasEntities db= new IntercambioIdiomasEntities())
            {
                var listaUsuario = db.USUARIO.ToList();

                foreach(var user in listaUsuario)
                {
                }

                IdDatagrid.DataSource = listaUsuario;
                IdDatagrid.DataBind();

            }

        }
    }
}