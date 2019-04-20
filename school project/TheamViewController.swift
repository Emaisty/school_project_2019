//
//  TheamViewController.swift
//  school project
//
//  Created by Максим Гусев on 20/04/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

class TheamViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dark_mode(_ sender: UISwitch) {
        if (sender.isOn == true) {
            print("LOL")
        } else {
            print("sad")
            
        }
    }
    

}
