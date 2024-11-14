package de.sic.finco.fincowebapp;


import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/")
    public String login() {

        return "pages/Landingpage";
    }

    @GetMapping("/register")
    public String register() {

        return "pages/register";
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