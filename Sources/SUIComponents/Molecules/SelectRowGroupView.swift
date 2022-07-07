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
    public struct SelectRowGroupView: View {
        @Binding var rowModel: SelectRowView.Model
        let titleBodyModel: TitleBodyView.Model
        let rowTapped: ((Int) -> Void)

        public init(rowModel: Binding<SelectRowView.Model>, titleBodyModel: TitleBodyView.Model, rowTapped: @escaping ((Int) -> Void)) {
            _rowModel = rowModel
            self.rowTapped = rowTapped
            self.titleBodyModel = titleBodyModel
        }
        public var body: some View {
            VStack {
                Components.Molecules.TitleBodyView(model: titleBodyModel)
                Components.Molecules.SelectRowView(model: _rowModel, rowTappedHandler: rowTapped)
            }
        }
    }
}

