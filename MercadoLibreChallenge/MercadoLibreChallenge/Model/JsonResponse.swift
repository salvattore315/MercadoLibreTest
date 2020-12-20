//
//  JsonResponse.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 20/12/20.
//

import Foundation

//MARK: - Principal Struct

struct jsonResponse<T: Codable>: Codable {
    var site_id: String?
    var query: String?
    var paging: Paging?
    var results: T?
}
