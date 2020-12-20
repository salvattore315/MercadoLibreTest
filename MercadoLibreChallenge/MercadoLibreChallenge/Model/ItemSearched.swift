//
//  Items.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

struct ItemSearched: Codable {
    var id: String?
    var site_id: String?
    var title: String?
    var seller: Seller?
    var price: Double?
    var currency_id: String?
    var available_quantity: Int?
    var sold_quantity: Int?
    var buying_mode: String?
    var listing_type_id: String?
    var stop_time: String?
    var condition: String?
    var permalink: String?
    var thumbnail: String?
    var accepts_mercadopago: Bool?
    var installments: Installments?
    var address: Address?
    var shipping: Shipping?
    var seller_address: SellerAddress?
    //var attributes: [Attribute?]
    var original_price: Double?
    var category_id: String?
    var official_store_id: Int?
    var catalog_product_id: String?
    var tags: [String]?
    var catalog_listing: Bool?
}

struct Seller: Codable {
    var id: Int?
    var power_seller_status: String?
    var car_dealer: Bool?
    var real_estate_agency: Bool?
    var tags: [String]?
}

struct Installments: Codable {
    var quantity: Int?
    var amount: Double?
    var rate: Double?
    var currency_id: String?
}

struct Address: Codable {
    var state_id: String?
    var state_name: String?
    var city_id: String?
    var city_name: String?
}

struct Shipping: Codable {
    var free_shipping: Bool?
    var mode: String?
    var logistic_type: String?
    var store_pick_up: Bool?
}

struct SellerAddress: Codable {
    var id: String?
    var comment: String?
    var address_line: String?
    var zip_code: String?
    var country: idName?
    var state: idName?
    var city: idName?
    var latitude: String?
    var longitude: String?
}

struct idName: Codable {
    var id: String?
    var name: String?
}

struct Attribute: Codable {
    var name: String?
    var value_id: String?
    var value_name: String?
    var value_struct: String?
    var attribute_group_id: String?
    var attribute_group_name: String?
    var source: Int?
    var id: String?
    var values: [Values?]
}

struct Values: Codable {
    var source: Int?
    var id: String?
    var name: String?
}
