package com.platzi.market.domain.services;

import com.platzi.market.domain.Purchase;
import com.platzi.market.domain.repository.PurchaseRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PurchaseService {

    private final PurchaseRepository purchaseRepository;

    public PurchaseService(PurchaseRepository purchaseRepository) {
        this.purchaseRepository = purchaseRepository;
    }

    public List<Purchase> getAll(){
        return this.purchaseRepository.getAll();
    }

    public Optional<List<Purchase>> getByClient(String clientId){
        return this.purchaseRepository.getByClient(clientId);
    }

    public Purchase save(Purchase purchase){
        return this.purchaseRepository.save(purchase);
    }
}
