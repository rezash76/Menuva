//
//  OnboardingManager.swift
//  Menuva
//
//  Created by Reza Sharifi on 4/11/25.
//

import SwiftUI

class OnboardingManager: ObservableObject {
    
    enum Language: String, CaseIterable {
        case english
        case arabic
        case persian

        var displayName: String {
            switch self {
            case .english: return "English"
            case .arabic: return "Arabic"
            case .persian: return "Persian"
            }
        }

        var flag: Image {
            switch self {
            case .english: return Image("united-kingdom")
            case .arabic: return Image("united-arab-emirates")
            case .persian: return Image("iran")
            }
        }
    }
    
    let backgroundImageName = "onboarding_bg"
    
    let languages = Language.allCases
    
    @Published var selectedLanguage: Language = .english

    func selectLanguage(_ lang: Language) {
        selectedLanguage = lang
    }
}
