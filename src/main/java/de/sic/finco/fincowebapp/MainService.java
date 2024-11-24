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

    public void removeKategorie(Integer id) {
        kategorieRepository.deleteById(id);
    }

    public Kategorie saveKategorie(Kategorie kategorie) {
        return kategorieRepository.save(kategorie);
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

    public Users saveUsers(Users users) {
        return usersRepository.save(users);
    }

    public Iterable<Umsatz> getUmsatz() {
        return umsatzRepository.findAll();
    }

    public Umsatz getUmsatzid(Integer id) {
        return umsatzRepository.findById(id).orElse(null);
    }

    public void removeUmsatz(Integer id) {
        umsatzRepository.deleteById(id);
    }

    public Umsatz saveUmsatz(Umsatz umsatz) {
        return umsatzRepository.save(umsatz);
    }

    public Iterable<Login> getLogintest() {
        return loginRepository.findAll();
    }

    public Login getLogintest(Integer id) {
        return loginRepository.findById(id).orElse(null);
    }

    public void removeLogintest(Integer id) {
        loginRepository.deleteById(id);
    }

    public Login saveLogintest(Login login) {
        return loginRepository.save(login);
    }

    public Iterable<Limits> getLimits() {
        return limitsRepository.findAll();
    }

    public Limits getLimitsid(Integer id) {
        return limitsRepository.findById(id).orElse(null);
    }

    public void removeLimit(Integer id) {
        limitsRepository.deleteById(id);
    }

    public Limits saveLimits(Limits limits) {
        return limitsRepository.save(limits);
    }
}