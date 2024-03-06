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

public struct DisclosureView: ViewModifier {

    public struct Model {
        let id: String
        let inset: CGFloat
        let icon: Image
        let action: VoidHandler
        let accessibilityLabel: String
        let accessibilityHint: String

        public init(
            id: String = "",
            inset: CGFloat = .spacer16,
            icon: Image = Image("ChevronRight", bundle: .main),
            accessibilityLabel: String = "",
            accessibilityHint: String = "",
            _ action: @escaping VoidHandler
        ) {
            self.id = id
            self.inset = inset
            self.action = action
            self.icon = icon
            self.accessibilityLabel = accessibilityLabel
            self.accessibilityHint = accessibilityHint
        }
    }

    private let model: Model?

    public init(model: Model?) {
        self.model = model
    }
    
    @State private var tapped: Bool = false

    private func performAction() {
        withAnimation {
            tapped = true
            delayedCall(0.3) {
                model?.action()
                tapped = false
            }
        }
    }

    public func body(content: Content) -> some View {
        if let model = model {
            ZStack {
                HStack(spacing: 0) {
                    content.accessibility(sortPriority: 2)
                    model.icon
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: model.inset))
                        .accessibility(hidden: true)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    performAction()
                }
                .background(tapped ? Color.Semantic.secondaryButtonHighlightedBackground : Color.clear)
                Button("") {
                    performAction()
                }
                .id(model.id)
                .accessibility(sortPriority: 1)
                .accessibility(label: Text(model.accessibilityLabel))
                .accessibility(hint: Text(model.accessibilityHint))
            }
        } else {
            content
        }
    }
}

public extension View {
    func disclosureAction(inset: CGFloat = .spacer16, model: DisclosureView.Model?) -> some View {
        modifier(DisclosureView(model: model))
    }
}
