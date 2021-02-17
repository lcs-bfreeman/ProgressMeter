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
    
    // Width of the meter
    let meterWidth: CGFloat = 100

    // Thickness of meter's border
    let borderWidth: CGFloat = 2
    
    // Padding at top of progress meter
    let verticalPadding: CGFloat = 44
    
    var body: some View {
        GeometryReader { geometry in
        VStack {
            
            Spacer()
                
                HStack {
            
            Spacer()

            ZStack {
                // "Fill" for progress meter; stationary
                Rectangle()
                    .frame(width: meterWidth, height: geometry.size.height - verticalPadding, alignment: .center)

                // Will slide up
                Rectangle()
                    .fill(Color.primary)
                    .colorInvert()
                    .frame(width: meterWidth, height: geometry.size.height - verticalPadding, alignment: .center)
                    .offset(progressMeterOffset)
                    .onAppear(perform: {
                        withAnimation(Animation.easeIn(duration: 4.0)) {
                            // Offset is moves the opaque rectangle up
                            progressMeterOffset = CGSize(width: 0, height: -1 * (geometry.size.height - verticalPadding))
                        }
                    })

                // Sits above the rectangle that slides up (in the z-axis)
                // This means the rectangle sliding up will pass beneath this view
                Rectangle()
                    .fill(Color(hue: 0, saturation: 0, brightness: 0, opacity: 0))
                    .frame(width: meterWidth + borderWidth, height: geometry.size.height - verticalPadding + borderWidth, alignment: .center)
                    .overlay(
                        Rectangle()
                            .stroke(Color.primary, lineWidth: borderWidth)
                    )

            }
            
            Spacer()

            
                }
            Spacer()

        }

    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
