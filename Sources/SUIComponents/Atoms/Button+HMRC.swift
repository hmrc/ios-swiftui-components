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
    case primary
    case secondary(padding: CGFloat = .spacer16)
}

extension Button {

    @ViewBuilder
    public func styled(_ style: HMRCButtonStyle) -> some View {
        switch style {
            case .primary:
                self.buttonStyle(PrimaryButtonStyle())
            case let .secondary(padding):
                self.buttonStyle(SecondaryButtonStyle(padding))
        }
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.spacer12)
            .background(Color.Semantic.primaryButtonBackground)
            .foregroundColor(Color.Semantic.primaryButtonText)
            .overlay(
                VStack{
                    Rectangle()
                        .frame(height: 3)
                        .foregroundColor(Color.Semantic.primaryButtonBaseline)
                }, alignment: .bottom
            )
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    let padding: CGFloat

    init(_ padding: CGFloat = .spacer16) {
        self.padding = padding
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(padding)
            .background(Color.Semantic.secondaryButtonBackground)
            .foregroundColor(Color.Semantic.secondaryButtonText)
    }
}
