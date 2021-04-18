//
//  KeychainWrapper.swift
//  Demo01
//
//  Created by 姚旭 on 2021/4/18.
//

import UIKit

class Keychain: NSObject {
    
    // MARK: - lief circle
    // MARK: -
    
    ///
    /// 通常 service 使用 bundle identifier 来表明一个 App 在 keychain 唯一标识
    /// 但是，一个 App 又可能有多个数据存储在 keychain 中，因此需要 identifier 来唯一表明一个 item
    /// identifier 和 service 可以认为是主键
    /// accessGroup 使用要注意和开发者账号前缀有关，要使用全称
    ///
    
    private let identifier: String
    private let service: String
    private let accessGroup: String?
    
    private func query() -> [String: Any] {
        var query = [String: Any]()
        query[kSecClass as String] = kSecClassGenericPassword as String
        query[kSecAttrGeneric as String] = identifier
        query[kSecAttrService as String] = service
        #if targetEnvironment(simulator)
        #else
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup
        }
        #endif
        query[kSecAttrAccessible as String] = kSecAttrAccessibleWhenUnlocked as String
        return query
    }
    
    init(identifier: String, service: String, accessGroup: String?) {
        self.identifier = identifier
        self.service = service
        self.accessGroup = accessGroup
        super.init()
    }
    
    // MARK: - public method
    // MARK: -
    
    func getAccountAndPassword() -> (account: String?, password: Data?)? {
        var query = self.query()
        query[kSecMatchLimit as String] = kSecMatchLimitOne as String
        query[kSecReturnData as String] = true
        query[kSecReturnAttributes as String] = true
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        if status == errSecSuccess {
            if let dic = result as? [String: Any] {
                let account = dic[kSecAttrAccount as String] as? String
                let password = dic[kSecValueData as String] as? Data
                return (account, password)
            }
        }
        return nil
    }

    func setAccountAndPassword(account: String, password: Data) -> Bool {
        var query = self.query()
        query[kSecMatchLimit as String] = kSecMatchLimitOne as String
        query[kSecReturnAttributes as String] = true
        var result: AnyObject?
        if SecItemCopyMatching(query as CFDictionary, &result) == errSecSuccess && (result as? [String: Any]) != nil {
            var updateItem = result as! [String: Any]
            updateItem[kSecClass as String] = kSecClassGenericPassword as String
            let attributes: [String : Any] = [
                kSecAttrAccount as String: account,
                kSecValueData as String: password
            ]
            
            let status = SecItemUpdate(updateItem as CFDictionary, attributes as CFDictionary)
            return status == errSecSuccess
        } else {
            var query = self.query()
            query[kSecAttrAccount as String] = account
            query[kSecValueData as String] = password
            
            let status = SecItemAdd(query as CFDictionary, nil)
            return status == errSecSuccess
        }
    }
    
    func reset() -> Bool {
        let status = SecItemDelete(self.query() as CFDictionary)
        return status == errSecSuccess
    }
    
}
