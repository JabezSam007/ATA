package wipro.jabez.ATA.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import wipro.jabez.ATA.model.Booking;
import wipro.jabez.ATA.model.Passenger;
import wipro.jabez.ATA.model.User;
import wipro.jabez.ATA.model.Vehicle;
import wipro.jabez.ATA.service.PassengerService;
import wipro.jabez.ATA.service.VehicleService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("passenger")
public class PassengerController{
    @Autowired
    private PassengerService passengerService;
    @Autowired
    private VehicleService vehicleService;

    @PostMapping("create")
    public Passenger create(@ModelAttribute("passenger") Passenger passenger){
        return passengerService.create(passenger);
    }

    @GetMapping("{id}")
    public Passenger getPassenger(@PathVariable Integer id) throws Exception {
        return passengerService.getPassenger(id);
    }

    @GetMapping("/vehicle/all")
    public ModelAndView getAllVehicles() {
            List<Vehicle> vehicles = vehicleService.getAllVehicles();
            return new ModelAndView("view-vehicles", "vehicleList", vehicles);
    }

    @GetMapping(value = "/book/vehicle")
    public ModelAndView bookVehicle(@RequestParam Integer vehicleId) {
        Vehicle vehicle = vehicleService.getVehicle(vehicleId);
        Passenger passenger = new Passenger();
        passenger.setTravellingDate(vehicle.getTravelDate());
        Booking booking = new Booking();
        booking.setVehicle(vehicle);
        passenger.setBooking(booking);
        return new ModelAndView("bookVehicle", "passenger", passenger);
    }
    
    @GetMapping("status")
    public ModelAndView getBookings(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(Objects.nonNull(user)){
            List<Booking> bookings = vehicleService.getAllVehiclesBookings(session);
            return new ModelAndView("view-booking", "bookings", bookings);
        } else {
            return new ModelAndView("login");
        }

    }

    @GetMapping(value = "/cancel/booking")
    public String cancelPassengerBooking(@RequestParam Integer bookingId){
        passengerService.cancelBooking(bookingId);
        return "redirect:/passenger/status";
    }

    @GetMapping("vehicle/{plateNo}")
    public List<Passenger> getPassengers(@PathVariable String plateNo){
        return passengerService.getPassengers(plateNo);
    }

    @GetMapping(value = "vehicle")
    public ModelAndView getPassengers() {
        List<Passenger> passengers = passengerService.getAllPassengers();
        return new ModelAndView("view-passengers", "passengers", passengers);
    }

    @GetMapping("/booking/receipt")
    public void generateReceipt(@RequestParam Integer bookingId, HttpServletResponse response) throws IOException, IOException {
        passengerService.generateBookingReceipt(bookingId,response);
    }

}
