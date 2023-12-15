package wipro.jabez.ATA.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import wipro.jabez.ATA.model.User;
import wipro.jabez.ATA.model.Vehicle;

@Repository
public interface VehicleRepository extends JpaRepository<Vehicle,Integer> {
    Vehicle findVehicleByPlateNoEquals(String plateNo);
}
