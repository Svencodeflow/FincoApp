package de.sic.finco.fincowebapp.umsatz;

import de.sic.finco.fincowebapp.kategorie.Kategorie;
import de.sic.finco.fincowebapp.kategorie.KategorieService;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class UmsatzDownloadController {

    private final UmsatzService umsatzService;

    public UmsatzDownloadController(UmsatzService umsatzService) {
        this.umsatzService = umsatzService;
    }

    @GetMapping("/download/{id}")
    public ResponseEntity<byte[]> download(@PathVariable Integer id) {
        Umsatz umsatz = umsatzService.get(id);
        if(umsatz == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(umsatz.getBeschreibung()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(umsatz.getArt()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }
}
