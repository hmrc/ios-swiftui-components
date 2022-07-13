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
    private let handler: VoidHandler?
    private let inset: CGFloat
    public init(
        inset: CGFloat,
        handler: VoidHandler? = nil
    ) {
        self.inset = inset
        self.handler = handler
    }
    
    @State private var tapped: Bool = false

    public func body(content: Content) -> some View {
        if handler != nil {
            HStack(spacing: 0) {
                content
                Image("chevron_right", bundle: .module)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: inset))
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    tapped = true
                    delayedCall(0.3) {
                        handler?()
                        tapped = false
                    }
                }
            }.background(tapped ? Color.Semantic.secondaryButtonHighlightedBackground : Color.clear)
        } else {
            content
        }
    }
}

public extension View {
    func disclosureAction(inset: CGFloat = .spacer16, handler: VoidHandler?) -> some View {
        modifier(DisclosureView(inset: inset, handler: handler))
    }
}
