package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

@Service
public class KategorieService {
    /*private Map<String, Photo> db = new HashMap<String, Photo>() {{
        this.put("1", new Photo("1", "test.jpg"));
    }};*/

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
        Kategorie photo = new Kategorie();
        photo.setName(contentType);
        //photo.setId(UUID.randomUUID().toString());
        photo.setTyp(fileName);
        photo.setData(data);

        //db.put(photo.getId(), photo);
        kategorieRepository.save(photo);

        return photo;
    }
}
