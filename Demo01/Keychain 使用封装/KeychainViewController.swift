//
//  KeychainViewController.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/18.
//

import UIKit

class KeychainViewController: UIViewController {

    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    let identifier = "item01"
    let service = "com.beizhu.demo01"
    let accessGroup: String? = nil
    
    var keychain: Keychain!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Keychain 使用封装"
        keychain = Keychain.init(identifier: identifier, service: service, accessGroup: nil)
    }

    @IBAction func saveAction(_ sender: Any) {
        guard let account = accountField.text,
              account.count > 0,
              let password = passwordField.text,
              password.count > 0
        else { return }
        let success = keychain.setAccountAndPassword(account: account, password: password.data(using: .utf8)!)
        if success {
            print("set successful")
        } else {
            print("set failed")
        }
    }
    
    @IBAction func getAction(_ sender: Any) {
        if let result = keychain.getAccountAndPassword() {
            if let account = result.account,
               let password = result.password {
                accountLabel.text = account
                passwordLabel.text = String(data: password, encoding: .utf8)!
                return
            }
        }
        accountLabel.text = ""
        passwordLabel.text = ""
    }
    
    @IBAction func clearDataAction(_ sender: Any) {
        let success = keychain.reset()
        if success {
            print("reset successful")
        } else {
            print("reset failed")
        }
    }
    
}
