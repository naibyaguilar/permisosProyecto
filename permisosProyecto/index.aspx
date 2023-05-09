<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="permisosProyecto.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="wrap-login100 p-l-78 p-r-78 p-t-65 p-b-54">
    <div  class="login100-form validate-form">
				<div class="login100-form validate-form">
					<span class="login100-form-title p-b-49">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-23" data-validate = "Validar Username">
						<span class="label-input100">Usuario</span>
						<input runat="server" id="txtUs" class="input100" type="text" name="username" placeholder="Ingresa tu usuario">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Validar contraseña">
						<span class="label-input100">Contraseña</span>
						<input runat="server" id="txtPass" class="input100" type="password" name="pass" placeholder="Ingresa tu contraseña">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>						
					<br/>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<asp:Button runat="server" id="btnIniciar" Text="Iniciar Sesión" class="login100-form-btn" OnClick="btnIniciar_Click"/>								
						</div>
					</div>
				</div>
			
		
	</div>
            </div>
	
</asp:Content>
