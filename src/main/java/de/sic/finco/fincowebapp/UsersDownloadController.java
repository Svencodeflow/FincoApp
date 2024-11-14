package de.sic.finco.fincowebapp;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class UsersDownloadController {

    private final UsersService usersService;

    public UsersDownloadController(UsersService usersService) {
        this.usersService = usersService;
    }

    @GetMapping("/download/{kdNr}")
    public ResponseEntity<byte[]> download(@PathVariable String kdNr) {
        Users users = usersService.get(kdNr);
        if(users == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(users.getVorname()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(users.getNachname()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }
}
