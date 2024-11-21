package de.sic.finco.fincowebapp;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.util.*;

@Controller
public class MainController {

    public MainController(MainService umsatzService) {
        this.umsatzService = umsatzService;
    }

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

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new Users()); // Create an empty User object for the form
        return "pages/register"; // Return the registration template name
    }

    @PostMapping("/register") // Assuming your registration endpoint is "/register"
    public String processRegistration(@ModelAttribute Users user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "pages/register";
        }

        return "redirect:/success";
    }

    @GetMapping("/login")
    public String home(HttpServletRequest request, Model model, String error, String logout) {

        if (error != null) {
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", "Invalid username or password");
        }

        return "pages/login";
    }

    // test

    private final MainService umsatzService;


    @GetMapping({"/umsatz"})
    @ResponseBody
    public Iterable<Umsatz> get() {
        return umsatzService.get();
    }

    @GetMapping({"/umsatz/{ID}"})
    @ResponseBody
    public Umsatz get(@PathVariable Integer id) {
        Umsatz umsatz = (Umsatz) this.umsatzService.get(id);
        if(umsatz == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return umsatz;
        }
    }

    @DeleteMapping ({"/umsatz/{umsatzID}"})
    public void delete(@PathVariable Integer id) {
        umsatzService.remove(id);
    }

    @PostMapping ({"/umsatz"})
    @ResponseBody
    public Umsatz create(@RequestPart("umsatz") @Valid MultipartFile file) throws IOException {
        return umsatzService.save(Double.valueOf(Objects.requireNonNull(file.getOriginalFilename())), file.getContentType(), file.getBytes());
    }

    @GetMapping("/umsatzeintrag")
    public String umsatzeintrag(Authentication authentication, HttpServletRequest request, Model model) {

        if (authentication != null) {
            if (authentication.getPrincipal() instanceof UserDetails userDetails) {
                model.addAttribute("username", userDetails.getUsername());
                model.addAttribute("authorities", userDetails.getAuthorities());
            } else if (authentication.getPrincipal() instanceof OAuth2User oauth2User) {
                model.addAttribute("username", oauth2User.getAttribute("name"));
                model.addAttribute("email", oauth2User.getAttribute("email"));
                model.addAttribute("authorities", oauth2User.getAuthorities());
            }
        }

        return "pages/umsatzeintrag";
    }
}