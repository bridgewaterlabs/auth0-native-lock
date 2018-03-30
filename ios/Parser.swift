//
//  Parser.swift
//

import Foundation

class Parser {

    static func toDictionary<T: Encodable>(object: T) -> [String: Any]? {
        do {
            let data = try JSONEncoder().encode(object)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]

            return dictionary
        } catch {
            debugPrint("### Error serializing JSON: \(error)")
        }

        return nil
    }
}
