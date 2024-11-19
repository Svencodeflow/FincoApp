package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class MainService {
    private final MainRepository umsatzRepository;

    public MainService(MainRepository umsatzRepository) {
        this.umsatzRepository = umsatzRepository;
    }

    public Iterable<Umsatz> get() {
        return umsatzRepository.findAll();
    }

    public Umsatz get(Integer id) {
        return umsatzRepository.findById(id).orElse(null);
    }

    public void remove(Integer id) {
        umsatzRepository.deleteById(id);
    }

    public Umsatz save(Double betrag, String kategorieID, byte[] data) {
        Umsatz umsatz = new Umsatz();
        umsatz.setBetrag(betrag);
        umsatz.setUmsatzID(Integer.parseInt(UUID.randomUUID().toString()));
        umsatzRepository.save(umsatz);
        return umsatz;
    }
}
