//
//  LoginPageViewController.swift
//  school project
//
//  Created by Максим Гусев on 12/03/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var UserEmailTextField: UITextField!
    @IBOutlet weak var UserPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func EnterButton(_ sender: AnyObject) {
        let UserEmail =  UserEmailTextField.text;
        let UserPassword = UserPasswordTextField.text;
        if (UserEmail!.isEmpty || UserPassword!.isEmpty){
            displayMyAlertMessage(userMessage: "Enter all fields!");
            return;
        }
        
        self.performSegue(withIdentifier: "loginToHome", sender: self)
    }
    
    func displayMyAlertMessage(userMessage:String) {
        var myAlert = UIAlertController(title: "Warning", message: userMessage, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert,animated: true,completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
