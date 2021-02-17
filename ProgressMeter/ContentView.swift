//
//  ContentView.swift
//  ProgressMeter
//
//  Created by Ben Freeman on 2021-02-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // "Fill" for progress meter; stationary
            Rectangle()
                .frame(width: 100, height: 548 - 44, alignment: .center)
            // Will slide up
            Rectangle()
                .frame(width: 100, height: 548 - 44, alignment: .center)
        }
    .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
