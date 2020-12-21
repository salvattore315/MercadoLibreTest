//
//  ItemDescription.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

struct ItemDescription: Codable {
    var text: String?
    var plain_text: String?
    var last_updated: String?
    var date_created: String?
    var snapshot: Snapshot?
}

struct Snapshot: Codable {
    var url: String?
    var width: String?
    var height: String?
    var status: String?
}
