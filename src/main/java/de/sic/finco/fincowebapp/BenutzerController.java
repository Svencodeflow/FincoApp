package de.sic.finco.fincowebapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.ui.Model;

import java.util.Optional;

@Controller
@RequestMapping("/benutzer")
@SessionAttributes({"username", "email"})
public class BenutzerController {

    @Autowired
    private BenutzerService benutzerService;

    @GetMapping("/{id}")
    public String getBenutzer(@PathVariable Long id, Model model) {
        Optional<Benutzer> benutzer = benutzerService.getBenutzerById(id);
        if (benutzer.isPresent()) {
            model.addAttribute("username", benutzer.get().getName());
            model.addAttribute("email", benutzer.get().getEmail());
        }
        return "redirect:/dashboard"; // Beispiel: Weiterleitung zum Dashboard
    }

    @GetMapping("/clear")
    public String clearSession(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "redirect:/"; // Beispiel: Weiterleitung zur Startseite
    }
}