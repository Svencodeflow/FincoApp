package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
    public Iterable<Photo> get() {
        //return db.values();
        return photosRepository.findAll();
    }

    //public Photo get(String id) {
    public Photo get(Integer id) {
        //return db.get(id);
        return photosRepository.findById(id).orElse(null);
    }

    //public Photo remove(String id) {
    public void remove(Integer id) {
        //return db.remove(id);
        photosRepository.deleteById(id);
    }

    public Photo save(String fileName, String contentType, byte[] data) {
        Photo photo = new Photo();
        photo.setContentType(contentType);
        //photo.setId(UUID.randomUUID().toString());
        photo.setFileName(fileName);
        photo.setData(data);

        //db.put(photo.getId(), photo);
        photosRepository.save(photo);

        return photo;
    }
}
