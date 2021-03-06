<g:set var='securityConfig' value='${applicationContext.springSecurityService.securityConfig}'/>
<html>
<head>
	<meta name="layout" content="main"/>
	<title>Training Reservation - login</title>
</head>
<body>
<p/>
<div class="login s2ui_center ui-corner-all" style='text-align:center;'>
	<div class="login-inner">
		<s2ui:form type='login' focus='username'>
			<div class="sign-in">
				<h2><g:message code='spring.security.ui.login.signin'/></h2>
				<table>
					<tr>
						<td><label for="username"><g:message code='spring.security.ui.login.username'/></label></td>
						<td><input type="text" name="${securityConfig.apf.usernameParameter}" id="username" class='formLogin' size="20"/></td>
					</tr>
					<tr>
						<td><label for="password"><g:message code='spring.security.ui.login.password'/></label></td>
						<td><input type="password" name="${securityConfig.apf.passwordParameter}" id="password" class="formLogin" size="20"/></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" class="checkbox" name="${securityConfig.rememberMe.parameter}" id="remember_me" checked="checked"/>
							<label for='remember_me'><g:message code='spring.security.ui.login.rememberme'/></label>
						</td>
						<td>
							<g:submitButton name='loginButton' value="login"/>
						</td>
					</tr>

				</table>
			</div>
		</s2ui:form>
	</div>
</div>
</body>
</html>
