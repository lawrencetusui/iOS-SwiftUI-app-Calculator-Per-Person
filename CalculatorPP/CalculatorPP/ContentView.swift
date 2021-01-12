//
//  ContentView.swift
//  WeSplit
//
//  Created by Lawrence Tsui on 11/1/21.
//

import SwiftUI

struct ContentView: View {

    @State private var name = ""
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipsSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipsSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    @State private var currentSegment = 0
    var body: some View{
        NavigationView{
            Form{
                //$ is 2 way binding
                Section{
                    TextField("Your name", text: $name)
                    Text("Welcome " + name)
                }
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                Picker("Select how many people", selection: $numberOfPeople){
                    ForEach(2 ..< 100){
                        Text("\($0) people")
                    }
                }
                
                VStack {
                    Picker("A or B", selection: $currentSegment) {
                        Text("Australia").tag(0)
                        Text("United States").tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                }
                if currentSegment == 1{
                    Section(header: Text("How much tip do you want pay?")){
                        
                        Picker("Tip percentage", selection: $tipPercentage){
                            ForEach(0 ..< tipPercentages.count){
                                Text("\(self.tipPercentages[$0]) %")
                            }
                        }.pickerStyle((SegmentedPickerStyle()))
                        
                    }
                }
                Section{
                    Text("$ \(totalPerPerson)")
                }
            }.navigationBarTitle("Calculator Per person")
            
        }
        
        
        
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

