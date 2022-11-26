//
//  PickerView.swift
//  Recipe List App
//
//  Created by ed on 11/23/22.


import SwiftUI

struct PickerView: View {
    @State var selectedIndex = "1"
    var body: some View {
        
        VStack {
        
            Picker("Tap Me", selection: $selectedIndex) {
                Text("Option 1").tag(1)
                Text("Option 2").tag(2)
                Text("Option 3").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("You've selected: \(selectedIndex)")
        }
        
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}


