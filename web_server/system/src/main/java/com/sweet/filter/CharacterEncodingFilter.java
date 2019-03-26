package com.sweet.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//字符编码过滤器
@WebFilter(urlPatterns = "/*",filterName = "CharacterEncodingFilter")
//@Slf4j
public class CharacterEncodingFilter implements Filter{
    @Override
    public void init(FilterConfig filterConfig) {
    }
 
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //log.info(request.getRequestURI());
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        filterChain.doFilter(request , response);
    }
    
    @Override
    public void destroy() {
    }
}

