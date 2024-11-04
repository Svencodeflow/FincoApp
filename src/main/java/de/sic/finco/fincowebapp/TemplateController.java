package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.time.Duration;

@Controller
public class TemplateController {

    Boolean isFirstLogin = false;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("username", "John Doe");

        if (isFirstLogin = true) {
            return "pages/landingpage";
        } else {
            return "pages/home";
        }
    }


}
