package de.sic.finco.fincowebapp;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.Duration;

@Controller
public class TemplateController {

    @GetMapping("/")
    public String home(Model model, HttpServletRequest request, HttpServletResponse response) {
        model.addAttribute("username", "John Doe");

        // Check if the cookie exists
        Cookie[] cookies = request.getCookies();
        boolean isFirstVisit = true;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("firstVisit")) {
                    isFirstVisit = false;
                    break;
                }
            }
        }

        // Set the cookie for future visits
        Cookie cookie = new Cookie("firstVisit", "true");
        cookie.setMaxAge((int) Duration.ofDays(1).toSeconds()); // Cookie for one day
        response.addCookie(cookie);

        if (isFirstVisit) {
            return "pages/landingpage";
        } else {
            return "pages/home";
        }
    }
}
