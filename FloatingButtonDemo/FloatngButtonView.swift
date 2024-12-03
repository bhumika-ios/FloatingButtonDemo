//
//  FloatngButtonView.swift
//  FloatingButtonDemo
//
//  Created by Bhumika Patel on 03/12/24.
//

import SwiftUI


struct FloatingButtonView: View {
    @State private var isExpanded = false
    @State private var scale: CGFloat = 1.0 // To animate the background of the + button
    @State private var buttonOffset: CGFloat = 50 // Initial offset for the buttons
    
    var body: some View {
        VStack {
//            Spacer()
            
            HStack {
//                Spacer()
                
                // The plus button with a round rectangle background
                if !isExpanded {
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                            scale = 1.5 // Increase the scale when expanded
                        }
                    }) {
                        Text("+")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .frame(width: 60, height: 60)
                            .background(RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.gray.opacity(0.2)))
                            .scaleEffect(scale)  // Animate the scaling effect
                            .shadow(radius: 10)
                            .animation(.spring(), value: scale)
                    }
                } else {
                    // Buttons 1, 2, and 3 in a single horizontal row with one background
                    VStack {
                        HStack(spacing: 20) {
                            Button("Button 1") {
                                // Action for Button 1
                            }
                            .frame(width: 100, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
                            .foregroundColor(.white)
                            .opacity(isExpanded ? 1 : 0) // Fade in the button
                            .offset(x: isExpanded ? 0 : -buttonOffset) // Slide in from left
                            .animation(.spring(), value: isExpanded)
                            
                            Button("Button 2") {
                                // Action for Button 2
                            }
                            .frame(width: 100, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                            .foregroundColor(.white)
                            .opacity(isExpanded ? 1 : 0) // Fade in the button
                            .offset(x: isExpanded ? 0 : -buttonOffset) // Slide in from left
                            .animation(.spring().delay(0.1), value: isExpanded)
                            
                            Button("Button 3") {
                                // Action for Button 3
                            }
                            .frame(width: 100, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.orange))
                            .foregroundColor(.white)
                            .opacity(isExpanded ? 1 : 0) // Fade in the button
                            .offset(x: isExpanded ? 0 : -buttonOffset) // Slide in from left
                            .animation(.spring().delay(0.2), value: isExpanded)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                        
                        // Cross button displayed below Buttons 1, 2, and 3
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                                scale = 1.0 // Reset the scale when collapsed
                            }
                        }) {
                            Text("×")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Circle()
                                                .fill(Color.red))
                                .shadow(radius: 10)
                        }
                    }
                    .offset(y: 30)
//                    .transition(.move(edge: .bottom))
                    .animation(.spring(), value: isExpanded)
                }
            }
            .padding()
        }
    }
}
#Preview {
    FloatingButtonView()
}
