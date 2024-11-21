package de.sic.finco.fincowebapp;

import gg.jte.TemplateEngine;
   import gg.jte.resolve.DirectoryCodeResolver;
   import org.springframework.context.annotation.Bean;
   import org.springframework.context.annotation.Configuration;

   import java.nio.file.Paths;

   @Configuration
   public class JteConfig {

       @Bean
       public TemplateEngine templateEngine() {
           DirectoryCodeResolver codeResolver = new DirectoryCodeResolver(Paths.get("src/main/jte"));
           return TemplateEngine.create(codeResolver, gg.jte.ContentType.Html);
       }
   }