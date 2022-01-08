//
//  Date_toString.swift
//  IOS-FinalProject-LSBank
//
//  Created by Daniel Carvalho on 2021-11-22.
//

import Foundation

extension Date {
    
    
    func toString( dateFormat : String = "yyyy-MM-dd HH:mm:ss") -> String? {
               
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = dateFormat
        
        return dateFormater.string(from: self)
        
    }
    
}
