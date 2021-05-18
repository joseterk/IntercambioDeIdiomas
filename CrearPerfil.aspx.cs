using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IntercambioDeIdiomas
{
    public partial class CrearPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarDatosIniciales();
        }
        private void CargarDatosIniciales()
        {
            for(int i = 10; i < 100; i++) {
                DlEdad.Items.Add(new ListItem("" + i + "",""+i+""));
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
        }
    }
}