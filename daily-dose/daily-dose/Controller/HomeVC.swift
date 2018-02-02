//
//  ViewController.swift
//  daily-dose
//
//  Created by Ильин Роман on 02.02.2018.
//  Copyright © 2018 Romax. All rights reserved.
//

import UIKit
import GoogleMobileAds

class HomeVC: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var removeAdsBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAds()
    }
    
    func setUpAds() {
        if UserDefaults.standard.bool(forKey: PurchaseManager.instance.IAP_REMOVE_ADS) {
            removeAdsBtn.removeFromSuperview()
            bannerView.removeFromSuperview()
        } else {
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
        }
    }
    
    @IBAction func restoreBtnPressed(_ sender: Any) {
        PurchaseManager.instance.restorePurchases { (success) in
            if success {
                self.setUpAds()
            }
        }
    }
    

    @IBAction func removeAdsPressed(_ sender: Any) {
        // show loading spinner Activity indicator
        PurchaseManager.instance.purchaseRemoveAds { (success) in
            // dismiss the spinner
            if success {
                self.bannerView.removeFromSuperview()
                self.removeAdsBtn.removeFromSuperview()
            } else {
                // show message to the user
            }
        }
    }
    


}

