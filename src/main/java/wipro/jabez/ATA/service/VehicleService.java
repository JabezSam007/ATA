package wipro.jabez.ATA.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wipro.jabez.ATA.exception.ResourceNotFound;
import wipro.jabez.ATA.model.Booking;
import wipro.jabez.ATA.model.User;
import wipro.jabez.ATA.model.Vehicle;
import wipro.jabez.ATA.repository.BookingRepository;
import wipro.jabez.ATA.repository.PassengerRepository;
import wipro.jabez.ATA.repository.VehicleRepository;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class VehicleService {

    @Autowired
    private VehicleRepository vehicleRepository;

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private PassengerRepository passengerRepository;

    @Autowired
    public VehicleService(VehicleRepository vehicleRepository) {
        this.vehicleRepository = vehicleRepository;
    }

    private boolean isVehicleExists(String plateNo, String travelDate) {
        Vehicle existingVehicle = vehicleRepository.findVehicleByPlateNoEquals(plateNo);
        if(Objects.nonNull(existingVehicle)
                && StringUtils.equals(plateNo,existingVehicle.getPlateNo())
                && StringUtils.equals(travelDate,existingVehicle.getTravelDate())){
            return true;
        }
        return false;
    }

    public Vehicle getVehicle(Integer vehicleId) {
        Vehicle vehicle = vehicleRepository.findById(vehicleId).orElseThrow(() -> new ResourceNotFound("Vehicle not found with id: " + vehicleId));
        return vehicle;
    }

    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    public List<Booking> getAllVehiclesBookings(HttpSession session) {
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        Optional<List<Booking>> bookingOptional = bookingRepository.findByBookedBy(username);
        List<Booking> bookings = null;
        if (bookingOptional.isPresent()) {
            bookings = bookingOptional.get();
            bookings.forEach(
                    booking -> passengerRepository.findPassengerByBookingIdEquals(booking.getId())
                            .ifPresent(passenger -> booking.setPassenger(passenger.getName()))
            );
        }
        return bookings;
    }
}
