<article class="post clearfix">

			<header>
				<h2>Registrarse</h2>
			</header>	
				<form onsubmit="GuardarUsuario();return false"  enctype="multipart/form-data">
				
						<div class="form-group">
						    <label>Nombre de usuario</label>
						    <input class="form form-control" type="text"  minlength="4" title="Se necesita el nombre del usuario" id="nombreUsuario" name="nombre"required autofocus="" pattern="[a-zA-Z]*+" placeholder="Nombre">
						</div>

						<div class="form-group">
						    <label>Contraseña</label>
							<input class="form form-control" type="password"  minlength="4"  id="contraseña" title="Ingrese contraseña"  class="form-control" placeholder="Contraseña" pattern="[a-zA-Z0-9]*+" required="" autofocus="">
						</div>
						
						<div class="form-group">
						    <label >Correo electronico</label>
							<input class="form form-control" type="email"  id="mail" title="Ingrese un mail"  class="form-control" placeholder="E mail" required  autofocus="">
						</div>

						
						<div class="form-group">
						    <label for="exampleInputEmail1">Empresa a la que pertenece</label>

						    <select class="form form-control" id="empresa" name="empresa"  placeholder="empresa">
								<?php
									require_once("../clases/empresa.php");
									require_once("../clases/AccesoDatos.php");
										$empresas = empresa::TraerTodasLasEmpresas();
										foreach ($empresas as $emp) 
											{
												echo "<option value='$emp->idEmpresa'>$emp->nombre</option>";
											}
								?>
							</select>		
							
						</div>
												
						<div class="form-group">
						    <label for="exampleInputEmail1">Foto</label>
							<input class="form form-control" type="file"  id="foto" title="Debe tener una foto"  class="form-control" required  autofocus="">
						</div>			
						
						<div class="form-group">
						   	<input type="submit"  class= "btn btn-info" id="guardarUsuario" value="Registrarse" >	
						</div>	
									

					
				</form>	

	</article>