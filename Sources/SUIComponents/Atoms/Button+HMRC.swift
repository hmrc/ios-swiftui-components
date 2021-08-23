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
    case primary, secondary
}

extension Button {

    @ViewBuilder
    public func styled(_ style: HMRCButtonStyle) -> some View {
        switch style {
            case .primary:
                self.buttonStyle(PrimaryButtonStyle())
            case .secondary:
                self.buttonStyle(SecondaryButtonStyle())
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
                Rectangle()
                    .fill(Color.Semantic.primaryButtonBaseline)
                    .frame(height: 3)
                , alignment: .bottom
            )
    }
}

struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.spacer12)
            .background(Color.Semantic.secondaryButtonBackground)
            .foregroundColor(Color.Semantic.secondaryButtonText)
    }
}
