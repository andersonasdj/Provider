<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
     "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProviderOne - Upload</title>
</head>
<body>
    <div align="center">
        <h1>Alteração de imagem de perfil</h1>
        <form method="get" action="doUpload" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Selecione a imagem:</td>
                    <td><input type="file" name="fileUpload" size="50" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Upload" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>