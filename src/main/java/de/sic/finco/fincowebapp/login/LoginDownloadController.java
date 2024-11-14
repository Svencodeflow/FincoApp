package de.sic.finco.fincowebapp.login;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class LoginDownloadController {

    private final LoginService loginService;

    public LoginDownloadController(LoginService loginService) {
        this.loginService = loginService;
    }

    @GetMapping("/download/{loginID}")
    public ResponseEntity<byte[]> download(@PathVariable Integer id) {
        Login login = loginService.get(id);
        if(login == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(login.getLoginZeit()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(login.getIpAdresse()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }
}
