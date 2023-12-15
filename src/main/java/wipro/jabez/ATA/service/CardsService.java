package wipro.jabez.ATA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wipro.jabez.ATA.model.Card;
import wipro.jabez.ATA.repository.CardsRepository;

import java.util.List;

@Service
public class CardsService {
    @Autowired
    private CardsRepository cardsRepository;

    public void saveAllCards(List<Card> cardsList){
        cardsRepository.saveAll(cardsList);
    }

    public List<Card> getAllCards() {
        return cardsRepository.findAll();
    }

}
