//
//  Paging.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

struct Paging: Codable {
    var total: Int?
    var offset: Int?
    var limit: Int?
    var primary_results: Int?
}
