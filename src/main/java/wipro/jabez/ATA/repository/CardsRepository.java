package wipro.jabez.ATA.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import wipro.jabez.ATA.model.Card;

import java.util.Optional;

@Repository
public interface CardsRepository extends JpaRepository<Card,Integer> {
    Optional<Card> findCardByCardNumberAndCvvAndExpiryDate(String cardNumber,String cvv, String expiryDate);
}
