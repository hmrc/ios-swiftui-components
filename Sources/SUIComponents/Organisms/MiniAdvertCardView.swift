/*
 * Copyright 2023 HM Revenue & Customs
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

extension Components.Organisms {
    public struct MiniAdvertCardView: View {

        @State private var selected: Bool = false
        @State private var currentGeometry: GeometryProxy?

        public let model: Model
        public let didTapAdvert: VoidHandler?
        private let spacing = CGFloat(12)

        public init(model: Model, _ didTapAdvert: VoidHandler?) {
            self.model = model
            self.didTapAdvert = didTapAdvert
        }

        public var body: some View {
            HStack {
                Text(model.title)
                    .font(.Body.font())
                    .foregroundColor(.Semantic.lightText)
                    .fixedSize(horizontal: false, vertical: true)
                    .accessibility(hidden: true)
                Spacer()
                model.icon
                    .foregroundColor(.Semantic.lightText)
                    .accessibility(hidden: true)
                    .frame(height: FontMetrics.scaledValue(for: .spacer16))
            }
            .padding(.spacer16)
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .background(
                (selected ? Color.Semantic.switchTintSelected : Color.Semantic.switchTint)
                    .accessibility(addTraits: .isButton)
                    .accessibility(hidden: false)
                    .accessibility(hint: Text(model.accessibilityHint ?? ""))
                    .accessibility(label: Text(model.title))
            )
            .background(GeometryReader { geometry in
                Color.clear.onAppear {
                    currentGeometry = geometry
                }
            })
            ._onButtonGesture { pressing in
                selected = pressing
            } perform: {
                didTapAdvert?()
            }
        }
    }
}

extension Components.Organisms.MiniAdvertCardView {
    open class Model {
        public let title: String
        public let icon: Image?
        public let accessibilityHint: String?
        public let accessibilityIdentifier: String?

        public init(
            icon: Image,
            title: String,
            accessibilityHint: String? = nil,
            accessibilityIdentifier: String? = nil
        ) {
            self.icon = icon
            self.title = title
            self.accessibilityHint = accessibilityHint
            self.accessibilityIdentifier = accessibilityIdentifier
        }
    }
}
