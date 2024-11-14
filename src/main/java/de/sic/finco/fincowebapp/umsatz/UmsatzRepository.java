package de.sic.finco.fincowebapp.umsatz;

import de.sic.finco.fincowebapp.kategorie.Kategorie;
import org.springframework.data.repository.CrudRepository;

public interface UmsatzRepository extends CrudRepository<Kategorie, Integer> {

}
