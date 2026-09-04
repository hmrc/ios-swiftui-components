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

extension Components.Molecules {
    public struct MultiColumnRowView: View {
        let views: [AnyView]
        let spacing: CGFloat
        let weights: [CGFloat]
        let traits: [Int:AccessibilityTraits]

        public init(
            views: [AnyView],
            weights: [CGFloat] = [],
            spacing: CGFloat = .spacer8,
            traits: [Int:AccessibilityTraits] = [:]
        ) {
            self.views = views
            let sumWeight: CGFloat = (weights.reduce(0) { $0 + $1 })
            self.weights = weights.map { $0 / sumWeight }
            self.spacing = spacing
            self.traits = traits
        }

        public var body: some View {
            if weights.count > 0 {
                HorizontalGeometryReader { width in
                    let widths: [CGFloat] = {
                        if width > 0 {
                            let spacerWidth = CGFloat(weights.count - 1) * spacing
                            let trueWidth = width - spacerWidth
                            return weights.map { weight in
                                return trueWidth * weight
                            }
                        }
                        return weights.map { _ in
                            return 0
                        }
                    }()

                    if MultiColumnRowView.isVertical {
                        VStack(
                            alignment: .leading,
                            spacing: spacing,
                            content: {
                                self.labels()
                            }
                        )
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    } else {
                        HStack(
                            alignment: .top,
                            spacing: spacing,
                            content: {
                                self.labels(widths)
                            }
                        )
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                    }
                }
            } else {
                if MultiColumnRowView.isVertical {
                    VStack(
                        alignment: .leading,
                        spacing: 0,
                        content: {
                            self.labels()
                        }
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                } else {
                    HStack(
                        alignment: .top,
                        spacing: 0,
                        content: {
                            self.labels()
                        }
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                }
            }
        }
        
        func labels(_ widths: [CGFloat]? = nil) -> AnyView {
            AnyView(
                ForEach(0..<views.count, id: \.self) {
                    index in
                    let traitToApply: AccessibilityTraits = traits.keys.contains(index) ? traits[index]! : AccessibilityTraits()
                    if let widths = widths {
                        views[index]
                            .fixedSize(horizontal: false, vertical: false)
                            .frame(width: widths[index], alignment: index == 0 || MultiColumnRowView.isVertical ? .leading : .trailing)
                            .accessibilityAddTraits(traitToApply)
                    } else {
                        views[index]
                            .fixedSize(horizontal: false, vertical: false)
                            .accessibilityAddTraits(traitToApply)
                        if (index != views.count - 1) {
                            Spacer()
                        }
                    }
                }
            )
        }
    }
}

extension Components.Molecules.MultiColumnRowView {
    fileprivate static var isVertical: Bool { FontMetrics.scaler > 1.36 }
    public struct Model {
        let label: String
        let style: TextStyle
        let canCopy: Bool
        let weight: CGFloat?
        let textAlignment: TextAlignment
        let accessibilityLabel: String?
        let accessibilityTrait: AccessibilityTraits?
        let accessibilityHidden: Bool

        public init(
            label: String,
            style: TextStyle = .body,
            canCopy: Bool = false,
            weight: CGFloat? = nil,
            textAlignment: TextAlignment = .center,
            accessibilityLabel: String? = nil,
            accessibilityTrait: AccessibilityTraits? = nil,
            accessibilityHidden: Bool = false
        ) {
            self.label = label
            self.style = style
            self.canCopy = canCopy
            self.weight = weight
            self.textAlignment = textAlignment
            self.accessibilityLabel = accessibilityLabel
            self.accessibilityTrait = accessibilityTrait
            self.accessibilityHidden = accessibilityHidden
        }
    }

    public init(labels: [String], style: TextStyle) {
        let models: [Model] = labels.enumerated().map { index, label in
            return .init(label: label, style: style, weight: nil, textAlignment: index == 0 ? .leading : .trailing)
        }
        self.init(models: models)
    }

    public init(models: [Model]) {
        var viewsWithTraits = [Int: AccessibilityTraits]()
        let views: [AnyView] = models.enumerated().map { index, model in
            let text = Text(model.label)
                .style(model.style)
                .accessibilityLabel(Text(model.accessibilityLabel ?? model.label))
                .accessibilityHidden(model.accessibilityHidden)
                .multilineTextAlignment(Components.Molecules.MultiColumnRowView.isVertical ? .leading : model.textAlignment)
                .typeErased
            if model.accessibilityTrait != nil {
                viewsWithTraits[index] = model.accessibilityTrait
            }
            return text
        }
       
        let weights = models.compactMap { $0.weight }
        self.init(
            views: views,
            weights: weights,
            traits: viewsWithTraits
        )
    }
}

struct MultiColumnRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(
            alignment: .leading,
            spacing: .spacer16,
            content: {
                Components.Molecules.MultiColumnRowView(
                    labels: [
                        "Col 1",
                        "Col 2",
                        "Col 3"
                    ],
                    style: .error
                )
            }
        ).frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
        ).background(Color.gray)
    }
}
