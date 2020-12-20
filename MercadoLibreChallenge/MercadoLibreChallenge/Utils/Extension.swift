//
//  Extension.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

extension Double {
    
    var currencyFormatted: String {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = "."
        formatter.currencySymbol = "$"
        
        formatter.usesSignificantDigits = true
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        return "\(formatter.string(from: NSNumber(value: self))!)"
    }
}


//MARK: - Codenable
extension JSONDecoder{
    
    class func decoderJson<T>(type: T.Type, data: Data) -> T? where  T:Codable{
        let decoder = JSONDecoder()
        let json = try? decoder.decode(type, from: data)
        return json
    }
}

extension Decodable{
    static func decode(data:Data?) -> Self?{
        let decoder = JSONDecoder()
        if data == nil {
            return nil
        }
        return try? decoder.decode(Self.self, from: data!)
    }
}

extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) -> Data? {
        return try? encoder.encode(self)
    }
}
