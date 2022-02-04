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
    public struct SwitchRowView: View {
        @Binding var isOn: Bool
        var titleBodyModel: TitleBodyView.Model

        public init(isOn: Binding<Bool>, titleBodyModel: TitleBodyView.Model) {
            self._isOn = isOn
            self.titleBodyModel = titleBodyModel
        }
        public var body: some View {
            HStack {
                Components.Molecules.TitleBodyView(model: titleBodyModel)
                Components.Atoms.Switch(
                    isOn: _isOn,
                    onTintColor: Color.Semantic.switchTint,
                    borderColor: Color.Named.grey2.colour,
                    borderWidth: 1,
                    cornerRadius: 14.0
                )
            }
        }
    }
}


struct SwitchRowView_Previews: PreviewProvider {
    static var previews: some View {
        ViewWrapper()
    }

    struct ViewWrapper: View {
        @State(initialValue: true) var isOn: Bool

        var body: some View {
            Components.Molecules.SwitchRowView(
                isOn: $isOn,
                titleBodyModel: .init(
                    title: "Switch Row Title",
                    body: "Switch Row Body",
                    style: .body
                )
            )
        }
    }
}
