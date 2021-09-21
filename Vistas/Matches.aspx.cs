using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntercambioDeIdiomas.Vistas
{
    public partial class Matches : System.Web.UI.Page
    {
        USUARIO usuario = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (USUARIO)Session["USUARIO"];
            Session["EmailUsuario"] = usuario.email;
        }
    }
}