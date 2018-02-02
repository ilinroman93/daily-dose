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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

