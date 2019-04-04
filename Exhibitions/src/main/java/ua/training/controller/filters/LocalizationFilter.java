package ua.training.controller.filters;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.core.Config;
import java.io.IOException;
import java.util.Locale;

public class LocalizationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String path = request.getRequestURI();
        if (path.contains("/ua.lang")) {
            System.out.println("==тут співпадіння з укр");
            System.out.println("make ukr lang");
            System.out.println(request.getHeader("referer"));
            Config.set(request.getSession(), Config.FMT_LOCALE, new Locale("ua","UA"));
//            request.getRequestDispatcher("/index.jsp").forward(request,response);
//            response.sendRedirect("/index.jsp");
            response.sendRedirect(request.getHeader("referer"));

        } else if (path.contains("/en.lang")) {
                System.out.println("==тут співпадіння з анг");
                System.out.println("make en lang");
                System.out.println(request.getHeader("referer"));
            Config.set(request.getSession(), Config.FMT_LOCALE,Locale.getDefault());
//                request.getRequestDispatcher("/index.jsp").forward(request, response);
                response.sendRedirect(request.getHeader("referer"));
//        } else if(!path.contains("/app/")) {
//            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
        }else {
                System.out.println("==тут пішли далі");
                filterChain.doFilter(request, response);
            }
        }



    @Override
    public void destroy(){
    }
}