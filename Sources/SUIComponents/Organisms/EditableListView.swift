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
    public struct EditableListView: View, Resizable {

        fileprivate static var isVertical: Bool { FontMetrics.scaler > 1.36 }

        public struct Model {
            public let title: String

            public let rowButtonTitle: String
            public let rowAccessibilityHint: String
            public let startEditingButtonTitle: String
            public let startEditingButtonImage: Image
            public let stopEditingButtonTitle: String
            public let stopEditingButtonImage: Image

            public let views: [any View]
            public let didTapRow: (Int) -> Void

            public init(title: String, rowButtonTitle: String, rowAccessibilityHint: String, startEditingButtonTitle: String, startEditingButtonImage: Image, stopEditingButtonTitle: String, stopEditingButtonImage: Image, views: [any View], didTapRow: @escaping (Int) -> Void) {
                self.title = title
                self.rowButtonTitle = rowButtonTitle
                self.rowAccessibilityHint = rowAccessibilityHint
                self.startEditingButtonTitle = startEditingButtonTitle
                self.startEditingButtonImage = startEditingButtonImage
                self.stopEditingButtonTitle = stopEditingButtonTitle
                self.stopEditingButtonImage = stopEditingButtonImage
                self.views = views
                self.didTapRow = didTapRow
            }
        }

        @State var isEditing: Bool

        let model: Model
        public var updateSize: (() -> Void)?

        public init(model: Model, isEditing: Bool = false) {
            self.model = model
            self.isEditing = isEditing
        }

        public var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(model.title, style: .H5)
                    .padding(.spacer16)
                    .fixedSize(horizontal: false, vertical: true)
                ForEach(model.views.indices, id: \.self) { index in
                    Components.Atoms.Stack(
                        axis: EditableListView.isVertical ? .vertical(alignment: .leading) : .horizontal(alignment: .center),
                        spacing: 0) {
                            model.views[index]
                                .typeErased
                                .padding(.spacer8)
                            if isEditing {
                                Button(model.rowButtonTitle) {
                                    model.didTapRow(index)
                                }.styled(.secondary(
                                    padding: .spacer8,
                                    fullWidth: EditableListView.isVertical,
                                    alignment: EditableListView.isVertical ? .leading : .center
                                ))
                                .if(!EditableListView.isVertical) { view in
                                    view.padding(.horizontal, .spacer8)
                                }
                                .accessibility(removeTraits: .isButton)
                            }
                        }
                        .padding(.horizontal, .spacer8)
                    if index < (model.views.count - 1) {
                        Components.Atoms.Divider()
                            .accessibility(hidden: true)
                            .padding(.horizontal, .spacer16)
                    }
                }
                .accessibilityElement(children: .combine)
                .if(isEditing) { view in
                    view.accessibility(addTraits: .isButton)
                        .accessibility(hint: Text(model.rowAccessibilityHint))
                }
                Components.Molecules.IconButtonView(model: .init(
                    icon: isEditing ? model.stopEditingButtonImage : model.startEditingButtonImage,
                    title: isEditing ? model.stopEditingButtonTitle : model.startEditingButtonTitle,
                    handler: {
                        UIAccessibility.post(
                            notification: .layoutChanged,
                            argument: isEditing ?
                                "\(model.rowButtonTitle) buttons now hidden" :
                                "\(model.rowButtonTitle) buttons now visible"
                        )
                        updateSize?()
                        withAnimation {
                            isEditing = !isEditing

                        }
                    })
                )
            }
            .cardView(insets: .none)
        }
    }
}
