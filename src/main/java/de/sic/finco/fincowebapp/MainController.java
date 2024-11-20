package de.sic.finco.fincowebapp;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
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
    private final MainService umsatzService;
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

    private static final String ERROR_MESSAGE = "Invalid username or password";

    @GetMapping("/transactions")
    public String getTransactions(HttpServletRequest request, Model model, String error, String logout) {
        handleLoginError(model, error);
        return "pages/transactions";
    }

    @PostMapping("/transactions")
    public String showTransactions(HttpServletRequest request, Model model, String error, String logout) {
        handleLoginError(model, error);
        return "pages/transactions";
    }

    private void handleLoginError(Model model, String error) {
        if (error != null) {
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", ERROR_MESSAGE);
        }
    }

    @GetMapping("/csv")
    public String csv(HttpServletRequest request, Model model, String error, String logout) {
        handleLoginError(model, error);
        return "pages/csv";
    }



    public Umsatz save(Double betrag, String kategorieID, byte[] data) {
        Umsatz umsatz = new Umsatz();
        umsatz.setBetrag(betrag);
        umsatz.setUmsatzid(Integer.parseInt(UUID.randomUUID().toString())); // Möglicher Fehler hier
        MainController umsatzRepository = null;
        umsatzRepository.save(umsatz);
        return umsatz;
    }

    private void save(Umsatz umsatz) {
    }

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


}