package de.sic.finco.fincowebapp.umsatz;

import de.sic.finco.fincowebapp.kategorie.Kategorie;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;

//@RestController
@Controller
public class UmsatzAppController {

    private final UmsatzService umsatzService;

    public UmsatzAppController(UmsatzService umsatzService) {
        this.umsatzService = umsatzService;
    }

    @GetMapping({"/"})
    public String hello(Model model) {

        return "index";
    }

    @GetMapping({"/umsatz"})
    @ResponseBody
    public Iterable<Umsatz> get() {
        return umsatzService.get();
    }

    @GetMapping({"/umsatz/{kdNr}"})
    @ResponseBody
    public Umsatz get(@PathVariable String kdNr) {
        Umsatz umsatz = (Umsatz) this.umsatzService.get(kdNr);
        if(umsatz == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return umsatz;
        }
    }

    @DeleteMapping ({"/umsatz/{kdNr}"})
    public void delete(@PathVariable String kdNr) {
        umsatzService.remove(kdNr);
    }

    @PostMapping ({"/umsatz"})
    @ResponseBody
    public Umsatz create(@RequestPart("umsatz") @Valid MultipartFile file) throws IOException {
        return umsatzService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
    }
}
