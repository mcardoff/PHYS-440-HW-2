//
//  ContentView.swift
//  Shared
//
//  Created by Michael Cardiff on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var quadratic = Quadratic()
    @State var aString = "1.0"
    @State var bString = "1.0"
    @State var cString = "1.0e-10"
    
    var body: some View {
        
        VStack {
            HStack {
                VStack {
                    Text("Coefficients")
                        .padding(.top)
                        .padding(.bottom, 0)
                    HStack {
                        Text("a")
                        TextField("Enter 'a'",
                                  text: $aString,
                                  onCommit: self.calculateRoot)
                            .frame(width: 100)
                    }
                    HStack {
                        Text("b")
                        TextField("Enter 'b'",
                                  text: $bString,
                                  onCommit: self.calculateRoot)
                            .frame(width: 100)
                    }
                    HStack {
                        Text("c")
                            .padding(.bottom, 0)
                        TextField("Enter 'c'",
                                  text: $cString,
                                  onCommit: self.calculateRoot)
                            .frame(width: 100)
                    }
                    
                }
                
                
                VStack {
                    Text("Roots")
                        .padding(.top)
                        .padding(.bottom, 0)
                    HStack {
                        Text("Root 1")
                            .padding(.bottom, 0)
                        TextField("", text: ( $quadratic.root1Text ) )
                            .frame(width: 150)
                        
                    }
                    HStack {
                        Text("Root 2")
                            .padding(.bottom, 0)
                        TextField("", text: ( $quadratic.root2Text ))
                            .frame(width: 150)
                    }
                    HStack {
                        Text("Root 3")
                            .padding(.bottom, 0)
                        TextField("", text: ( $quadratic.root3Text ))
                            .frame(width: 150)
                    }
                    HStack {
                        Text("Root 4")
                            .padding(.bottom, 0)
                        TextField("", text: ( $quadratic.root4Text ))
                            .frame(width: 150)
                    }
                }
                
                VStack {
                    Text("Log Relative Differences")
                        .padding(.top)
                        .padding(.bottom, 0)
                    HStack {
                        Text("R1 vs R3")
                            .padding(.bottom, 0)
                        TextField("", text: ( $quadratic.r1r3Err ) )
                            .frame(width: 150)
                        
                    }
                    HStack {
                        Text("R2 vs R4")
                            .padding(.bottom, 0)
                        TextField("", text: ( $quadratic.r2r4Err ))
                            .frame(width: 150)
                    }
                }
            }
            Button("Calculate", action: {self.calculateRoot()})
                .padding(.bottom)
                .padding()
                .disabled(quadratic.enableButton == false)
        }
    }
    
    func calculateRoot() {
        quadratic.setButtonEnable(state: false)
        
        quadratic.setvals(a: Double(aString)!, b: Double(bString)!, c: Double(cString)!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
