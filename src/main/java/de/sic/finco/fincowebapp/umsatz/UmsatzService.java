package de.sic.finco.fincowebapp.umsatz;

import de.sic.finco.fincowebapp.kategorie.Kategorie;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UmsatzService {

    private final UmsatzRepository umsatzRepository;

    public UmsatzService(UmsatzRepository umsatzRepository) {
        this.umsatzRepository = umsatzRepository;
    }

    public Iterable<Umsatz> get() {
        return umsatzRepository.findAll();
    }

    public Umsatz get(String kdNr) {
        return umsatzRepository.findById(Integer.valueOf(kdNr)).orElse(null);
    }

    public void remove(String kdNr) {
        umsatzRepository.deleteById(Integer.valueOf(kdNr));
    }

    public Umsatz save(String fileName, String beschreibung, byte[] data) {
        Umsatz umsatz = new Umsatz();
        umsatz.setBeschreibung(beschreibung);
        umsatz.setKdNr(String.valueOf(UUID.randomUUID().toString()));
        umsatzRepository.save(umsatz);
        return umsatz;
    }
}
