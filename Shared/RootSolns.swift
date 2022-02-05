//
//  RootSolns.swift
//  HW 2
//
//  Created by Michael Cardiff on 1/28/22.
//

import SwiftUI

class Quadratic: NSObject, ObservableObject{
    var a: Double
    var b: Double
    var c: Double
    @Published var root1Text = ""
    @Published var root2Text = ""
    @Published var root3Text = ""
    @Published var root4Text = ""
    @Published var r1r3Err = ""
    @Published var r2r4Err = ""
    @Published var enableButton = true
    
    override init () {
        self.a = 1.0 // only necessarily non-zero
        self.b = 0.0
        self.c = 0.0
    }
    
    init (a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    func setvals(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
        
        self.updateRootTexts(
            rootSet1: self.calculateNormalRoot(),
            rootSet2: self.calculateWeirdRoot()
        )
        
        setButtonEnable(state: true)
    }
    
    /// calculateNormalRoot
    /// Find the root using the regular formula
    /// - Returns a 2-tuple containing the plus root in the first entry, and the minus in the second entry
    func calculateNormalRoot() -> (Double, Double) {
        //                        ________
        //                     | / 2
        //           - b  +/-  |/ b  - 4ac
        // x    = -------------------------
        //   1,2             2a
        
        let root1 = (-b + sqrt( pow(b,2) - 4 * a * c)) / (2.0 * a) // root corresponding to +
        let root2 = (-b - sqrt( pow(b,2) - 4 * a * c)) / (2.0 * a) // root corresponding to -
        
//        print(String(root1))
//        print(String(root2))
        
        return (root1, root2)
    }
    
    /// calculateWeirdRoot
    /// Find the root using the weird formula
    /// - Returns a 2-tuple containing the plus root in the first entry, and the minus in the second entry
    func calculateWeirdRoot() -> (Double, Double) {
        //                - 2c
        // x'   = ------------------------
        //  1,2                   ________
        //                    | / 2
        //            b  +/-  |/ b  - 4ac

        let root1 = (-2 * c) / (b + sqrt( pow(b,2) - 4 * a * c)) // root corresponding to +
        let root2 = (-2 * c) / (b - sqrt( pow(b,2) - 4 * a * c)) // root corresponding to -
        
        return (root1, root2)
    }
    
    func updateRootTexts(rootSet1: (Double, Double), rootSet2: (Double, Double)) {
        root1Text = String(format: "%7.5e", rootSet1.0)
        root2Text = String(format: "%7.5e", rootSet1.1)
        root3Text = String(format: "%7.5e", rootSet2.0)
        root4Text = String(format: "%7.5e", rootSet2.1)
        
        r1r3Err = String(format: "%7.5e", log10(abs(rootSet1.0 - rootSet2.0) / (abs(rootSet1.0) + abs(rootSet2.0))))
        r2r4Err = String(format: "%7.5e", log10(abs(rootSet1.1 - rootSet2.1) / (abs(rootSet1.1) + abs(rootSet2.1))))
    }
    
    func setButtonEnable(state: Bool){
        if state {
            Task.init {
                await MainActor.run {
                    self.enableButton = true
                }
            }
        }
        else {
            Task.init {
                await MainActor.run {
                    self.enableButton = false
                }
            }
        }
    }
    
    
}
