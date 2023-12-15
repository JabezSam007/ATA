package wipro.jabez.ATA.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import wipro.jabez.ATA.model.Passenger;

import java.util.List;
import java.util.Optional;

public interface PassengerRepository extends JpaRepository<Passenger,Integer> {


    Optional<Passenger> findPassengerByBookingIdEquals(Integer bookingId);
}
