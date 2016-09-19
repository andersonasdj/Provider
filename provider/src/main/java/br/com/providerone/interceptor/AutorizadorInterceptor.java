package br.com.providerone.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AutorizadorInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object controller) throws Exception {

		String uri = request.getRequestURI();
		if (uri.endsWith("login") || uri.endsWith("loginMobile")
				|| uri.endsWith("logar") || uri.endsWith("logarMobile") 
				|| uri.contains("assets")) {
			return true;
		}
		if (request.getSession().getAttribute("clienteLogado") != null) {
			return true;
		}
		if (request.getSession().getAttribute("funcionarioLogado") != null) {
			return true;
		}
		if (request.getSession().getAttribute("tecnicoLogado") != null) {
			return true;
		}
		response.sendRedirect("login");
		return false;
	}
}