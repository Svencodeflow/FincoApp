package de.sic.finco.fincowebapp;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class MainController {


    public MainController(MainService kategorieService, MainService usersService, MainService umsatzService,
                          MainService loginService, MainService limitsService, MainService usersService1, MainService loginService1, MainService limitsService1) {
        this.kategorieService = kategorieService;
        this.umsatzService = umsatzService;
        this.usersService = usersService;
        this.loginService = loginService;
        this.limitsService = limitsService;
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

    private final MainService kategorieService;


    @GetMapping({"/kategorie"})
    @ResponseBody
    public Iterable<Kategorie> getKategorie() {
        return kategorieService.getKategorie();
    }

    @GetMapping({"/kategorie/{id}"})
    @ResponseBody
    public Kategorie getKategorie(@PathVariable Integer id) {
        Kategorie kategorie = kategorieService.getKategorieid(id);
        if(kategorie == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return kategorie;
        }
    }

    @DeleteMapping ("/kategorie/{id}")
    @ResponseBody
    public void deleteKategorie(@PathVariable Integer id) {
        kategorieService.removeKategorie(id);
    }

    @PostMapping("/kategorie")
    @ResponseBody
    public ResponseEntity<Kategorie> createKategorie(@RequestBody @Valid Kategorie kategorie) {
        Kategorie savedKategorie = kategorieService.saveKategorie(kategorie);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedKategorie);
    }

    private final MainService usersService;


    @GetMapping({"/users"})
    @ResponseBody
    public Iterable<Users> getUsers() {
        return usersService.getUsers();
    }

    @GetMapping({"/users/{id}"})
    @ResponseBody
    public Users getUsers(@PathVariable Integer id) {
        Users users = usersService.getUserid(id);
        if(users == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return users;
        }
    }

    @DeleteMapping ("/users/{id}")
    @ResponseBody
    public void deleteUsers(@PathVariable Integer id) {
        usersService.removeUser(id);
    }

    @PostMapping("/users")
    @ResponseBody
    public ResponseEntity<Users> createUsers(@RequestBody @Valid Users users) {
        Users savedUsers = usersService.saveUsers(users);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedUsers);
    }

    private final MainService umsatzService;

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
    public Iterable<Umsatz> getUmsatz() {
        return umsatzService.getUmsatz();
    }

    @GetMapping({"/umsatz/{id}"})
    @ResponseBody
    public Umsatz getUmsatz(@PathVariable Integer id) {
        Umsatz umsatz = umsatzService.getUmsatzid(id);
        if(umsatz == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return umsatz;
        }
    }

    @DeleteMapping ({"/umsatz/{id}"})
    @ResponseBody public void deleteUmsatz(@PathVariable Integer id) {
        umsatzService.removeUmsatz(id);
    }

    @PostMapping ({"/umsatz"})
    @ResponseBody
    public ResponseEntity<Umsatz> createUmsatz(@RequestBody @Valid Umsatz umsatz) {
        Umsatz savedUmsatz = umsatzService.saveUmsatz(umsatz);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedUmsatz);
    }

    private final MainService loginService;


    @GetMapping({"/logintest"})
    @ResponseBody
    public Iterable<Login> getLogintest() {
        return loginService.getLogintest();
    }

    @GetMapping({"/logintest/{id}"})
    @ResponseBody
    public Login getLogintest(@PathVariable Integer id) {
        Login login = (Login) loginService.getLogintest(id);
        if(login == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return login;
        }
    }

    @DeleteMapping ({"/logintest/{id}"})
    @ResponseBody public void deleteLogintest(@PathVariable Integer id) {
        loginService.removeLogintest(id);
    }

    @PostMapping ({"/logintest"})
    @ResponseBody
    public ResponseEntity<Login> createLogintest(@RequestBody @Valid Login login) {
        Login savedLogin = loginService.saveLogintest(login);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedLogin);
    }

    private final MainService limitsService;


    @GetMapping({"/limits"})
    @ResponseBody
    public Iterable<Limits> getLimits() {
        return limitsService.getLimits();
    }

    @GetMapping({"/limits/{id}"})
    @ResponseBody
    public Limits getLimits(@PathVariable Integer id) {
        Limits limits = limitsService.getLimitsid(id);
        if(limits == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return limits;
        }
    }

    @DeleteMapping ({"/limits/{id}"})
    @ResponseBody public void deleteLimits(@PathVariable Integer id) {
        limitsService.removeLimit(id);
    }

    @PostMapping ({"/limits"})
    @ResponseBody
    public ResponseEntity<Limits> createLimits(@RequestBody @Valid Limits limits) {
        Limits savedLimits = limitsService.saveLimits(limits);
        return ResponseEntity.status(HttpStatus.CREATED).body(savedLimits);
    }
}