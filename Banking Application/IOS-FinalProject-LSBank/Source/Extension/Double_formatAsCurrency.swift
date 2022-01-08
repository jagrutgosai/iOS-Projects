//
//  String_formatAsCurrency.swift
//  IOS-FinalProject-LSBank
//
//  Created by Daniel Carvalho on 18/11/21.
//

import Foundation

extension Double {
    
    func formatAsCurrency ( usersGroupingSeparator : Bool = true) -> String {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = usersGroupingSeparator
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2

        return numberFormatter.string(for: self)!
        
    }

    
}
