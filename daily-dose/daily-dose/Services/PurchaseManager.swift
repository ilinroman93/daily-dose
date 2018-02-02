//
//  PurchaseManager.swift
//  daily-dose
//
//  Created by Ильин Роман on 02.02.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import Foundation
import StoreKit

class PurchaseManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    static let instance = PurchaseManager()
    
    let IAP_REMOVE_ADS = "com.devslopes.daily.dose.remove.ads"
    
    var productsRequest: SKProductsRequest!
    var products = [SKProduct]()
    
    func fetchProducts() {
        let productsIds = NSSet(object: IAP_REMOVE_ADS) as! Set<String>
        productsRequest = SKProductsRequest(productIdentifiers: productsIds)
        productsRequest.delegate = self
        productsRequest.start()
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count > 0 {
            products = response.products
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
    }
    
    
}
