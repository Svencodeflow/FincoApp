package de.sic.finco.fincowebapp.login;

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
public class LoginAppController {

    private final LoginService loginService;

    public LoginAppController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping({"/"})
    public String hello(Model model) {

        return "index";
    }

    @GetMapping({"/login"})
    @ResponseBody
    public Iterable<Login> get() {
        return loginService.get();
    }

    @GetMapping({"/login/{ID}"})
    @ResponseBody
    public Login get(@PathVariable Integer id) {
        Login login = (Login) this.loginService.get(id);
        if(login == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        } else {
            return login;
        }
    }

    @DeleteMapping ({"/login/{loginID}"})
    public void delete(@PathVariable Integer id) {
        loginService.remove(id);
    }

    @PostMapping ({"/login"})
    @ResponseBody
    public Login create(@RequestPart("login") @Valid MultipartFile file) throws IOException {
        return loginService.save(file.getOriginalFilename(), file.getContentType(), file.getBytes());
    }
}
