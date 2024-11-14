package de.sic.finco.fincowebapp.users;

import de.sic.finco.fincowebapp.kategorie.Kategorie;
import org.springframework.data.repository.CrudRepository;

public interface UsersRepository extends CrudRepository<Kategorie, Integer> {

}
