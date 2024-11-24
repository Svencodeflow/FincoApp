package de.sic.finco.fincowebapp;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

    private final MainService umsatzService;


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

    @GetMapping({"/kategorie/{kategorieID}"})
    @ResponseBody
    public Kategorie getKategorie(@PathVariable Integer id) {
        Kategorie kategorie = (Kategorie) this.kategorieService.getKategorie();
        if(kategorie == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return kategorie;
        }
    }

    @DeleteMapping ({"/kategorie/{kategorieID}"})
    public void deleteKategorie(@PathVariable Integer id) {
        kategorieService.removeKategorie(id);
    }

    @PostMapping ({"/kategorie"})
    @ResponseBody
    public Kategorie createKategorie(@RequestPart("kategorie") @Valid Kategorie kategorie) throws IOException {
        return kategorieService.saveKategorie(kategorie);
    }

    private final MainService usersService;

    @GetMapping({"/users"})
    @ResponseBody
    public Iterable<Users> getUsers() {
        return usersService.getUsers();
    }

    @GetMapping({"/users/{kdnr}"})
    @ResponseBody
    public Users getUsers(@PathVariable String kdnr) {
        Users users = (Users) this.usersService.getUsers();
        if(users == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return users;
        }
    }

    @DeleteMapping ({"/users/{kdnr}"})
    public void deleteUsers(@PathVariable String kdnr) {
        usersService.removeUser(kdnr);
    }

    @PostMapping ({"/users"})
    @ResponseBody
    public Users createUsers(@RequestPart("users") @Valid Users users) throws IOException {
        return usersService.saveUsers(users);
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

    private void handleLoginError(Model model, String error) {
        if (error != null) {
            model.addAttribute("error", true);
            model.addAttribute("errorMessage", ERROR_MESSAGE);
        }
    }

    @GetMapping("/csv")
    public String csv(HttpServletRequest request, Model model, String error, Authentication authentication) {
        handleLoginError(model, error);

        if (authentication.getPrincipal() instanceof UserDetails userDetails) {
            model.addAttribute("username", userDetails.getUsername());
            model.addAttribute("authorities", userDetails.getAuthorities());
        } else if (authentication.getPrincipal() instanceof OAuth2User oauth2User) {
            model.addAttribute("username", oauth2User.getAttribute("name"));
            model.addAttribute("email", oauth2User.getAttribute("email"));
            model.addAttribute("authorities", oauth2User.getAuthorities());
        }

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

    @GetMapping({"/umsatz/{umsatzID}"})
    @ResponseBody
    public Umsatz getUmsatz(@PathVariable Integer id) {
        Umsatz umsatz = (Umsatz) this.umsatzService.getUmsatz();
        if(umsatz == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return umsatz;
        }
    }

    @DeleteMapping ({"/umsatz/{umsatzID}"})
    public void deleteUmsatz(@PathVariable Integer id) {
        umsatzService.removeUmsatz(id);
    }

    @PostMapping ({"/umsatz"})
    @ResponseBody
    public Umsatz createUmsatz(@RequestPart("umsatz") @Valid Umsatz umsatz) throws IOException {
        return umsatzService.saveUmsatz(umsatz);
    }

    private final MainService loginService;

    @GetMapping({"/logintest"})
    @ResponseBody
    public Iterable<Login> getLogintest() {
        return loginService.getLogintest();
    }

    @GetMapping({"/logintest/{loginID}"})
    @ResponseBody
    public Login getLogintest(@PathVariable Integer id) {
        Login login = (Login) this.loginService.getLogintest();
        if(login == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return login;
        }
    }

    @DeleteMapping ({"/logintest/{loginID}"})
    public void deleteLogintest(@PathVariable Integer id) {
        loginService.removeLogintest(id);
    }

    @PostMapping ({"/logintest"})
    @ResponseBody
    public Login createLogintest(@RequestPart("logintest") @Valid Login login) throws IOException {
        return loginService.saveLogintest(login);
    }

    private final MainService limitsService;

    @GetMapping({"/limits"})
    @ResponseBody
    public Iterable<Limits> getLimits() {
        return limitsService.getLimits();
    }

    @GetMapping({"/limits/{limitID}"})
    @ResponseBody
    public Limits getLimits(@PathVariable Integer id) {
        Limits limits = (Limits) this.limitsService.getLimits();
        if(limits == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return limits;
        }
    }

    @DeleteMapping ({"/limits/{limitID}"})
    public void deleteLimits(@PathVariable Integer id) {
        limitsService.removeLimit(id);
    }

    @PostMapping ({"/limits"})
    @ResponseBody
    public Limits createLimits(@RequestPart("limits") @Valid Limits limits) throws IOException {
        return limitsService.saveLimits(limits);
    }

    @GetMapping({"/temp_kat"}) //! Homeseite um über Buttons zu interagieren
    public String mode(Model model, Authentication authentication) {
        if (authentication.getPrincipal() instanceof UserDetails userDetails) {
            model.addAttribute("username", userDetails.getUsername());
            model.addAttribute("authorities", userDetails.getAuthorities());
        } else if (authentication.getPrincipal() instanceof OAuth2User oauth2User) {
            model.addAttribute("username", oauth2User.getAttribute("name"));
            model.addAttribute("email", oauth2User.getAttribute("email"));
            model.addAttribute("authorities", oauth2User.getAuthorities());
        }
        return "pages/temp_kat";
    }

    private List<BankCard> bankCards = new ArrayList<>();
    @GetMapping("/wallet") //! Seite zum Karten hinzufügen...leider funktioniert sie noch nicht.
    public String showWallet(Model model) {
        model.addAttribute("bankCards", bankCards);
        return "pages/wallet";
    }

    @PostMapping("/add-card") //! gehört zum Wallet
    public String addCard(@RequestParam String cardNumber, @RequestParam String expiryDate, @RequestParam String cardHolderName) {
        BankCard bankCard = new BankCard(cardNumber, expiryDate, cardHolderName);
        bankCards.add(bankCard);
        return "redirect:pages/wallet";
    }

    private Settings settings;

    @GetMapping("/settings") //! Einstellungen: Namen, ect pp
    public String getSettings(Model model) {
        model.addAttribute("settings", settings);
        return "pages/settings";
    }

    @PostMapping("/settings")
    public String updateSettings(@ModelAttribute Settings newSettings) {
        this.settings = newSettings;
        return "redirect:pages/settings";
    }

    @GetMapping("/report")
    public String report(Model model, Authentication authentication, HttpServletRequest request) {

        List<Umsatz> sortedUmsaetze = (List<Umsatz>) umsatzService.getUmsatz();
        if (sortedUmsaetze == null) {
            sortedUmsaetze = new ArrayList<>(); // Initialisiere eine leere Liste, wenn null
        }

        //Berechnung für Finanzübersicht (Total)
        double balance = 0.0;
        for (Umsatz umsatz : sortedUmsaetze) { // Berechnung der Umsätze
            double betrag = umsatz.getBetrag();
            balance += betrag;
        }

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy"); // Format definieren
        String currentDate = LocalDate.now().format(formatter); // Aktuelles Datum formatieren

        model.addAttribute("sortedUmsaetze", sortedUmsaetze);
        model.addAttribute("balance", balance);
        model.addAttribute("currentDate", currentDate);

        if (authentication.getPrincipal() instanceof UserDetails userDetails) {
            model.addAttribute("username", userDetails.getUsername());
            model.addAttribute("authorities", userDetails.getAuthorities());
        } else if (authentication.getPrincipal() instanceof OAuth2User oauth2User) {
            model.addAttribute("username", oauth2User.getAttribute("name"));
            model.addAttribute("email", oauth2User.getAttribute("email"));
            model.addAttribute("authorities", oauth2User.getAuthorities());
        }

        return "pages/report";
    }

    @GetMapping("/diagram")
    public String diagram(Model model, Authentication authentication, HttpServletRequest request) {
        List<Umsatz> sortedUmsaetze = (List<Umsatz>) umsatzService.getUmsatz();
        if (sortedUmsaetze == null) {
            sortedUmsaetze = new ArrayList<>(); // Initialisiere eine leere Liste, wenn null
        }

        // Berechnung der Transaktionen für die Diagramm Ausgabe (Schrittweise aufbauend)
        List<Double> diagramAmounts = new ArrayList<>();

        double diagramTotal = 0.0;
        for (Umsatz umsatz : sortedUmsaetze) {
            diagramTotal += umsatz.getBetrag();
            diagramAmounts.add(diagramTotal);
        }

        model.addAttribute("sortedUmsaetze", sortedUmsaetze);
        model.addAttribute("diagramAmounts", diagramAmounts);

        if (authentication.getPrincipal() instanceof UserDetails userDetails) {
            model.addAttribute("username", userDetails.getUsername());
            model.addAttribute("authorities", userDetails.getAuthorities());
        } else if (authentication.getPrincipal() instanceof OAuth2User oauth2User) {
            model.addAttribute("username", oauth2User.getAttribute("name"));
            model.addAttribute("email", oauth2User.getAttribute("email"));
            model.addAttribute("authorities", oauth2User.getAuthorities());
        }

        return "pages/diagram";
    }
    @GetMapping("/faq")
    public String faq() {
        return "pages/faq";
    }

    @GetMapping("/datenschutz")
    public String datenschutz() {
        return "pages/datenschutz";
    }

    @GetMapping("/impressum")
    public String impressum() {
        return "pages/impressum";
    }
}