<html>
<jsp:useBean id="bean52" class="org.nibble.service.vo.proveedores.Bean52" scope="session"/>
<jsp:useBean id="bean71" class="org.nibble.service.vo.pedidos.Bean71" scope="session"/>
<head>
<%if (bean71.isBitsalidareciente()){%>
<title>NC 7.1 Sugerencia de resurtido por ventas recientes</title>
<%}else{%>
<title>NC 7.2 Sugerencia de todas las partes por resurtir</title>
<%}%>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="lib/estilo.css" rel=STYLESHEET type=text/css>
<script language=JavaScript>

function asociar_onclick(form){
	sel = 0;
	for (i=0;i<form.elements.length;i++)
		if (form.elements[i].name.substring(0,1)=="C")
			if (form.elements[i].checked)
				sel ++;
		
	if (sel==0){
		alert ('Debe marcar al menos un proveedor')
		return false;
	}
	form.accion.value=3;
	return true;
}
</script>
</head>
<%@ include file="../main.jsp" %>
<body bgcolor="#FFFFFF" text="#000000">
<form name=frm action="SugerenciaPedido" method="post">
<input type="hidden" name=accion>
<table class="tablatext" width=750 align="center" cellpadding="0" cellspacing="0">
<%if (bean71.isBitsalidareciente()){%>
	<td><img src="images/tnc7_1.GIF"></td>
<%}else{%>
	<td><img src="images/tnc7_2.GIF"></td>
<%}%>
</table>
<br>
<table align="center" border="1" bordercolor="#364859" rules="cols" cellspacing="0" width="750" style="border-color:Black;border-width:1px;border-style:solid;font-family: arial; font-size: 11px;border-collapse:collapse;" class="tablatext">
	<tr>
			<td colspan=4>Clasificaci�n</td>
	</tr>
	<tr class="titStyle">
	    	<td width="25%">Categor�a</td>
			<td width="25%">Grupo</td>
			<td width="25%">L�nea</td>
			<td width="25%">Marca</td>
	</tr>
	<tr class="itemStyle">
			<td><%= request.getParameter("vchcategoria") %></td>
			<td><%= request.getParameter("vchgrupo") %></td>
			<td><%= request.getParameter("vchlinea") %></td>
			<td><%= request.getParameter("vchmarca") %></td>
	</tr>
</table>
<br>
<table align="center" border="1" bordercolor="#364859" rules="cols" cellspacing="0" width="750" style="border-color:Black;border-width:1px;border-style:solid;font-family: arial; font-size: 11px;border-collapse:collapse;" class="tablatext">
<tr>
	<td colspan=3>Seleccionar Proveedores</td>
</tr>
<tr class="titStyle">
  	  <td width="10%">Sel</td>
	  <td width="10%">Id</td>
	  <td width="80%">Raz&oacute;n Social</td>
 </tr>
<% String stilo;
   for (int i = 0; i < bean52.getProveedoresSize(); i++) {
	 	if (i % 2 == 0)stilo = "itemStyle";
		else stilo = "alternatingItemStyle"; 
	%>
    <tr class="<%=stilo%>">
 	<td width="10%"><input type=checkbox name=C<%= bean52.getId(i) %>></td>
    <td width="10%"><%= bean52.getId(i) %></td>
	<td width="80%"><%= bean52.getRazonsocial(i) %></td>
   </tr>
<%
}
%> 
</table>
<br>
<table align="center" border="1" bordercolor="#364859" rules="cols" cellspacing="0" width="750" style="border-color:Black;border-width:1px;border-style:solid;font-family: arial; font-size: 11px;border-collapse:collapse;" class="tablatext">
	<tr class="titStyle">
	<td align=center><input type="submit" value="Sugerir" class=body onclick="return asociar_onclick(this.form)" <%if (bean52.getProveedoresSize()==0) {%>DISABLED <%}%>  >	</td>
</tr>
</table>
<br>
<table align="center" width="750">
<%if (bean71.isBitsalidareciente()){%>
	<tr><td><a href="PreSugerenciaPedidoReciente" class="ligas"><< Regresar</a></td></tr>
<%}else{%>
	<tr><td><a href="PreSugerenciaPedido" class="ligas"><< Regresar</a></td></tr>
<%}%>
</table>
<input type="hidden" name=iidcategoria value=<%= request.getParameter("iidcategoria") %>>
<input type="hidden" name=iidgrupo value=<%= request.getParameter("iidgrupo") %>>
<input type="hidden" name=iidlinea value=<%= request.getParameter("iidlinea") %>>
<input type="hidden" name=iidmarca value=<%= request.getParameter("iidmarca") %>>
<input type=hidden name="vchcategoria" value="<%= request.getParameter("vchcategoria") %>">
<input type=hidden name="vchgrupo" value="<%= request.getParameter("vchgrupo") %>">
<input type=hidden name="vchlinea" value="<%= request.getParameter("vchlinea") %>">
<input type=hidden name="vchmarca" value="<%= request.getParameter("vchmarca") %>">
</form>
</body>
</html>