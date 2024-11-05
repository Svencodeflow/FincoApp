package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class KategorieService {

    private final KategorieRepository kategorieRepository;

    public KategorieService(KategorieRepository photosRepository) {
        this.kategorieRepository = photosRepository;
    }

    //public Collection<Photo> get() {
    public Iterable<Kategorie> get() {
        //return db.values();
        return kategorieRepository.findAll();
    }

    //public Photo get(String id) {
    public Kategorie get(Integer id) {
        //return db.get(id);
        return kategorieRepository.findById(id).orElse(null);
    }

    //public Photo remove(String id) {
    public void remove(Integer id) {
        //return db.remove(id);
        kategorieRepository.deleteById(id);
    }

    public Kategorie save(String fileName, String contentType, byte[] data) {
        Kategorie kategorie = new Kategorie();
        kategorie.setName(contentType);
        kategorie.setKategorieID(Integer.parseInt(UUID.randomUUID().toString()));

        //db.put(photo.getId(), photo);
        kategorieRepository.save(kategorie);

        return kategorie;
    }
}
