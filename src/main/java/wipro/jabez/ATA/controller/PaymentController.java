package wipro.jabez.ATA.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wipro.jabez.ATA.model.Passenger;
import wipro.jabez.ATA.service.PaymentService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("payment")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @PostMapping("/pay")
    public ModelAndView processPayment(@ModelAttribute("passenger") Passenger passenger, HttpSession session) {
        Integer bookingId = paymentService.validatePayment(passenger,session);
        ModelAndView modelAndView = new ModelAndView("paymentSuccess");
        modelAndView.addObject("bookingId", bookingId);
        return modelAndView;
    }
    
}
