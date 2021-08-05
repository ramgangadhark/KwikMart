//
//  Items.swift
//  KwikMart-Project
//
//  Created by Ram on 15/03/21.
//

import Foundation
struct Items:Codable {
    let itemName:String
    let itemImage:String
    let itemDescription:String
    let itemSeller:String
    let itemPrice:Int
    let itemDetails:itemDetails
}

struct itemDetails:Codable {
    let Offer:String
    let Weight:String
    let detail3:String
}
