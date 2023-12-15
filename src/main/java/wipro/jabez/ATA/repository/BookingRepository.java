package wipro.jabez.ATA.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import wipro.jabez.ATA.model.Booking;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepository extends JpaRepository<Booking,Integer> {

    Optional<List<Booking>> findByBookedBy(String username);
}
