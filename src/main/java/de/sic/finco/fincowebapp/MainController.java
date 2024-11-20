package de.sic.finco.fincowebapp;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
public class MainController {

    public MainController(UmsatzService umsatzService) {
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

    private final UmsatzService umsatzService;


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


    @GetMapping("/report")
    public String report(Model model) {
        List<Umsatz> sortedUmsaetze = (List<Umsatz>) umsatzService.get();
        if (sortedUmsaetze == null) {
            sortedUmsaetze = new ArrayList<>(); // Initialisiere eine leere Liste, wenn null
            }

        //Berechnung für Finanzübersicht (Total)
        double balance = 0.0; for (Umsatz umsatz : sortedUmsaetze) { // Berechnung der Umsätze
            double betrag = umsatz.getBetrag(); balance += betrag;
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy"); // Format definieren
        String currentDate = LocalDate.now().format(formatter); // Aktuelles Datum formatieren

        model.addAttribute("sortedUmsaetze", sortedUmsaetze);
        model.addAttribute("balance", balance);
        model.addAttribute("currentDate", currentDate);
        return "pages/report";
    }
    @GetMapping("/diagram")
    public String diagram(Model model) {
        List<Umsatz> sortedUmsaetze = (List<Umsatz>) umsatzService.get();
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

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        String currentDate = LocalDate.now().format(formatter);

        model.addAttribute("sortedUmsaetze", sortedUmsaetze);
        model.addAttribute("diagramAmounts", diagramAmounts);
        model.addAttribute("diagramTotal",diagramTotal);
        model.addAttribute("currentDate", currentDate);

        return "pages/diagram";
    }

}