//
//  ItemSelected.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

struct ItemSelected: Codable {
    var id: String?
    var site_id: String?
    var title: String?
    var subtitle: String?
    var seller_id: Int?
    var category_id: String?
    var official_store_id: Int?
    var price: Double?
    var base_price: Double?
    var original_price: Double?
    var currency_id: String?
    var initial_quantity: Int?
    var available_quantity: Int?
    var sold_quantity: Int?
    var buying_mode: String?
    var listing_type_id: String?
    var start_time: String?
    var stop_time: String?
    var condition: String?
    var permalink: String?
    var thumbnail_id: String?
    var thumbnail: String?
    var secure_thumbnail: String?
    var pictures: [Pictures]?
    var video_id: String?
    //var descriptions: [Descriptions]?
    var accepts_mercadopago: Bool?
    var non_mercado_pago_payment_methods: [String]?
    var international_delivery_mode: String?
    var catalog_product_id: String?
    var tags: [String]?
    var catalog_listing: Bool?
}

struct Pictures: Codable {
    var id: String?
    var url: String?
    var secure_url: String?
    var size: String?
    var max_size: String?
    var quality: String?
}

struct Descriptions: Codable {
    var id: String?
}
