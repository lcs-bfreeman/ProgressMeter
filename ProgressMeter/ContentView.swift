//
//  ContentView.swift
//  ProgressMeter
//
//  Created by Ben Freeman on 2021-02-16.
//

import SwiftUI

struct ContentView: View {
    // For driving animation to reveal rectangle with progress meter fill
        @State private var progressMeterOffset = CGSize.zero
    var body: some View {
        VStack {
                ZStack {
                    // "Fill" for progress meter; stationary
                    Rectangle()
                        .frame(width: 100, height: 548 - 44, alignment: .center)
                    // Will slide up
                    Rectangle()
                        .fill(Color.primary)
                        .colorInvert()
                        .frame(width: 100, height: 548 - 44, alignment: .center)
                        .offset(progressMeterOffset)

                }
            }
    .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
