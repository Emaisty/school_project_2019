//
//  LoginPageViewController.swift
//  school project
//
//  Created by Максим Гусев on 15/02/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var emailusertextfield: UITextField!
    @IBOutlet weak var passwordusertextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginaction(_ sender: Any) {
        //here, must be auth
        if emailusertextfield.text == "max-gusev@mail.ru" && passwordusertextfield.text == "Samoloff123" || emailusertextfield.text == "1" && passwordusertextfield.text == "12"{ self.performSegue(withIdentifier: "loginToHome", sender: self)
        }else {
            let alertController = UIAlertController(title: "User Incorrect", message: "enter valid data", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }}/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

