using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntercambioDeIdiomas.Vistas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            using (var context = new IntercambioIdiomasEntities())
            {
                var usuario=context.USUARIO.SingleOrDefault(x=> x.email==tbEmail.Text && x.password==tbPasswd.Text);
                if (usuario == null)
                {
                    divAlerta.Visible=true;
                }
                else
                {
                    divAlerta.Visible = false;
                    Label EtiquetaUsuario= (Label)Master.FindControl("lbUsuario");
                    EtiquetaUsuario.Text = usuario.nombre;
                    EtiquetaUsuario.Visible = true;
                    EtiquetaUsuario.ForeColor= System.Drawing.Color.White;
                    ActivarElementos();
                    Session["USUARIO"] = usuario;
                }
            }

        }

        /// <summary>
        ///  metodo que activa los elementos enlaces y otros una vez se loguea el usuario. por ejemplo link mensajeria etc.
        /// </summary>
        private void ActivarElementos()
        {
            //(li)Master.FindControl("LiMensajeria").Visible=true;
        }
    }
}