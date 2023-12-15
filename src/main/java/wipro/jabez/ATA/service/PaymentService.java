package wipro.jabez.ATA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wipro.jabez.ATA.model.Card;
import wipro.jabez.ATA.model.Passenger;
import wipro.jabez.ATA.model.User;
import wipro.jabez.ATA.model.Vehicle;
import wipro.jabez.ATA.repository.CardsRepository;
import wipro.jabez.ATA.repository.VehicleRepository;

import javax.servlet.http.HttpSession;
import java.util.Optional;

@Service
public class PaymentService {
    @Autowired
    private PassengerService passengerService;

    @Autowired
    private VehicleRepository vehicleRepository;
    @Autowired
    private CardsRepository cardsRepository;
    public Integer validatePayment(Passenger passenger, HttpSession session) {
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();
        passenger.getBooking().setBookedBy(username);
        Card card = passenger.getCard();
        Optional<Card> cardOptional = cardsRepository.findCardByCardNumberAndCvvAndExpiryDate(card.getCardNumber(), card.getCvv(), card.getExpiryDate());
        if (cardOptional.isPresent()) {
            Card cardDb = cardOptional.get();
            if(card.getCardNumber().equals(cardDb.getCardNumber())
                && card.getCvv().equals(cardDb.getCvv())
                && card.getExpiryDate().equals(cardDb.getExpiryDate())) {
                Vehicle vehicle = vehicleRepository.findVehicleByPlateNoEquals(passenger.getBooking().getVehicle().getPlateNo());
                passenger.getBooking().setVehicle(vehicle);
                passenger.getBooking().setStatus("BOOKED");
                Passenger savedPassenger = passengerService.create(passenger);
                return savedPassenger.getBooking().getId();
            }
        } else {
            throw new IllegalArgumentException("Card is invalid.");
        }


        return null;
    }
}
