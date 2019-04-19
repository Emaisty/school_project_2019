//
//  SettingsViewController.swift
//  school project
//
//  Created by Максим Гусев on 19/04/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func PressButt(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "IsAuth")
        UserDefaults.standard.synchronize()
    }
    
}
