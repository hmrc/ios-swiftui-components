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
import SUIComponents

struct MoleculesView: View {
    var body: some View {
        NavigationView {
            List {
                Example.navigationLink(type: Components.Molecules.StatusView.self)
                Example.navigationLink(type: Components.Molecules.TitleBodyView.self)
                Example.navigationLink(type: Components.Molecules.InsetView<Text>.self)
                Example.navigationLink(type: Components.Molecules.SwitchRowView.self)
                Example.navigationLink(type: Components.Molecules.TextInputView.self)
                Example.navigationLink(type: Components.Molecules.CurrencyInputView.self)
            }
            .navigationTitle("Molecules")
        }
    }
}

struct MoleculesView_Previews: PreviewProvider {
    static var previews: some View {
        MoleculesView()
    }
}
