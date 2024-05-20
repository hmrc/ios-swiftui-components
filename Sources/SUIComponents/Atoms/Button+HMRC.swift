/*
 * Copyright 2021 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI

public enum HMRCButtonStyle {
    case primary(enabled: Bool = true)
    case secondary(padding: CGFloat = .spacer16, fullWidth: Bool = true, alignment: Alignment = .center)
}

extension Button {
    @ViewBuilder
    public func styled(_ style: HMRCButtonStyle) -> some View {
        switch style {
        case .primary(let enabled):
            self.buttonStyle(PrimaryButtonStyle(enabled))
        case .secondary(let padding, let fullWidth, let alignment):
            self.buttonStyle(SecondaryButtonStyle(padding, fullWidth, alignment))
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    let enabled: Bool
    init(_ enabled: Bool = true) {
        self.enabled = enabled
    }
    func makeBody(configuration: Configuration) -> some View {
        WrappedButton(configuration: configuration)
    }
    private var backgroundColor: Color {
        enabled ?  Color.Semantic.primaryButtonBackground : Color.Semantic.primaryButtonDisabledBackground
    }
    private var textColor: Color {
        enabled ?  Color.Semantic.primaryButtonText : Color.Semantic.primaryButtonDisabledText
    }
    struct WrappedButton: View {
        let configuration: Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.dynamicTypeSize) var dynamicTypeSize
        
        private func backgroundColour(for configuration: Configuration, isEnabled: Bool)-> Color {
            if !isEnabled {
                return Color.Semantic.primaryButtonDisabledBackground
            } else {
                return configuration.isPressed ? Color.Semantic.primaryButtonHighlightedBackground : Color.Semantic.primaryButtonBackground
            }
        }
        private func baselineColour(for configuration: Configuration, isEnabled: Bool)-> Color {
            if !isEnabled {
                return .clear
            } else {
                return configuration.isPressed ? Color.Semantic.primaryButtonHighlightedBaseline : Color.Semantic.primaryButtonBaseline
            }
        }
        private func textColour(for configuration: Configuration, isEnabled: Bool)-> Color {
            isEnabled ? Color.Semantic.primaryButtonText : Color.Semantic.primaryButtonDisabledText
        }
        
        var body: some View {
            configuration.label
                .font(Font.Body.font())
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.spacer12)
                .background(backgroundColour(for: configuration, isEnabled: isEnabled))
                .foregroundColor(textColour(for: configuration, isEnabled: isEnabled))
                .overlay(
                    VStack{
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(baselineColour(for: configuration, isEnabled: isEnabled))
                    }, alignment: .bottom
                )
        }
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    let padding: CGFloat
    let fullWidth: Bool
    let alignment: Alignment
    
    init(_ padding: CGFloat = .spacer16, _ fullWidth: Bool = true, _ alignment: Alignment = .center) {
        self.padding = padding
        self.fullWidth = fullWidth
        self.alignment = alignment
    }
    
    func makeBody(configuration: Configuration) -> some View {
        WrappedButton(configuration: configuration, padding: padding, fullWidth: fullWidth, alignment: alignment)
    }
    
    struct WrappedButton: View {
        let configuration: Configuration
        let padding: CGFloat
        let fullWidth: Bool
        let alignment: Alignment
        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.dynamicTypeSize) var dynamicTypeSize
        
        private func backgroundColour(for configuration: Configuration, isEnabled: Bool)-> Color {
            return configuration.isPressed ? Color.Semantic.secondaryButtonHighlightedBackground : Color.Semantic.secondaryButtonBackground
        }
        
        var body: some View {
            configuration.label
                .font(Font.Body.font())
                .padding(padding)
                .if(fullWidth, transform: { view in
                    view.frame(maxWidth: .infinity, alignment: alignment)
                })
                .background(backgroundColour(for: configuration, isEnabled: isEnabled))
                .foregroundColor(Color.Semantic.secondaryButtonText)
        }
    }
}
