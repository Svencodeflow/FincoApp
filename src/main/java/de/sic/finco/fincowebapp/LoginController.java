package de.sic.finco.fincowebapp;


import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    Boolean hasAccount = true; //! Datenbank anknüpfen zwecks account abfrage.

    @GetMapping("/")
    public String login() {
        if(hasAccount) {
            return "pages/Homesite";
        }else {
            return "pages/Landingpage";
        }
    }

    @GetMapping("/login")
    public String home(HttpServletRequest request, Model model, String error, String logout) {

        if (error != null) {
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", "Invalid username or password");
        }

        return "pages/login";
    }




}