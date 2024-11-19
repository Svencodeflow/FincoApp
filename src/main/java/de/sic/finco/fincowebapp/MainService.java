package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class MainService {
    private final KategorieRepository kategorieRepository;
    private final UsersRepository usersRepository;
    private final UmsatzRepository umsatzRepository;
    private final LoginRepository loginRepository;
    private final LimitsRepository limitsRepository;

    public MainService(KategorieRepository kategorieRepository, UsersRepository usersRepository, UmsatzRepository umsatzRepository, LoginRepository loginRepository, LimitsRepository limitsRepository) {
        this.kategorieRepository = kategorieRepository;
        this.usersRepository = usersRepository;
        this.umsatzRepository = umsatzRepository;
        this.loginRepository = loginRepository;
        this.limitsRepository = limitsRepository;
    }

    public Iterable<Kategorie> getKategorie() {
        return kategorieRepository.findAll();
    }

    public Kategorie getKategorieid(Integer id) {
        return kategorieRepository.findById(id).orElse(null);
    }

    public void remove(Integer id) {
        kategorieRepository.deleteById(id);
    }

    public Kategorie save(Integer kategorieID, String name, byte[] data) {
        Kategorie kategorie = new Kategorie();
        kategorie.setName(name);
        kategorie.setKategorieid(Integer.parseInt(UUID.randomUUID().toString()));
        kategorieRepository.save(kategorie);
        return kategorie;
    }

    public Iterable<Users> getUsers() {
        return usersRepository.findAll();
    }

    public Users getKdnr(String kdnr) {
        return usersRepository.findById(kdnr).orElse(null);
    }

    public void removeUser(String kdnr) {
        usersRepository.deleteById(kdnr);
    }

    public Users save(String kdnr, String useriban, byte[] data) {
        Users users = new Users();
        users.setUseriban(useriban);
        users.setKdnr(String.valueOf(UUID.randomUUID().toString()));
        usersRepository.save(users);
        return users;
    }

    public Iterable<Umsatz> get() {
        return umsatzRepository.findAll();
    }

    public Umsatz getUmsatzid(Integer id) {
        return umsatzRepository.findById(id).orElse(null);
    }

    public void removeUmsatz(Integer id) {
        umsatzRepository.deleteById(id);
    }

    public Umsatz save(Double betrag, String kategorieID, byte[] data) {
        Umsatz umsatz = new Umsatz();
        umsatz.setBetrag(betrag);
        umsatz.setUmsatzid(Integer.parseInt(UUID.randomUUID().toString()));
        umsatzRepository.save(umsatz);
        return umsatz;
    }
}