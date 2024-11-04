package de.sic.finco.fincowebapp;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@RestController
public class DownloadController {

    private final KategorieService photosService;

    public DownloadController(KategorieService photosService) {
        this.photosService = photosService;
    }

    @GetMapping("/download/{id}")
    //public ResponseEntity<byte[]> download(@PathVariable String id) {
    public ResponseEntity<byte[]> download(@PathVariable Integer id) {
        Kategorie photo = photosService.get(id);
        if(photo == null) throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        byte[] data = photo.getData();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.valueOf(photo.getContentType()));
        ContentDisposition build = ContentDisposition.builder("attachment").filename(photo.getFileName()).build();
        headers.setContentDisposition(build);
        return new ResponseEntity<>(data, headers, HttpStatus.OK);
    }
}
