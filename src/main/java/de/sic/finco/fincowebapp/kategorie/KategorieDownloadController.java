package de.sic.finco.fincowebapp.kategorie;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class KategorieDownloadController {

    private final KategorieService kategorieService;

    public KategorieDownloadController(KategorieService kategorieService) {
        this.kategorieService = kategorieService;
    }

    @GetMapping("/download/{kategorieID}")
    public ResponseEntity<byte[]> download(@PathVariable Integer id) {
        Kategorie kategorie = kategorieService.get(id);
        if(kategorie == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(kategorie.getName()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(kategorie.getTyp()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }
}
