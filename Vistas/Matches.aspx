<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Matches.aspx.cs" Inherits="IntercambioDeIdiomas.Vistas.Matches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <hr />
               <asp:ListView ID="LVMatches" runat="server" DataKeyNames="email" DataSourceID="SqlDataSource1" GroupItemCount="3" >     
                   
                  <AlternatingItemTemplate>
                        <td runat="server" style="background-color:#FFF8DC;">
                           <asp:Image ID="ImagenPerfil" runat="server" Width="100px" Height="100px" ImageUrl='<%# Eval("path_imagen_perfil") %>' />
                              <br />  <br />
                            email:
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                            <br />
                            <strong> nombre:</strong>
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <br />
                            <strong> descripcion:</strong>
                            <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                            <br />
                            <strong> intereses:</strong>
                            <asp:Label ID="interesesLabel" runat="server" Text='<%# Eval("intereses") %>' />
                            <br />
                            <strong> edad:</strong>
                            <asp:Label ID="edadLabel" runat="server" Text='<%# Eval("edad") %>' />
                            <br />
                            <strong> genero:</strong>
                            <asp:Label ID="GENEROLabel" runat="server" Text='<%# Eval("GENERO") %>' />
                            <br />
                            <br />
                            <asp:Button ID="BtnMensaje" runat="server" Text="Mensajeria" Visible='<%# Eval("INTERES ") %>'/>
                        </td>
                    </AlternatingItemTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">
                            email:
                            <asp:Label ID="emailLabel1" runat="server" Text='<%# Eval("email") %>' />
                            <br />
                            nombre:
                            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            <br />
                            descripcion:
                            <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                            <br />
                            intereses:
                            <asp:TextBox ID="interesesTextBox" runat="server" Text='<%# Bind("intereses") %>' />
                            <br />
                            edad:
                            <asp:TextBox ID="edadTextBox" runat="server" Text='<%# Bind("edad") %>' />
                            <br />
                            genero:
                            <asp:TextBox ID="GENEROTextBox" runat="server" Text='<%# Bind("GENERO") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>No se han devuelto datos.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td runat="server" />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">email:
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <br />
                            nombre:
                            <asp:TextBox ID="nombreTextBox" runat="server" Text='<%# Bind("nombre") %>' />
                            <br />
                            descripcion:
                            <asp:TextBox ID="descripcionTextBox" runat="server" Text='<%# Bind("descripcion") %>' />
                            <br />
                            intereses:
                            <asp:TextBox ID="interesesTextBox" runat="server" Text='<%# Bind("intereses") %>' />
                            <br />
                            edad:
                            <asp:TextBox ID="edadTextBox" runat="server" Text='<%# Bind("edad") %>' />
                            <br />
                            genero:
                            <asp:TextBox ID="GENEROTextBox" runat="server" Text='<%# Bind("GENERO") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                            <br />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate >
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                            <asp:Image ID="ImagenPerfil" runat="server" Width="100px" Height="100px" ImageUrl='<%# Eval("path_imagen_perfil") %>' />
                             <br />  <br />
                           email:
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                            <br />
                           <strong> nombre:</strong>
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <br />
                            <strong>descripcion:</strong>
                            <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                            <br />
                             <strong>intereses:</strong>
                            <asp:Label ID="interesesLabel" runat="server" Text='<%# Eval("intereses") %>' />
                            <br />
                             <strong>edad:</strong>
                            <asp:Label ID="edadLabel" runat="server" Text='<%# Eval("edad") %>' />
                            <br />
                             <strong>genero:</strong>
                            <asp:Label ID="GENEROLabel" runat="server" Text='<%# Eval("GENERO") %>' />
                            <br />
                            <br />
                            <asp:Button ID="BtnMensaje" runat="server" Text="Mensajeria" Visible='<%# Eval("INTERES ") %>'/>
                        </td>
                    </ItemTemplate>

                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr id="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    
                    <SelectedItemTemplate>
                        <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                           
                            <br />
                            email:
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                            <br />
                            nombre:
                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                            <br />
                            descripcion:
                            <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
                            <br />
                            intereses:
                            <asp:Label ID="interesesLabel" runat="server" Text='<%# Eval("intereses") %>' />
                            <br />
                            edad:
                            <asp:Label ID="edadLabel" runat="server" Text='<%# Eval("edad") %>' />
                            <br />
                            GENERO:
                            <asp:Label ID="GENEROLabel" runat="server" Text='<%# Eval("GENERO") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>

              </asp:ListView>
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IntercambioIdiomasConnectionString %>" SelectCommand="select * FROM USUARIO inner join MATCH on USUARIO.email=MATCH.USUARIO2 where USUARIO1=@email AND INTERES =1 AND USUARIO2 IN (SELECT USUARIO1 FROM MATCH WHERE USUARIO2=@email AND INTERES =1)">
                   <SelectParameters>
                       <asp:SessionParameter Name="email" SessionField="EmailUsuario" Type="String" />
                   </SelectParameters>
               </asp:SqlDataSource>
</asp:Content>
