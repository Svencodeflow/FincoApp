package de.sic.finco.fincowebapp;

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

    //private List<Photo> db = List.of(new Photo("1","test.jpg"));
    /*private Map<String, Photo> db = new HashMap<String, Photo>() {{
        this.put("1", new Photo("1", "test.jpg"));
    }};*/

    private final KategorieService kategorieService;

    public KategorieAppController(KategorieService kategorieService) {
        this.kategorieService = kategorieService;
    }

    @GetMapping({"/"})
    public String hello(Model model) {
        //return "Hello World";

        return "index";
    }

    @GetMapping({"/photos"})
    @ResponseBody
    //public List<Photo> get() {
    //public Collection<Photo> get() {
    public Iterable<Kategorie> get() {
        //return this.db.values();
        return kategorieService.get();
    }

    @GetMapping({"/photos/{id}"})
    @ResponseBody
    //public Photo get(@PathVariable String id) {
    public Kategorie get(@PathVariable Integer id) {
        Kategorie photo = (Kategorie) this.kategorieService.get(id);
        if(photo == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return photo;
        }
    }

    @DeleteMapping ({"/photos/{id}"})
    //public void delete(@PathVariable String id) {
    public void delete(@PathVariable Integer id) {
        /*Photo photo = (Photo) this.photosService.remove(id);
        if(photo == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }*/
        kategorieService.remove(id);
    }

    @PostMapping ({"/photos"})
    @ResponseBody
    //public Photo create(@RequestBody @Valid Photo photo) {
    public Kategorie create(@RequestPart("data") @Valid MultipartFile file) throws IOException {
        /*Photo photo = photosService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
        return photo;*/
        return kategorieService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
    }
}
