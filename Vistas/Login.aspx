<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="IntercambioDeIdiomas.Vistas.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="col-md-2">
            <asp:Label ID="lbEmail" runat="server">Email</asp:Label>
            <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" placeholder="name@example.com" ></asp:TextBox>
            <asp:Button ID="BtnLogin" runat="server" Text="Loguearse" OnClick="BtnLogin_Click" />
                    <div id="divAlerta" class="alert alert-danger" role="alert" runat="server" visible="false">
          Credenciales no válidas
        </div>
        </div>
       <div class="col-md-2">
            <asp:Label ID="LabelPasswd" Text="Password" runat="server"></asp:Label>
            <asp:TextBox ID="tbPasswd" runat="server" CssClass="form-control"></asp:TextBox> 
       </div>


</asp:Content>
