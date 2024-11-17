package de.sic.finco.fincowebapp;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

@Controller
public class LoginController {

    @Autowired
    private MessageSource messageSource;

    @GetMapping("/")
    public String home(Model model, @RequestParam(value = "lang", required = false) String lang) {
        Locale locale = lang != null ? new Locale(lang) : Locale.getDefault();
        LocaleContextHolder.setLocale(locale);

        ResourceBundle bundle = ResourceBundle.getBundle("messages", locale);
        Map<String, String> messages = new HashMap<>();
        for (String key : bundle.keySet()) {
            messages.put(key, bundle.getString(key));
        }
        model.addAttribute("messages", messages);

        return "pages/Landing";
    }

    @GetMapping("/login")
    public String login(HttpServletRequest request, Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", "Invalid username or password");
        }
        return "pages/login";
    }
}