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
    let accessGroup = "com.beizhu"
    
    var dataManager: KeychainWrapper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Keychain 使用封装"
        dataManager = KeychainWrapper.init(identifier: identifier, service: service, accessGroup: nil)
//        dataManager.resetKeychainItem()
    }

    @IBAction func saveAction(_ sender: Any) {
//        dataManager.setAccountAndPassword(account: accountField.text ?? <#default value#>, password: passwordField.text?.data(using: .utf8) ?? <#default value#>)
        dataManager.setAccountAndPassword(account: "bamboo", password: "888888".data(using: .utf8)!)
    }
    
    @IBAction func getAction(_ sender: Any) {
//        let accountAndPassword = dataManager.getAccountAndPassword()
//        accountLabel.text = accountAndPassword.account
//        passwordLabel.text = (accountAndPassword.password as? String)
//        passwordLabel.text = dataManager.getPassword(account: "bamboo")
//        print(dataManager.getAccountAndPassword())
        let result = dataManager.getAccountAndPassword()
        print(result)
        if let pass = result?.password {
            print(String(data: pass, encoding: .utf8))
        }
    }
    
}
