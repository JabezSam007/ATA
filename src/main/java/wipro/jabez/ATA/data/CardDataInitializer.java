package wipro.jabez.ATA.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import wipro.jabez.ATA.model.Card;
import wipro.jabez.ATA.repository.CardsRepository;
import wipro.jabez.ATA.service.CardsService;

import java.util.List;
import java.util.ArrayList;

@Component
public class CardDataInitializer implements CommandLineRunner {

    @Autowired
    private CardsService cardsService;
    
    @Override
    public void run(String... args) {
        List<Card> cardList = new ArrayList<>();
        cardList.add(new Card(7655.0, "3742454554001261", "05/26", "123"));
        cardList.add(new Card(4377.0, "3782822463100052", "01/26", "353"));
        cardList.add(new Card(6557.0, "6250941006528599", "06/26", "573"));
        cardList.add(new Card(543.0,  "6011556448578945", "12/26", "133"));
        cardList.add(new Card(3232.0, "6011000991300009", "04/27", "563"));
        cardList.add(new Card(8989.0, "3566000020000410", "05/28", "565"));
        cardList.add(new Card(545.0,  "3530111333300000", "09/29", "122"));
        cardList.add(new Card(980.0,  "5425233430109903", "07/30", "453"));
        cardList.add(new Card(3658.0, "5425233430109903", "05/31", "676"));
        cardList.add(new Card(4343.0, "4263982640269299", "02/30", "323"));
        cardsService.saveAllCards(cardList);
    }
}
