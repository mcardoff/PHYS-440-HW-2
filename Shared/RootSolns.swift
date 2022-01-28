//
//  RootSolns.swift
//  HW 2
//
//  Created by Michael Cardiff on 1/28/22.
//

import SwiftUI

class Quadratic {
    var a: Double
    var b: Double
    var c: Double
    
    init () {
        self.a = 1.0 // only necessarily non-zero
        self.b = 0.0
        self.c = 0.0
    }
    
    init (a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
}
