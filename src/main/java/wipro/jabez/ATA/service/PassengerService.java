package wipro.jabez.ATA.service;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wipro.jabez.ATA.exception.ResourceNotFound;
import wipro.jabez.ATA.model.Booking;
import wipro.jabez.ATA.model.Passenger;
import wipro.jabez.ATA.model.Vehicle;
import wipro.jabez.ATA.repository.BookingRepository;
import wipro.jabez.ATA.repository.PassengerRepository;
import wipro.jabez.ATA.repository.VehicleRepository;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class PassengerService {

    @Autowired
    private PassengerRepository passengerRepository;
    @Autowired
    private VehicleRepository vehicleRepository;
    @Autowired
    private BookingRepository bookingRepository;

    public Passenger create(Passenger passenger) {
        String plateNo = passenger.getBooking().getVehicle().getPlateNo();
        Vehicle vehicle = vehicleRepository.findVehicleByPlateNoEquals(plateNo);
        passenger.getBooking().setVehicle(vehicle);
        Passenger savedPassenger = null;
        if(vehicle.getTravelDate().equals(passenger.getTravellingDate())){
            passenger.getBooking().setBookingDate(passenger.getTravellingDate());
            passenger.getBooking().setRoute(passenger.getRoute());
            if(Objects.nonNull(passenger.getPaidAmount()) && passenger.getPaidAmount().equals(vehicle.getPrice())){
                passenger.getBooking().setStatus("RESERVED");
                savedPassenger = passengerRepository.save(passenger);
            } else {
                throw new IllegalArgumentException("Amount not paid");
            }
        } else{
            throw new IllegalArgumentException("Vehicle not available for Date: "+passenger.getTravellingDate());
        }
        return savedPassenger;
    }

    public Passenger getPassenger(Integer passengerId) throws Exception {
        return passengerRepository.findById(passengerId).orElseThrow(() -> new ResourceNotFound("Passenger not found with id: " + passengerId));
    }

    public List<Passenger> getAllPassengers() {
        return passengerRepository.findAll();
    }

    public List<Passenger> getPassengers(String plateNo) {
        ArrayList<Passenger> passengers = new ArrayList<>();
        for (Passenger passenger : getAllPassengers()) {
            if(Objects.nonNull(passenger.getBooking())
                    && Objects.nonNull(passenger.getBooking().getVehicle())
                    && passenger.getBooking().getVehicle().getPlateNo().equals(plateNo)){
                passengers.add(passenger);
            }

        }
        return passengers;
    }

    public void cancelBooking(Integer bookingId) {
        bookingRepository.findById(bookingId).ifPresent(booking -> {
            booking.setStatus("CANCELLED");
            bookingRepository.save(booking);
        });
    }

    public void generateBookingReceipt(Integer bookingId, HttpServletResponse response) throws IOException {
        Optional<Booking> bookingOptional = bookingRepository.findById(bookingId);
        if (bookingOptional.isPresent()) {
            Booking booking = bookingOptional.get();

            PDDocument document = new PDDocument();
            PDPage page = new PDPage(PDRectangle.A4);
            document.addPage(page);

            PDPageContentStream contentStream = new PDPageContentStream(document, page);

            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 12);

            float y = page.getMediaBox().getHeight() - 50;

            contentStream.beginText();
            contentStream.newLineAtOffset(50, y);
            contentStream.showText("Booking ID: " + booking.getId());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Booking Date: " + booking.getBookingDate());
            contentStream.newLine();

            Optional<Passenger> passengerOptional = passengerRepository.findPassengerByBookingIdEquals(bookingId);
            if(passengerOptional.isPresent()){
                y -= 20;
                contentStream.newLineAtOffset(0, -20);
                contentStream.showText("Passenger Name: " + passengerOptional.get().getName());
                contentStream.newLine();
            }
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Travel Route: " + booking.getRoute());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Status: " + booking.getStatus());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Vehicle No: " + booking.getVehicle().getPlateNo());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Vehicle Type: " + booking.getVehicle().getType());
            contentStream.newLine();
            y -= 20;
            contentStream.newLineAtOffset(0, -20);
            contentStream.showText("Ticket Price: " + booking.getVehicle().getPrice());
            
            contentStream.endText();
            
            contentStream.close();

            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "inline; filename=booking_receipt.pdf");

            document.save(response.getOutputStream());

            document.close();
        }
    }

}
