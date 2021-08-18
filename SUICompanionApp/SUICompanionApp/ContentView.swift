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

struct ContentView: View {
    @State(initialValue: false) var isOn: Bool
    
    var body: some View {
        HStack(
            alignment: .top,
            spacing: 20,
            content: {
                VStack(
                    alignment: .leading,
                    spacing: 20,
                    content: {
                        Components.Molecules.TitleBodyView(
                            model: .init(
                                title: "Your PAYE Summary",
                                body: "6 April 2020 to 5 April 2021",
                                style: .H4
                            )
                        ).frame(
                            maxWidth: .infinity,
                            alignment: .topLeading
                        )

                        let isOnBinding = Binding<Bool> {
                            self.isOn
                        } set: { isOn in
                            self.isOn = isOn
                            print("SwitchRow Value did change: \(self.isOn)")
                        }
                        Components.Molecules.SwitchRowView(isOn: isOnBinding)

                        Components.Molecules.StatusView(
                            model: .init(
                                icon: "square.and.pencil",
                                title: "A title",
                                body: "A body",
                                buttonModel: .init(
                                    title: "A button title",
                                    style: .primary,
                                    accessibilityIdentifier: "identifier",
                                    handler: {
                                        print("kdsjbf")
                                    }
                                )
                            )
                        ).background(Color.Semantic.whiteBackground)
                    })
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .leading
                    )
                    .background(Color.Semantic.pageBackground)
                    .padding()
            }
        ).background(Color.Semantic.pageBackground)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
