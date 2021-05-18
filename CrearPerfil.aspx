<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearPerfil.aspx.cs" Inherits="IntercambioDeIdiomas.CrearPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


                       <div class="col-md-4">
                            <asp:Label ID="lbNombre" runat="server" CssClass="">Nombre</asp:Label>
                            <asp:TextBox ID="tbNombre" runat="server" CssClass="form-control" ></asp:TextBox>
                            <asp:Label ID="lbEmail" runat="server">Email</asp:Label>
                            <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" placeholder="name@example.com" ></asp:TextBox>
                           <asp:Label ID="LbEdad" runat="server">Edad</asp:Label>
                            <asp:DropDownList ID="DlEdad" runat="server"></asp:DropDownList>  
                         </div>

                        <div class="col-md-3">                 
                            <asp:Label ID="LabelPasswd" Text="Password" runat="server"></asp:Label>
                            <asp:TextBox ID="tbPasswd" runat="server" CssClass="form-control"></asp:TextBox> 
                            <asp:Label ID="LbDescripcion" Text="Descripcion" runat="server"></asp:Label>
                            <textarea id="" class="form-control rounded-0" rows="6"></textarea>
                        </div>
                        <div class="col-md-3"">
                            <asp:Label ID="lbPasw" Text="Confirmar Password" runat="server"></asp:Label>
                            <asp:TextBox ID="TbConfirmarPasswd" runat="server" CssClass="form-control" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                                 <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                 ControlToValidate="TbConfirmarPasswd"
                                 CssClass="ValidationError"
                                 ControlToCompare="tbPasswd"
                                 ErrorMessage="Las contraseñas no son iguales" 
                                 ToolTip="Password must be the same" />

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                 ErrorMessage="&laquo; (Required)" 
                                 ControlToValidate="ConfirmPass"
                                 CssClass="ValidationError"
                                 ToolTip="Compare Password is a REQUIRED field">
                                </asp:RequiredFieldValidator>

                            <asp:Label ID="LbIntereses" runat="server">Intereses</asp:Label>
                            <textarea id="TaInteres" class="form-control rounded-0" rows="6"></textarea>
                        </div>


</asp:Content>
