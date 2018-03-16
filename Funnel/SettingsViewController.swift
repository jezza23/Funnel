//
//  SettingsViewController.swift
//  Funnel
//
//  Created by Jeremy Irvine on 3/14/18.
//  Copyright © 2018 Bamboo Technologies. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var usr_img: UIImageView!
    @IBOutlet weak var usr_email: UILabel!
    @IBOutlet weak var usr_name: UILabel!
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var shouldLogout = false
    
    @IBAction func editPasswordPressed(_ sender: Any) {
    }
    @IBAction func editEmailPressed(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Edit Email", message: "Enter a new email", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }
        alert.addTextField { (textField) in
            textField.placeholder = "New Email"
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let password = alert?.textFields![0]
            let email = alert?.textFields![1]
            print("Password field: \(password?.text)")
            print("Email field: \(email?.text)")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func logoutBtnPressed(_ sender: Any) {
        let ud = UserDefaults.standard
        ud.removeObject(forKey: "login_key")
        ud.removeObject(forKey: "rss")
        ud.removeObject(forKey: "social_media")
        ud.removeObject(forKey: "setup_complete")
        ud.set(true, forKey: "should_logout")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tacBtnPressed(_ sender: Any) {
        // Terms and Conditions
    }
    @IBAction func privacyBtnPressed(_ sender: Any) {
        // Privacy Policy
    }
    @IBAction func legalBtnPressed(_ sender: Any) {
        // Legal Disclosures
    }
    @IBAction func supportBtnPressed(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        usr_img.layer.cornerRadius = 10
        shouldLogout = false
        
        usr_name.text = UserDefaults.standard.string(forKey: "login_username") ?? "John Doe"
        usr_email.text = UserDefaults.standard.string(forKey: "login_email") ?? "johndoe@gmail.com"
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
