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
    @State var cString = "0.01"
    
    var body: some View {
        VStack {
            HStack {
                Text("Coefficients")
                    .padding(.top)
                    .padding(.bottom, 0)
                VStack {
                    Text("a")
                        .padding(.bottom, 0)
                    TextField("Enter 'a'",
                              text: $aString,
                              onCommit: self.calculateRoot)
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom, 30)
                }
                VStack {
                    Text("b")
                        .padding(.bottom, 0)
                    TextField("Enter 'b'",
                              text: $bString,
                              onCommit: self.calculateRoot)
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom, 30)
                }
                VStack {
                    Text("c")
                        .padding(.bottom, 0)
                    TextField("Enter 'c'",
                              text: $cString,
                              onCommit: self.calculateRoot)
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom, 30)
                }
                
            }
            HStack {
                Text("Roots")
                    .padding(.top)
                    .padding(.bottom, 0)
                VStack {
                    Text("Root 1")
                        .padding(.bottom, 0)
                    TextField("", text: ( $quadratic.root1Text ) )
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom, 30)
                }
                VStack {
                    Text("Root 2")
                        .padding(.bottom, 0)
                    TextField("", text: ( $quadratic.root2Text ))
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom, 30)
                }
                VStack {
                    Text("Root 3")
                        .padding(.bottom, 0)
                    TextField("", text: ( $quadratic.root3Text ))
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom, 30)
                }
                VStack {
                    Text("Root 4")
                        .padding(.bottom, 0)
                    TextField("", text: ( $quadratic.root4Text ))
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom, 30)
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
