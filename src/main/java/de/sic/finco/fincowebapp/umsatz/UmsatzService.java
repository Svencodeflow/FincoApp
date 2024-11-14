package de.sic.finco.fincowebapp.umsatz;

import de.sic.finco.fincowebapp.kategorie.Kategorie;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UmsatzService {

    private final UmsatzRepository kategorieRepository;

    public UmsatzService(UmsatzRepository kategorieRepository) {
        this.kategorieRepository = kategorieRepository;
    }

    public Iterable<Kategorie> get() {
        return kategorieRepository.findAll();
    }

    public Kategorie get(Integer id) {
        return kategorieRepository.findById(id).orElse(null);
    }

    public void remove(Integer id) {
        kategorieRepository.deleteById(id);
    }

    public Kategorie save(String fileName, String contentType, byte[] data) {
        Kategorie kategorie = new Kategorie();
        kategorie.setName(contentType);
        kategorie.setKategorieID(Integer.parseInt(UUID.randomUUID().toString()));
        kategorieRepository.save(kategorie);
        return kategorie;
    }
}
