package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UsersService {

    private final UsersRepository usersRepository;

    public UsersService(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    public Iterable<Users> get() {
        return usersRepository.findAll();
    }

    public Users get(String kdNr) {
        return usersRepository.findById(kdNr).orElse(null);
    }

    public void remove(String kdNr) {
        usersRepository.deleteById(kdNr);
    }

    public Users save(String fileName, String contentType, byte[] data) {
        Users users = new Users();
        users.setVorname(contentType);
        users.setKdNr(String.valueOf(UUID.randomUUID().toString()));
        usersRepository.save(users);
        return users;
    }
}
