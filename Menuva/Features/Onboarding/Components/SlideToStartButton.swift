//
//  SliderStartButton.swift
//  Menuva
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI

struct SlideButtonView: View {
    @State private var dragOffset: CGFloat = 0
    @State private var buttonWidth: CGFloat = 0

    var onComplete: () -> Void

    var body: some View {
        ZStack {
            // دکمه پس‌زمینه
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(hex: "#FAFAFA").opacity(0.8))
                .frame(height: 80)
                .overlay(
                    GeometryReader { geo in
                        Color.clear.onAppear {
                            buttonWidth = geo.size.width
                        }
                    }
                )

            // متن Menu با انیمیشن محو شدن
            Text("Menu")
                .foregroundColor(Color(hex: "262626"))
                .font(.system(size: 20, weight: .bold))
                .opacity(Double(1 - dragOffset / (buttonWidth - 60)))

            // دکمه گرد کشیدنی
            HStack {
                Circle()
                    .fill(Color(hex: "171717"))
                    .frame(width: 64, height: 64)
                    .shadow(radius: 4)
                    .overlay(
                        Image("slid-button-element")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(hex: "#FAFAFA"))
                    )
                    .offset(x: dragOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let limited = min(max(0, value.translation.width), buttonWidth - 60)
                                dragOffset = limited
                            }
                            .onEnded { _ in
                                if dragOffset > (buttonWidth - 60) * 0.8 {
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        dragOffset = buttonWidth - 60
                                    }
                                    
                                    let impact = UIImpactFeedbackGenerator(style: .medium)
                                    impact.impactOccurred()

                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        onComplete()
                                        // بعد از اجرا، با انیمیشن برگرده عقب
                                        withAnimation(.easeOut(duration: 0.4)) {
                                            dragOffset = 0
                                        }
                                    }
                                } else {
                                    withAnimation(.easeOut) {
                                        dragOffset = 0
                                    }
                                }
                            }
                    )
                Spacer()
            }
            .padding(.leading, 10)
        }
        .padding(.horizontal)
        .frame(height: 60)
    }
}

//struct SlideToStartButton: View {
//    var action: () -> Void
//    
//    @State private var offsetX: CGFloat = 0
//    private let totalWidth: CGFloat = 462
//    private let knobSize: CGFloat = 64
//    
//    var body: some View {
//        ZStack {
//            Capsule()
//                .fill(Color(hex: "FAFAFA").opacity(0.8))
//                .frame(width: totalWidth, height: 80)
//            
//            Text("Menu")
//                .foregroundColor(Color(hex: "262626"))
//                .fontWeight(.semibold)
//            
//            HStack {
//                Circle()
//                    .fill(Color(hex: "171717"))
//                    .frame(width: knobSize, height: knobSize)
//                    .overlay(Image("slid-button-element")
//                        .foregroundColor(Color(hex: "FAFAFA")))
//                    .offset(x: offsetX)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { value in
//                                let newX = min(max(0, value.translation.width), totalWidth - knobSize)
//                                offsetX = newX
//                            }
//                            .onEnded { _ in
//                                if offsetX > totalWidth - knobSize - 10 {
//                                    action()
//                                }
//                                withAnimation {
//                                    offsetX = 0
//                                }
//                            }
//                    )
//                Spacer()
//                Text(">>>")
//                    .padding()
//            }
//            .frame(width: totalWidth - 8)
//        }
//    }
//}

#Preview {
    SlideButtonView {
        
    }
}
