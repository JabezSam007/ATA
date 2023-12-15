package wipro.jabez.ATA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import wipro.jabez.ATA.model.User;
import wipro.jabez.ATA.repository.UserRepository;


@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    public void saveUser(User user) {
        if (isUserExists(user.getUsername())) {
            throw new IllegalArgumentException("Username already exists");
        }
        userRepository.save(user);
    }

    public boolean isUserExists(String username) {
        User existingUser = userRepository.findByUsername(username);
        return existingUser != null;
    }

    public void updateUser(User user) {
        User existingUser = userRepository.findByUsername(user.getUsername());
        boolean matches = user.getOldPassword().equals(existingUser.getPassword());
        if (matches){
            existingUser.setPassword(user.getPassword());
            userRepository.save(existingUser);
        } else {
            throw new IllegalArgumentException("User password did not matched.");
        }

    }
}
