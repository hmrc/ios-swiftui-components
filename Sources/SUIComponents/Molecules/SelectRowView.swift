/*
 * Copyright 2022 HM Revenue & Customs
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
    public struct SelectRowView: View {

        public class Model {
            let showSeparators: Bool
            let selectedImage: Image
            let deselectedImage: Image
            let imageTintColor: Color

            var rows: [Row]

            public init(
                showSeparators: Bool = false,
                selectedImage: Image? = nil,
                deselectedImage: Image? = nil,
                imageTintColor: Color = Color.Semantic.darkText,
                rows: [Row]
            ) {
                self.showSeparators = showSeparators
                if let selectedImage = selectedImage {
                    self.selectedImage = selectedImage
                } else {
                    self.selectedImage = Image("FilledCircle")
                }

                if let deselectedImage = deselectedImage {
                    self.deselectedImage = deselectedImage
                } else {
                    self.deselectedImage = Image("EmptyCircle")
                }

                self.imageTintColor = imageTintColor
                self.rows = rows
            }

            public class Row: Hashable {
                public static func == (lhs: Components.Molecules.SelectRowView.Model.Row, rhs: Components.Molecules.SelectRowView.Model.Row) -> Bool {
                    lhs.body == rhs.body
                }

                public var hashValue: Int {
                    return body.hashValue
                }

                public func hash(into hasher: inout Hasher) {
                    body.hash(into: &hasher)
                }

                var selected = false
                let body: String
                let accessibilityId: String?

                public init(
                    isSelected: Bool = false,
                    body: String,
                    accessibilityId: String? = nil
                ) {
                    self.selected = isSelected
                    self.body = body
                    self.accessibilityId = accessibilityId
                }
            }
        }

        @Binding var model: Model
        let rowTappedHandler: ((Int) -> Void)?

        public init(model: Binding<Model>, rowTappedHandler: ((Int) -> Void)?) {
            self._model = model
            self.rowTappedHandler = rowTappedHandler
        }

        @State var selectedRow: Model.Row?

        private func accessibilityLabel(for row: Model.Row, rowIndex: Int, rowCount: Int) -> String {
            let suffix: String

            if rowCount > 1 {
                 suffix = ", \(rowIndex + 1) of \(rowCount)"
            } else {
                suffix = ""
            }

            let state = row.selected ? "selected" : "not selected"

            return "\(row.body), \(state), radio button\(suffix)"
        }

        public var body: some View {
            VStack {
                ForEach(model.rows, id: \.self) { row in
                    if let rowIndex = model.rows.firstIndex(of: row) {
                        let isLastRow = rowIndex == (model.rows.count - 1)
                        let accessiblityLabel = accessibilityLabel(for: row, rowIndex: rowIndex, rowCount: model.rows.count)
                        VStack {
                            Components.Atoms.CustomButton(
                                normalBackgroundColour: .clear,
                                highlightedBackgroundColour: .Semantic.secondaryButtonHighlightedBackground,
                                tapped: {
                                    model.rows.forEach { $0.selected = (row == $0) }
                                    selectedRow = row
                                    rowTappedHandler?(rowIndex)
                                }) {
                                    HStack {
                                        if row.selected {
                                            model.selectedImage
                                        } else {
                                            model.deselectedImage
                                        }

                                        Text(row.body)
                                    }.accessibilityElement(children: .combine)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.spacer8)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .accessibility(label: Text(accessiblityLabel))
                                .accessibility(hidden: false)
                            if model.showSeparators && !isLastRow {
                                Components.Atoms.SeparatorView()
                            }
                        }
                    }
                }
            }
        }
    }
}

