//
//  Data.swift
//  RgbHex
//
//  Created by Артем on 17/03/2019.
//  Copyright © 2019 Gukov.space. All rights reserved.
//

import Foundation

struct Value {
var valueRedHex: Int?
var valueGreenHex: Int?
var valueBlueHex: Int?
var valueAlphaHex: Double?
    
    init(valueRedHex: Int? = nil,
         valueGreenHex: Int? = nil,
         valueBlueHex: Int? = nil,
         valueAlphaHex: Double? = nil) {
        
        self.valueRedHex = valueRedHex
        self.valueGreenHex = valueGreenHex
        self.valueBlueHex = valueBlueHex
        self.valueAlphaHex = valueAlphaHex
    }
}
