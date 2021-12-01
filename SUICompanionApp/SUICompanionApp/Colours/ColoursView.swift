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

struct ColoursView: View, ScreenshotableView {
    @ObservedObject var snapshotViewModel: SnapshotViewModel
    
    init(_ snapshotViewModel: SnapshotViewModel? = nil) {
        self.snapshotViewModel = snapshotViewModel ?? .init()
    }
    
    var body: some View {
        NavigationView {
            MeasurableScrollView(size: $snapshotViewModel.size) {
                VStack(alignment: .leading, spacing: .spacer16) {
                    Text("Named Colours:")
                        .style(.H5)
                    ForEach(Color.Named.allColors, id: \.0, content: colourCell(_:_:))
                    Text("Semantic Colours:").style(.H5)
                    ForEach(Color.Semantic.allColors, id: \.0, content: colourCell(_:_:))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.spacer24)
            }.navigationTitle("Colours")
        }
    }

    func colourCell(_ name: String, _ colour: Color) -> some View {
        return HStack {
            Rectangle()
                .foregroundColor(colour)
                .frame(width: 40, height: 40)
                .border(Color.Named.black.raw, width: 1)
            Text(name).style(.body)
        }
    }
}
