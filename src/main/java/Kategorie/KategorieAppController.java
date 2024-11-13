package Kategorie;

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
public class KategorieAppController {

    private final KategorieService kategorieService;

    public KategorieAppController(KategorieService kategorieService) {
        this.kategorieService = kategorieService;
    }

    @GetMapping({"/"})
    public String hello(Model model) {

        return "index";
    }

    @GetMapping({"/kategorie"})
    @ResponseBody
    public Iterable<Kategorie> get() {
        return kategorieService.get();
    }

    @GetMapping({"/kategorie/{ID}"})
    @ResponseBody
    public Kategorie get(@PathVariable Integer id) {
        Kategorie kategorie = (Kategorie) this.kategorieService.get(id);
        if(kategorie == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return kategorie;
        }
    }

    @DeleteMapping ({"/kategorie/{kategorieID}"})
    public void delete(@PathVariable Integer id) {
        kategorieService.remove(id);
    }

    @PostMapping ({"/kategorie"})
    @ResponseBody
    public Kategorie create(@RequestPart("kategorie") @Valid MultipartFile file) throws IOException {
        return kategorieService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
    }
}
