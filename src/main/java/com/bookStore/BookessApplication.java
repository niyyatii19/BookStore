package com.bookStore;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class BookessApplication{
	public static void main(String[] args) {
		SpringApplication.run(BookessApplication.class, args);

	}

//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/resources/**").addResourceLocations("resources/static");
//	
//	}
//	
//	@Override
//    public void onStartup(ServletContext servletContext) throws ServletException {
//    	System.out.println("Create servlet context");
//        AnnotationConfigWebApplicationContext appContext = new AnnotationConfigWebApplicationContext();
//        appContext.register(BookessApplication.class);
//         
//        ServletRegistration.Dynamic dispatcher = servletContext.addServlet(
//                "SpringDispatcher", new DispatcherServlet(appContext));// controller
//        dispatcher.setLoadOnStartup(1);
//        dispatcher.addMapping("/");
//         
//    }
}
