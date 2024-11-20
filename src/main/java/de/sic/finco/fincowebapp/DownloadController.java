package de.sic.finco.fincowebapp;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class DownloadController {

    private final MainService kategorieService;
    private final MainService usersService;
    private final MainService umsatzService;
    private final MainService loginService;
    private final MainService limitsService;

    public DownloadController(MainService kategorieService, MainService usersService, MainService umsatzService, MainService loginService, MainService limitsService) {
        this.kategorieService = kategorieService;
        this.usersService = usersService;
        this.umsatzService = umsatzService;
        this.loginService = loginService;
        this.limitsService = limitsService;
    }

    @GetMapping("/download/{kategorieID}")
    public ResponseEntity<byte[]> downloadKategorie(@PathVariable Integer id) {
        Kategorie kategorie = (Kategorie) kategorieService.getKategorie();
        if(kategorie == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(kategorie.getTyp()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(kategorie.getName()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }

    @GetMapping("/download/{kdnr}")
    public ResponseEntity<byte[]> downloadUsers(@PathVariable String kdnr) {
        Users users = (Users) usersService.getUsers();
        if(users == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(users.getEmail()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(users.getUseriban()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }

    @GetMapping("/download/{umsatzID}")
    public ResponseEntity<byte[]> downloadUmsatz(@PathVariable Integer id) {
        Umsatz umsatz = (Umsatz) umsatzService.getUmsatz();
        if(umsatz == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(umsatz.getArt()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(umsatz.getBeschreibung()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }

    @GetMapping("/download/{loginID}")
    public ResponseEntity<byte[]> downloadLogin(@PathVariable Integer id) {
        Login login = (Login) loginService.getLogintest();
        if(login == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(login.getLoginzeit().toString()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(login.getIpadresse()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }

    @GetMapping("/download/{limitID}")
    public ResponseEntity<byte[]> downloadLimits(@PathVariable Integer id) {
        Limits limits = (Limits) limitsService.getLimits();
        if(limits == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(String.valueOf(limits.getLimitid())));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(String.valueOf(limits.getAusgabelimit())).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }
}