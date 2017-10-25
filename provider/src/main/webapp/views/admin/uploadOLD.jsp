<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProviderOne - Upload</title>
</head>
<body>
	<form:form modelAttribute="itemForm" enctype="multipart/form-data">
		<form:input path="files" id="1" type="file"/><br/><br/>
		<!--<form:input path="tags" type="text" title="######,###"/> -->
		<form:button>Enviar</form:button>
	</form:form>
</body>
</html>