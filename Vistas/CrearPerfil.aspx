<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearPerfil.aspx.cs" Inherits="IntercambioDeIdiomas.CrearPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
hr {
    height:0.5px;
}
</style>
    <div style="height:90%" >
                    <hr />
                    <div class="row">
                                        <div class="col-md-4 top-buffer" >
                                            <asp:FileUpload ID="FileUpload1" runat="server" /><br/>
                                              <asp:Button ID="Button1" runat="server" Text="Subir Imagen" OnClick="UploadFile" CausesValidation="false" /><br/>
                                            <asp:Image ID="ImgPerfil" runat="server"  />
                                            <hr />
                                            <asp:Label ID="lbNombre" runat="server" CssClass="">Nombre</asp:Label>
                                            <asp:TextBox ID="tbNombre" runat="server" CssClass="form-control" ></asp:TextBox>
                                                <hr />
                                            <asp:Label ID="lbEmail" runat="server">*Email</asp:Label>
                                            <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" placeholder="name@example.com" ></asp:TextBox>
                                            <asp:RegularExpressionValidator runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ControlToValidate="tbEmail"></asp:RegularExpressionValidator>
                                            <hr />
                                            <asp:Label ID="LbEdad" runat="server">Edad</asp:Label>
                                            <asp:DropDownList ID="DlEdad" runat="server"></asp:DropDownList>  
                                            <hr />
                                            <asp:Label ID="LbIdiomaNativo" runat="server">Idioma nativo</asp:Label>
                                            <asp:DropDownList ID="DlIdiomaNativo" runat="server"></asp:DropDownList>  
                                            </div>
                                        <div class="col-md-4">          

                              
                                            <asp:Label ID="LabelPasswd" Text="*Password" runat="server"></asp:Label>
                                            <asp:TextBox ID="tbPasswd" runat="server" CssClass="form-control"></asp:TextBox> 
                                                 <hr />
                                            <asp:Label ID="lbPasw" Text="Confirmar Password" runat="server"></asp:Label>
                                            <asp:TextBox ID="TbConfirmarPasswd" runat="server" CssClass="form-control" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                  
                                            <hr />
                                            <asp:Label ID="LbDescripcion" Text="Descripcion" runat="server"></asp:Label>
                                            <textarea id="txaDescripcion" class="form-control rounded-0" rows="6" runat="server"></textarea>
                                            <hr />
                                            <asp:Label ID="LbCiudad" Text="Elija su ciudad" runat="server"></asp:Label>
                                            <asp:DropDownList ID="DlCiudad" runat="server"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4"">
                                            <asp:Label ID="LbNivelIdioma" runat="server">Nivel</asp:Label>
                                            <asp:DropDownList ID="DlNivelIdioma" runat="server"></asp:DropDownList>  
                                            <hr />
                                            <asp:Label ID="LbIntereses" runat="server">Intereses</asp:Label>
                                            <textarea id="TaInteres" class="form-control rounded-0" rows="6" runat="server"></textarea>                                          
                                           <hr />                                        
                                            <asp:Label ID="LbGenero" Text="Genero" runat="server"></asp:Label>
                                            <asp:DropDownList ID="DlGenero" runat="server"></asp:DropDownList>
                                            <hr />
                                                                                        <asp:Label ID="LbIdiomaQueEstudia" runat="server">Aprendiendo</asp:Label>
                                            <asp:DropDownList ID="DlIdiomaQueEstudia" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DlIdiomaQueEstudia_SelectedIndexChanged"></asp:DropDownList>  
                                            
                                        </div>
                        </div>
                        <hr />
                    <hr />
                        <div class="row">
                            <div class="col-md-3">
                                    <asp:Button ID="BtnCrearPefil" Text="Crear Perfil" runat="server" OnClick="BtnCrearPefil_Click" CausesValidation="true"/>
                                <br /><br />
                                    <asp:Label ID="lbCamposObligatorios" Text="Los campos con * son obligatorios" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-9">

                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ErrorMessage=" La Password es un campo requerido" 
                                                    ControlToValidate="tbPasswd"
                                                      ForeColor="Red"
                                                    CssClass="ValidationError"
                                                    ToolTip="Password es un campo obligatorio">
                                                </asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                    ErrorMessage=" Email es un campo requerido" 
                                                    ControlToValidate="tbEmail"
                                                    ForeColor="Red"
                                                    CssClass="ValidationError"
                                                    ToolTip=" Email es un campo requerido">
                                                </asp:RequiredFieldValidator>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                    ErrorMessage=" Idioma nativo es un campo requerido" 
                                                    ControlToValidate="DlIdiomaNativo"
                                                    CssClass="ValidationError"
                                                      ForeColor="Red"
                                                    ToolTip="Idioma nativo es un campo obligatorio"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                    ErrorMessage=" Idioma que estudias es un campo requerido" 
                                                    ControlToValidate="DlIdiomaQueEstudia"
                                                    CssClass="ValidationError"
                                                         ForeColor="Red"
                                                    ToolTip="Idioma que estudias es un campo obligatorio"></asp:RequiredFieldValidator>
   
                          
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                    ControlToValidate="TbConfirmarPasswd"
                                                    CssClass="ValidationError"
                                                    ControlToCompare="tbPasswd"
                                                         ForeColor="Red"
                                                    ErrorMessage="Las contraseñas no son iguales" 
                                                    ToolTip="Las contraseñas deben ser iguales" />
                                </div>

                        </div>

       </div>


</asp:Content>
