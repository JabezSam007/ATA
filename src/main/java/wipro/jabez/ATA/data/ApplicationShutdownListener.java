package wipro.jabez.ATA.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextClosedEvent;
import org.springframework.stereotype.Component;

import wipro.jabez.ATA.repository.CardsRepository;

@Component
public class ApplicationShutdownListener implements ApplicationListener<ContextClosedEvent> {

    @Autowired
    private CardsRepository cardsRepository;

    @Override
    public void onApplicationEvent(ContextClosedEvent event) {
        cardsRepository.deleteAll();
    }
}
