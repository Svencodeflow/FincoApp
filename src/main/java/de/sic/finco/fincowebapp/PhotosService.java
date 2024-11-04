package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

@Service
public class PhotosService {
    /*private Map<String, Photo> db = new HashMap<String, Photo>() {{
        this.put("1", new Photo("1", "test.jpg"));
    }};*/

    private final PhotosRepository photosRepository;

    public PhotosService(PhotosRepository photosRepository) {
        this.photosRepository = photosRepository;
    }

    //public Collection<Photo> get() {
    public Iterable<Kategorie> get() {
        //return db.values();
        return photosRepository.findAll();
    }

    //public Photo get(String id) {
    public Kategorie get(Integer id) {
        //return db.get(id);
        return photosRepository.findById(id).orElse(null);
    }

    //public Photo remove(String id) {
    public void remove(Integer id) {
        //return db.remove(id);
        photosRepository.deleteById(id);
    }

    public Kategorie save(String fileName, String contentType, byte[] data) {
        Kategorie photo = new Kategorie();
        photo.setContentType(contentType);
        //photo.setId(UUID.randomUUID().toString());
        photo.setFileName(fileName);
        photo.setData(data);

        //db.put(photo.getId(), photo);
        photosRepository.save(photo);

        return photo;
    }
}
