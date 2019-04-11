//
//  LoginPageViewController.swift
//  school project
//
//  Created by Максим Гусев on 12/03/2019.
//  Copyright © 2019 Максим Гусев. All rights reserved.
//

import UIKit

struct UserData: Decodable {
    var token: String
    var pid: String
    var student_profile_id: String
    var bot_code: String
    var students: [Stundents]
    var invite_code: String
    var invitations: Int
    struct Stundents: Decodable {
        var student_profile_id: Int
        var name: String
        var `class`: String
    }
}



class LoginPageViewController: UIViewController {

    @IBOutlet weak var UserEmailTextField: UITextField!
    @IBOutlet weak var UserPasswordTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.setAnimationsEnabled(true)
        if (1 == 2){
            UIView.setAnimationsEnabled(false)
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func EnterButton(_ sender: AnyObject) {
        let UserEmail =  UserEmailTextField.text
        let UserPassword = UserPasswordTextField.text
        if (UserEmail!.isEmpty || UserPassword!.isEmpty){
            displayMyAlertMessage(userMessage: "Enter all fields!")
            return
        }
        login(login: UserEmail ?? "", password: UserPassword ?? "")
        
    }
    
    func login(login: String,password: String){
        let urllogpass = "https://api.julista.org/auth_user/?login=" + login + "&password=" + password
        let url = URL(string: urllogpass)!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            do{
            let Student = try JSONDecoder().decode(UserData.self, from: data)
                print(Student)
            } catch let error{
                print(error)
            }
        }
        task.resume()
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
