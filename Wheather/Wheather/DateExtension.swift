//
//  File.swift
//  Wheather
//
//  Created by admin on 19/06/2019.
//  Copyright © 2019 11Street. All rights reserved.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateformatter.string(from: self)
    }
}
