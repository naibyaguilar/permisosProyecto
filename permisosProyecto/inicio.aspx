<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="permisosProyecto.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% if (@Session["id"] !=null) {%>
    	<div class="wrap-login10 p-l-78 p-r-78 p-t-65 p-b-54">
    <div class="login100-form validate-form">
                							<asp:Button runat="server" id="btnSalir"  Text="Salir" class="login10-form-btn" OnClick="btnSalir_Click" />								

    <span class="login100-form-title p-b-49">
						Bienvenido
						<p> <% Response.Write(@Session["nombreUs"].ToString()); %> </p> 
                        <p>Iniciaste como : <% Response.Write(@Session["nombreTipo"].ToString()); %> </p> 
                        
					</span>
					<div class="row">
                        <% int permiso = Convert.ToInt32(Session["permiso"]); %>
                        <% if ( permiso == 0 || permiso == 1 || permiso==2)
                            { %>
                     <button data-modal="agregar" onclick="createModal(this)" type="button" class="btn btn-primary btn-sm">Añadir usuario</button>
                        <%} %>
				   </div>
				   <br/>
				   <table id="table" class="display table-bordered table-hover  table responsive wrap">
					<thead class="thead-dark">
					  <tr>
						  <th>Token</th>
                          <th>Consultar</th>
                          <th>eliminar</th>
                          
					  </tr>
					</thead>
					<tbody>
					</tbody>
				  </table>				  
				</div>
            </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="title"></h5>
                </div>
                <div class="modal-body">
                    <div id="contenedor" class="modal-body">
                       		
                    </div>
                </div>
               
            </div>
        </div>
    </div>
    <%}
        else
        {%>
    

    <% @Response.Redirect("index.aspx");
        }%>
    <script runat="server">
                      
</script>

</asp:Content>
