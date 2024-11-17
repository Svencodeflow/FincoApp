package de.sic.finco.fincowebapp;

import jakarta.validation.Valid;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.util.*;

//@RestController
@Controller
public class PhotoAppController {

    //private List<Photo> db = List.of(new Photo("1", "test.jpg"));
    /*
    private Map<String, Photo> db = new HashMap<String, Photo>() {{
        this.put("1", new Photo("1", "test.jpg"));
    }};
     */

    private final PhotosService photosService;

    public PhotoAppController(PhotosService photosService) {
        this.photosService = photosService;
    }

    @GetMapping({"/"})
    public String chart(Model model) {
        //return "Hello World";
        Page page = new Page("Hallo JTE", "Dies ist meine Startseite!");
        List<String> items = List.of("Item 1", "Item 2", "Item 3");

        model.addAttribute("page", page);
        model.addAttribute("items", items);
        model.addAttribute("name", "Lars");

        return "index";
    }

    @GetMapping({"/chart"})
    public String hello(Model model) {
        //return "Hello World";
        Page page = new Page("Hallo JTE", "Dies ist meine Startseite!");
        List<String> items = List.of("Item 1", "Item 2", "Item 3");

        model.addAttribute("page", page);
        model.addAttribute("items", items);
        model.addAttribute("name", "Lars");

        return "chart";
    }

    @GetMapping({"/gallery"})
    public String gallery(Model model) {
        Iterable<Photo> images = photosService.get();
        model.addAttribute("images", images);
        model.addAttribute("images2", images);

        return "gallery";
    }

    @GetMapping({"/photos"})
    @ResponseBody
    //public List<Photo> get() {
    //public Collection<Photo> get() {
    public Iterable<Photo> get() {
        //return this.db.values();
        return photosService.get();
    }

    @GetMapping({"/photos/{id}"})
    @ResponseBody
    //public Photo get(@PathVariable String id) {
    public Photo get(@PathVariable Integer id) {
        Photo photo = (Photo) this.photosService.get(id);
        if (photo == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return photo;
        }
    }

    //@CrossOrigin(origins = "http://localhost:8080")
    @DeleteMapping({"/photos/{id}"})
    //public void delete(@PathVariable String id) {
    @ResponseBody
    public void delete(@PathVariable Integer id) {
        /*
        Photo photo = (Photo) this.photosService.remove(id);
        if (photo == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
         */
        photosService.remove(id);
    }

    @PostMapping({"/photos"})
    @ResponseBody
    //public Photo create(@RequestBody @Valid Photo photo) {
    public Photo create(@RequestPart("data") @Valid MultipartFile file) throws IOException {
        /*
        Photo photo = photosService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
        return photo;
         */
        return photosService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
    }

}
