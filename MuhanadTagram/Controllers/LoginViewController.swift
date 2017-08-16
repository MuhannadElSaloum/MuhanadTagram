//
//  LoginViewController.swift
//  MuhanadTagram
//
//  Created by Muhannad El Salloum  on 8/14/17.
//  Copyright © 2017 Muhannad El Salloum . All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase


typealias FIRUser = FirebaseAuth.User
class LoginViewController: UIViewController{
    
    
    @IBOutlet weak var LoginButton: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        // 1
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        // 2
        authUI.delegate = self
        
        // 3
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
   
    
}
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        // 1
        guard let user = user
            else { return }
        
        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)
        
        // 3
        userRef.observeSingleEvent(of: .value, with: { (snapshot) in
            // 4 retrieve user data from snapshot
        })
        print("handle user signup / login")
    }}



