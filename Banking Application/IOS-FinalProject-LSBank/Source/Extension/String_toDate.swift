//
//  String_toDate.swift
//  IOS-FinalProject-LSBank
//
//  Created by Daniel Carvalho on 2021-11-22.
//

import Foundation

extension String {
    
    func toDate() -> Date? {
        
        let dt = self.prefix(10)
        let hr = self.dropFirst(11).prefix(8)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.locale = Locale.current
        
        return dateFormatter.date(from: "\(String(dt)) \(String(hr))")
        
    }
    
    
}
