using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using Xceed.Wpf.Toolkit;

namespace IntercambioDeIdiomas
{
    public partial class CrearPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
              CargarDatosIniciales();
            }
        }
        private void CargarDatosIniciales()
        {
            try { 
                for(int i = 10; i < 100; i++) {
                    DlEdad.Items.Add(new ListItem("" + i + "",""+i+""));
                }
                DlGenero.Items.Add(new ListItem("Seleccione Genero", ""));
                DlGenero.Items.Add(new ListItem("Mujer", "Mujer"));
                DlGenero.Items.Add(new ListItem("Hombre", "Hombre"));
                DlNivelIdioma.Items.Add(new ListItem("Seleccione Nivel", ""));
                DlNivelIdioma.Items.Add(new ListItem("Principiante", "Principiante"));
                DlNivelIdioma.Items.Add(new ListItem("Intermedio", "Intermedio"));
                DlNivelIdioma.Items.Add(new ListItem("Avanzado", "Avanzado"));

                LENGUAJES lenguajes = new LENGUAJES();
                using (var context = new IntercambioIdiomasEntities())
                {
                    var ListaLenguajes= context.LENGUAJES.ToList();
                    DlIdiomaNativo.Items.Add(new ListItem("Seleccione Idioma Nativo", "0"));
                    DlIdiomaQueEstudia.Items.Add(new ListItem("Seleccione idioma a estudiar", "0"));
                    foreach (LENGUAJES lengua in ListaLenguajes)
                    {
                        DlIdiomaNativo.Items.Add(new ListItem(lengua.nombre, lengua.id.ToString()));
                        DlIdiomaQueEstudia.Items.Add(new ListItem(lengua.nombre, lengua.id.ToString()));
                    }

                    var ListaCiudades = context.CIUDADES.ToList();
                    DlCiudad.Items.Add(new ListItem("Elija su ciudad", "0"));
                    foreach (CIUDADES ciudad in ListaCiudades)
                    {
                        DlCiudad.Items.Add(new ListItem(ciudad.city, ciudad.city.ToString()));
                    }
                }
            }
            catch ( Exception ex)
            {
                string mensajeError = ex.Message;
            }
            

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
        }

        protected void BtnCrearPefil_Click(object sender, EventArgs e)
        {
            try {
            USUARIO user = new USUARIO();
            user.descripcion = txaDescripcion.InnerText;
            user.edad = int.Parse(DlEdad.SelectedValue);
            user.email = tbEmail.Text;
            user.intereses = TaInteres.InnerText;
            user.nombre = tbNombre.Text;
            user.password = tbPasswd.Text;
            user.idioma_nativo = int.Parse(DlIdiomaNativo.SelectedValue);
            user.idioma_que_estudia = int.Parse(DlIdiomaQueEstudia.SelectedValue);
            user.CIUDAD = DlCiudad.SelectedValue;
            user.GENERO = DlGenero.SelectedValue;
            user.nivel_idioma_que_estudia = DlNivelIdioma.SelectedValue;
            user.path_imagen_perfil = ImgPerfil.ImageUrl;
                using (var context= new IntercambioIdiomasEntities())
            {
                    context.USUARIO.Add(user);
               //context.Entry(user);
                context.SaveChanges();
            }
                string script = "alert(\"Usuario creado correctamente!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);

                Session["USUARIO"] = user;

            }
            catch(Exception ex)
            {
                string message = ex.Message;
            }
        }

        protected void DlIdiomaQueEstudia_SelectedIndexChanged(object sender, EventArgs e)
        {
            LbNivelIdioma.Text += " de " + DlIdiomaQueEstudia.SelectedItem.Text;
        }


        protected void UploadFile(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Images/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

            //Display the Picture in Image control.
            ImgPerfil.ImageUrl = "~/Images/" + Path.GetFileName(FileUpload1.FileName);
        }
    }
}