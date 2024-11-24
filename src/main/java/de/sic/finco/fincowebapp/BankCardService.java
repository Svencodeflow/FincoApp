package de.sic.finco.fincowebapp;

import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class BankCardService {
    private List<BankCard> bankCards = new ArrayList<>();

    public void saveBankCard(BankCard bankCard) {
        bankCards.add(bankCard);
    }

    public List<BankCard> getAllBankCards() {
        return new ArrayList<>(bankCards);
    }
}
