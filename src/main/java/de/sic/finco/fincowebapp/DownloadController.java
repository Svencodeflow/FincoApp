package de.sic.finco.fincowebapp;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class DownloadController {

    private final MainService umsatzService;

    public DownloadController(MainService umsatzService) {
        this.umsatzService = umsatzService;
    }

    @GetMapping("/download/{umsatzID}")
    public ResponseEntity<byte[]> download(@PathVariable Integer id) {
        Umsatz umsatz = (Umsatz) umsatzService.get();
        if(umsatz == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(umsatz.getArt()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(umsatz.getBeschreibung()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }
}