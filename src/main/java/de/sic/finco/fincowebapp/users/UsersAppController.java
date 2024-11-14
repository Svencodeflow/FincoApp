package de.sic.finco.fincowebapp.users;

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
public class UsersAppController {

    private final UsersService usersService;

    public UsersAppController(UsersService usersService) {
        this.usersService = usersService;
    }

    @GetMapping({"/"})
    public String hello(Model model) {

        return "index";
    }

    @GetMapping({"/users"})
    @ResponseBody
    public Iterable<Users> get() {
        return usersService.get();
    }

    @GetMapping({"/users/{kdNr}"})
    @ResponseBody
    public Users get(@PathVariable String kdNr) {
        Users users = (Users) this.usersService.get(kdNr);
        if(users == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return users;
        }
    }

    @DeleteMapping ({"/users/{kdNr}"})
    public void delete(@PathVariable String kdNr) {
        usersService.remove(kdNr);
    }

    @PostMapping ({"/users"})
    @ResponseBody
    public Users create(@RequestPart("users") @Valid MultipartFile file) throws IOException {
        return usersService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
    }
}
