//
//  LoginViewController.swift
//  Donor
//
//  Created by Sergey Kravtsov on 12.04.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var sigUpButton: UIButton!
    
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookLoginButton.delegate = self
        
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: Segue.fromLoginToMap, sender: nil)
            }
        }
        
        loginButton.layer.cornerRadius = CGFloat(Radius.corner)
    }
    
    // MARK: - Actions
    
    @IBAction func LoginDidTouch(_ sender: UIButton) {
        FIRAuth.auth()!.signIn(withEmail: emailTextField.text!,
                               password: passwordTextField.text!)
    }
    
    @IBAction func singUpDidTouch(_ sender: UIButton) {
        
        let alert = UIAlertController(title: Constants.registration, message: "", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: Constants.save, style: .default) { action in
            
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            FIRAuth.auth()!.createUser(withEmail: emailField.text!, password: passwordField.text!) { user, error in
                // Success - send email/pass to firebase & segue to picker VC
                if error == nil {
                    FIRAuth.auth()!.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!)
                    self.performSegue(withIdentifier: Segue.toPickerGroupOfBlood, sender: self)
                // Alert if email not valid
                } else {
                    self.showAlert(title: ErrorIs.notValidEmail, message: Constants.enterEmailAgain)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: Constants.cancel, style: .default)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = Placeholder.email
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = Placeholder.password
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Extensions 

// MARK: - FBSDKLoginButtonDelegate
extension LoginViewController {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print (error!.localizedDescription)
            return
        }
        
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print (error ?? "")
                return
            }
            print ("User login with facebook")
        })
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        try! FIRAuth.auth()!.signOut()
        print ("User log out of facebook")
    }
}
