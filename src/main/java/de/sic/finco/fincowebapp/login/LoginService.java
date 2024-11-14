package de.sic.finco.fincowebapp.login;

import de.sic.finco.fincowebapp.kategorie.Kategorie;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class LoginService {

    private final LoginRepository loginRepository;

    public LoginService(LoginRepository loginRepository) {
        this.loginRepository = loginRepository;
    }

    public Iterable<Login> get() {
        return loginRepository.findAll();
    }

    public Login get(Integer id) {
        return loginRepository.findById(id).orElse(null);
    }

    public void remove(Integer id) {
        loginRepository.deleteById(id);
    }

    public Login save(String fileName, String contentType, byte[] data) {
        Login login = new Login();
        login.setLoginZeit(contentType);
        login.setIpAdresse(String.valueOf(UUID.randomUUID().toString()));
        loginRepository.save(login);
        return login;
    }
}
