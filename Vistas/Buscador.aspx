<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Buscador.aspx.cs" Inherits="IntercambioDeIdiomas.Vistas.Buscador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <hr>
    <div class="row">


        <hr />
        <div class="col-md-4">
            <asp:Label ID="LbHabla" runat="server">Habla</asp:Label>
            <asp:DropDownList ID="DlHabla" runat="server"></asp:DropDownList>  
        </div>
      
        <div class="col-md-4">
            <asp:Label ID="LbAprendiendo" runat="server">Aprendiendo</asp:Label>
            <asp:DropDownList ID="DlAprendiendo" runat="server"></asp:DropDownList>  
        </div>
        <div class="col-md-4">
            <asp:Label ID="LbNivelIdioma" runat="server">Nivel</asp:Label>
            <asp:DropDownList ID="DlNivelIdioma" runat="server"></asp:DropDownList>  
        </div>

    </div>
      <hr>
    <div class="row">
        <div class="col-md-4">
                <asp:Label ID="LbCiudad" Text="Ciudad" runat="server"></asp:Label>
                <asp:DropDownList ID="DlCiudad" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-4">
            <asp:Label ID="LbGenero" Text="Genero" runat="server"></asp:Label>
            <asp:DropDownList ID="DlGenero" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-4">
            <asp:Label ID="LbEdad" Text="Rango edad" runat="server"></asp:Label>
            <asp:DropDownList ID="DlEdadDesde" runat="server"></asp:DropDownList>
            <asp:DropDownList ID="DlEdadHasta" runat="server"></asp:DropDownList>
        </div>
    </div>
      <div class="row" style="max-width: 100%">
          <hr />
          <div>              
              <asp:Button ID="BtnBuscar" Text="Buscar" runat="server" OnClick="BtnBuscar_Click" style="align-content:center; margin-left:18px"/>
              <hr />

                   <div class="row" style="background-color:slategray; align-content:center; margin-left:16px; color:white" >
                            <div class="col-md-1">
                               
                                <asp:Label id="LbColNombre" runat="server" Text="NOMBRE"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label id="LbColdescripcion" runat="server"  Text="DESCRIPCÍÓN"></asp:Label>
                            </div>
                            <div class="col-md-2">
                                <asp:Label id="LvLbintereses" runat="server"   Text="INTERESES"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <asp:Label id="LvLbedad" runat="server"   Text="EDAD"></asp:Label>
                            </div>
                            <div class="col-md-3">    
                                <asp:Label id="LvLbInteresesComunes" runat="server"  Text="INTERESES EN COMÚN"></asp:Label>
                            </div>
                             <div class="col-md-1">    
                                <asp:Label id="LvNivelIdioma" runat="server"  Text="NIVEL IDIOMA"></asp:Label>
                            </div>
                            <div class="col-md-2">    
                                 <asp:Label id="LvInteresadoCabecera" runat="server"  Text="¿MOSTRADO INTERES?"></asp:Label>                      
                            </div>

                            <!--    <asp:Label id="Label3" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                <asp:Label id="Label4" runat="server" Text='<%# Eval("nombre") %>'></asp:Label> -->

                   </div>
              <asp:ListView ID="ListView1" runat="server"  OnSelectedIndexChanged="ListView1_SelectedIndexChanged" OnItemInserted="ListView1_ItemInserted" >     
                    <ItemTemplate >
                        <div style="height:6px"></div>
                            <div class="row" style="background-color:aliceblue; align-content:center; margin-left:16px" >
                                <div class="col-md-1">
                                    <asp:Label id="LvLbNombre" runat="server" Text='<%# Eval("nombre") %>'></asp:Label>
                                     <asp:Image ID="ImagenPerfil" runat="server" Width="50px" Height="50px" ImageUrl='<%# Eval("path_imagen_perfil") %>' />
                                </div>
                                <div class="col-md-2">
                                    <asp:Label id="LvLbdescripcion" runat="server" Text='<%# Eval("descripcion") %>'></asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <asp:Label id="LvLbintereses" runat="server" Text='<%# Eval("intereses") %>'></asp:Label>
                                </div>
                                <div class="col-md-1">
                                    <asp:Label id="LvLbedad" runat="server" Text='<%# Eval("edad") %>'></asp:Label>
                                </div>
                                <div class="col-md-3">    
                                    <asp:Label id="LvLbInteresesComunes" runat="server" Text='<%# Eval("InteresesComun") %>'></asp:Label>
                                </div>
                                <div class="col-md-1">    
                                    <asp:Label id="LvLbNivelIdioma" runat="server" Text='<%# Eval("nivel_idioma_que_estudia") %>'></asp:Label>
                                </div>                            
                                <div class="col-md-1">    
                                    <asp:Button id="lvBtnInteres" runat="server" Text='<%# (Eval("interes")).ToString().Equals("True")  ? "Si" : "No" %>'  BackColor =  <%# (Eval("interes")).ToString().Equals("True")  ?  System.Drawing.Color.Green : System.Drawing.Color.Red%>  >  </asp:Button>
                                </div>

                         </div>
                    </ItemTemplate>

              </asp:ListView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IntercambioIdiomasConnectionString %>" SelectCommand="SELECT DISTINCT INTERES AS interes, nombre, path_imagen_perfil,nivel_idioma_que_estudia,  descripcion,[email], [edad], [CIUDAD], [intereses] FROM [USUARIO] left join [MATCH] on USUARIO.[email]=match.USUARIO1 WHERE (([CIUDAD] = @CIUDAD) AND ([edad] &gt;= @edad) AND ([edad] &lt;= @edad2))" OnSelecting="SqlDataSource1_Selecting">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="DlCiudad" Name="CIUDAD" PropertyName="SelectedValue" Type="String" />
                      <asp:ControlParameter ControlID="DlEdadDesde" Name="edad" PropertyName="SelectedValue" Type="Int32" />
                      <asp:ControlParameter ControlID="DlEdadHasta" Name="edad2" PropertyName="SelectedValue" Type="Int32" />
                  </SelectParameters>
              </asp:SqlDataSource>
          </div>
      </div>




</asp:Content>
