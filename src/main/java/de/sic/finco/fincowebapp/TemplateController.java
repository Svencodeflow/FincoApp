package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.time.Duration;

@Controller
public class TemplateController {

    @GetMapping("/")
    public ModelAndView home(Model model, @CookieValue(value = "visitCount", defaultValue = "0") String visitCount, HttpServletResponse response) {
        model.addAttribute("username", "John Doe");

        int visits = Integer.parseInt(visitCount);
        visits++;

        Cookie cookie = new Cookie("visitCount", Integer.toString(visits));
        cookie.setMaxAge((int) Duration.ofDays(1).toSeconds());
        response.addCookie(cookie);

        if (visits == 1) {
            return new ModelAndView("redirect:/landingpage");
        } else if (visits == 2) {
            return new ModelAndView("redirect:/login");
        } else {
            return new ModelAndView("redirect:/home");
        }
    }

    @GetMapping("/landingpage")
    public String landingPage() {
        return "pages/landingpage";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "pages/login";
    }

    @PostMapping("/login")
    public ModelAndView login(@RequestParam("username") String username, RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("username", username);
        return new ModelAndView("redirect:/home");
    }

    @GetMapping("/home")
    public String homePage(@CookieValue(value = "username", defaultValue = "Guest") String username, Model model) {
        model.addAttribute("username", username);
        return "pages/home";
    }
}
