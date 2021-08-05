//
//  DataManager.swift
//  KwikMart-Project
//
//  Created by Ram on 15/03/21.
//

import Foundation
import UIKit
class DataManager: NSObject {
    static var shared = DataManager()
    var itemsList = [Items]()
    var usersList = [users]()
    private override init() {
        super.init()
        fetchUserData(fileName: "Users")
        fetchItemsData(fileName: "Items")
    }
    
    
    func fetchItemsData(fileName:String)
    {
        let itemsData = readLocalFile(forName: fileName)
        do{
            let jsonData = try JSONDecoder().decode([Items].self, from: itemsData!)
            itemsList = jsonData
        }catch{
            print("Error\(error.localizedDescription)")
        }
    }
    
    func fetchUserData(fileName:String)
    {
        let usersData = readLocalFile(forName: "Users")
        do{
            let jsonData = try JSONDecoder().decode([users].self, from: usersData!)
            usersList = jsonData
        }catch{
            print("Error    :    \(error.localizedDescription)")
        }
    }
    
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }

        return nil
    }
}
