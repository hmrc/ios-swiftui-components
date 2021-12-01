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


struct MainView: View {
   
    var body: some View {
        TabView {
            OrganismsView()
                .tabItem {
                    Label("Organisms", image: Example.Images.organism.rawValue)
                }
            MoleculesView()
                .tabItem {
                    Label("Molecules", image: Example.Images.molecule.rawValue)
                }
            AtomsView()
                .tabItem {
                    Label("Atoms", image: Example.Images.atom.rawValue)
                }
            ColoursView()
                .tabItem {
                    Label("Colours", image: Example.Images.colours.rawValue)
                }
        }.accentColor(Color.Semantic.expandableButtonText)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
