//
//  LoadingView.swift
//  Menuva
//
//  Created by Reza Sharifi on 5/5/25.
//

import SwiftUI

struct LoadingView: View {
    @State private var start = false
    
    var body: some View {
        ZStack {
            Text("Loading...")
                .font(.largeTitle.bold())
                .foregroundStyle(.black)
            
            Text("Loading...")
                .font(.largeTitle.bold())
                .foregroundStyle(.white)
                .frame(width: 200, height: 50)
                .background(Color.black)
                .mask {
                    Circle()
                        .frame(width: 40, height: 40)
                        .offset(x: start ? -60 : 60)
                }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1)
                .repeatForever(autoreverses: true)) {
                    start = true
                }
        }
    }
}

#Preview {
    LoadingView()
}
