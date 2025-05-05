//
//  OnboardingView.swift
//  Menuva
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingManager()
    @State var isLoading = true

    var body: some View {
        ZStack {
            Image(viewModel.backgroundImageName)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Welcome To Ariya")
                        .font(.largeTitle).bold()
                        .foregroundColor(.white)
                    
                    Text("Where Taste Meets Elegance")
                        .font(.largeTitle)
                        .foregroundColor(.white.opacity(0.8))
                    
                    Text("Aria offers a refined dining experience with delicious food, stylish ambiance, and warm hospitality. Sit back, relax, and enjoy every moment.")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                .padding(.top, 60)
                
                Spacer()
                // Language Selector
                VStack {
                    Text("Choos your language")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .bold()
                    HStack(spacing: 24) {
                        ForEach(viewModel.languages, id: \.self) { lang in
                            Button(action: {
                                viewModel.selectLanguage(lang)
                            }) {
                                VStack(spacing: 0) {
                                    Text(lang.flag)
                                        .font(.largeTitle)
                                    
                                    Text(lang.displayName)
                                        .font(.caption).bold()
                                        .foregroundColor(
                                            viewModel.selectedLanguage == lang ?
                                            Color.black :
                                                    .white
                                        )
                                }
                                .padding(.vertical, 10)
                                .padding(.horizontal, 16)
                                .background(
                                    viewModel.selectedLanguage == lang ?
                                    Color.white.opacity(0.5) :
                                        nil
                                )
                                .foregroundColor(.black)
                                .cornerRadius(12)
                            }
                        }
                    }
                }
                .padding(.bottom, 40)
                
                
                SlideButtonView {
                    print("HIII")
                }
                .padding(.bottom, 40)
                .frame(maxWidth: 480)
            }
            .padding(.horizontal, 24)
            .shimmer(when: isLoading)
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
        
}

#Preview {
    OnboardingView()
}
