package de.sic.finco.fincowebapp;

import org.springframework.data.repository.CrudRepository;

public interface UmsatzRepository extends CrudRepository<Umsatz, Integer> {
    // Standard CRUD-Methoden sind bereits vorhanden
}