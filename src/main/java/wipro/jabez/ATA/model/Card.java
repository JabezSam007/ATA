package wipro.jabez.ATA.model;

import lombok.Data;
import javax.persistence.*;

@Data
@Entity
@Table(name="cards")
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false)
    private Integer id;
    private Double amount;
    private String cardNumber;
    private String expiryDate;
    private String cvv;
    
    

    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public Card(Double amount, String cardNumber, String expiryDate, String cvv) {
        this.setAmount(amount);
        this.setCardNumber(cardNumber);
        this.setExpiryDate(expiryDate);
        this.setCvv(cvv);
    }

	public Card() {
		super();
	}
	
	
}
