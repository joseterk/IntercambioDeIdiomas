using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data;

namespace IntercambioDeIdiomas.Vistas
{
    public partial class Buscador : System.Web.UI.Page
    {
        USUARIO usuario = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = (USUARIO)Session["USUARIO"];
            if(Session["EmailUsuario"]!=null)
            Session["EmailUsuario"] = usuario.email;
            if (!IsPostBack)
            {
                CargaDatosIniciales();
            }

          
        }
        void Page_LoadComplete(object sender, EventArgs e)
        {
            
        }

        private void CargaDatosIniciales()
        {

            DlNivelIdioma.Items.Add(new ListItem("Seleccione Nivel", null));
            DlNivelIdioma.Items.Add(new ListItem("Principiante", "Principiante"));
            DlNivelIdioma.Items.Add(new ListItem("Intermedio", "Intermedio"));
            DlNivelIdioma.Items.Add(new ListItem("Avanzado", "Avanzado"));
            DlHabla.Items.Add(new ListItem("",""));
            DlAprendiendo.Items.Add(new ListItem("",""));
            DlGenero.Items.Add(new ListItem("Seleccione Genero", null));
            DlGenero.Items.Add(new ListItem("Mujer", "Mujer"));
            DlGenero.Items.Add(new ListItem("Hombre", "Hombre"));
            for (int i = 10; i <= 100; i++)
            {
                DlEdadDesde.Items.Add(new ListItem("" + i + "","" + i + ""));
                DlEdadHasta.Items.Add(new ListItem("" + i + "", "" + i + ""));
            }
            using (var context = new IntercambioIdiomasEntities())
            {
                var ListaLenguajes = context.LENGUAJES.ToList();
                foreach (LENGUAJES lengua in ListaLenguajes)
                {
                    DlHabla.Items.Add(new ListItem(lengua.nombre, lengua.id.ToString()));
                    DlAprendiendo.Items.Add(new ListItem(lengua.nombre, lengua.id.ToString()));
                }
                var ListaCiudades = context.CIUDADES.ToList();
                DlCiudad.Items.Add(new ListItem("Elija ciudad de busqueda", null));
                foreach (CIUDADES ciudad in ListaCiudades)
                {
                    DlCiudad.Items.Add(new ListItem(ciudad.city, ciudad.city.ToString()));
                }
            }

            DlHabla.SelectedIndex= (int)usuario.idioma_que_estudia;
            DlAprendiendo.SelectedIndex = (int)usuario.idioma_nativo;
            DlCiudad.SelectedValue = usuario.CIUDAD;
            DlEdadHasta.SelectedValue = "" + 100 + "";
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            string interesesUsuario = "";
            using (var context = new IntercambioIdiomasEntities())
            {
                int EdadDesde = int.Parse(DlEdadDesde.SelectedValue);
                int EdadHasta = int.Parse(DlEdadHasta.SelectedValue);
                var usuarios = context.USUARIO.Where(x => x.edad >= EdadDesde && x.edad <= EdadHasta).ToList();
                interesesUsuario = usuario.intereses;
            }
            var dv = SqlDataSource1.Select(DataSourceSelectArguments.Empty) as DataView;
            if (dv != null) { 
            dv.Table.Columns.Add("InteresesComun", typeof(String)); // se añade una columna con los intereses en comun

                foreach ( DataRow dr in dv.Table.Rows) {

                    dr["InteresesComun"] =  AlgoritmoCompatibilidadIntereses(interesesUsuario, dr["intereses"].ToString()).ToString();
                }
            }
            ListView1.DataSource = dv;
            ListView1.DataBind();
        }


        /// <summary>
        /// Este es al algoritmo que nos permite saber los intereses en común y el porcentaje de compatibilidad
        /// </summary>
        /// <param name="InteresesUsuario"></param>
        /// <param name="InteresesCompanieroIdiomas"></param>
        /// <returns></returns>
        private string AlgoritmoCompatibilidadIntereses( string InteresesUsuario, string InteresesCompanieroIdiomas)
        {
            double PorcentajeCoincidencia;
            //string InteresesEnComun = "";
            string[] palabrasInteresesUsuario = InteresesUsuario.Replace(",","").Split(' ');
            string[] palabrasInteresesCompanieroIdiomas = InteresesCompanieroIdiomas.Trim().Replace(",", "").Split(' ');
            List<string> ListaInteresesEnComun = new List<string>(); ;
            foreach (string palabra in palabrasInteresesUsuario)
            {
                if (palabrasInteresesCompanieroIdiomas.Contains(palabra)){
                    ListaInteresesEnComun.Add(palabra);
                    
                }
            }
            PorcentajeCoincidencia =( (double)ListaInteresesEnComun.Count / (double)palabrasInteresesUsuario.Length)*100;
            string PorcentajeComun = " el porcentaje en común de intereses es " + ((int)PorcentajeCoincidencia).ToString()+ "%";
            ListaInteresesEnComun.Add(PorcentajeComun);
            string Resultado = String.Join(",",ListaInteresesEnComun);
            return Resultado;
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
        }


        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {

        }
    }
}