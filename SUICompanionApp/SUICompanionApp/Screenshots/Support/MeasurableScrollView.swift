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

struct HeightPreferenceData: Equatable {
    let size: CGSize
}
struct HeightPreferenceKey: PreferenceKey {
    typealias Value = [HeightPreferenceData]
    
    static var defaultValue: [HeightPreferenceData] = []
    
    static func reduce(value: inout [HeightPreferenceData], nextValue: () -> [HeightPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

public struct MeasurableScrollView<Content: View>: View {
    
    @Binding public var size: CGSize
    var content: Content
    public init(size: Binding<CGSize>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._size = size
    }
    
    public var body: some View {
        ScrollView {
            content
            .background(
                GeometryReader { proxy in
                    Color.clear.preference(key: HeightPreferenceKey.self, value: [HeightPreferenceData(size: proxy.frame(in: .global).size)])
                }
            )
            .onPreferenceChange(HeightPreferenceKey.self) { prefs in
                size = prefs.first!.size
                print("Size is \(size)")
            }
        }
    }
}
