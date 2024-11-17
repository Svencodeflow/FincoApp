package de.sic.finco.fincowebapp;

import de.smartindustrycampus.java.examples.Photo_App_Tutorial.Photo;
import org.springframework.data.repository.CrudRepository;

public interface PhotosRepository extends CrudRepository<Photo, Integer> {

}
