//
//  ViewController.swift
//  ByteCoin
//
//  Created by Mohammed Sadiq on 11/04/20.
//  Copyright © 2020 Mohammed Sadiq. All rights reserved.
//

import UIKit

class ByteCoinViewController: UIViewController {
    @IBOutlet weak var byteCoinPriceStack: UIStackView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var byteCoinPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        byteCoinPriceLabel.text = "20.0"
    }


}

