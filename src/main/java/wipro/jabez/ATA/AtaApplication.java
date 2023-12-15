package wipro.jabez.ATA;

import org.springframework.boot.SpringApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import wipro.jabez.ATA.model.Card;
import wipro.jabez.ATA.service.CardsService;

import java.util.ArrayList;

@SpringBootApplication
public class AtaApplication {

    public static void main(String[] args) {
        SpringApplication.run(AtaApplication.class, args);
    }

}
