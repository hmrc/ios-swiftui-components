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

extension Components.Atoms {
    struct HeightPreferenceData: Equatable {
        let height: CGFloat
    }
    struct HeightPreferenceKey: PreferenceKey {
        typealias Value = [HeightPreferenceData]

        static var defaultValue: [HeightPreferenceData] = []
        
        static func reduce(value: inout [HeightPreferenceData], nextValue: () -> [HeightPreferenceData]) {
            value.append(contentsOf: nextValue())
        }
    }
    
    public struct ImageAligningHStack<LeftContent: View, RightContent: View>: View {
        public init(spacing: CGFloat = 12, @ViewBuilder leftContent: () -> LeftContent, @ViewBuilder rightContent: () -> RightContent) {
            self.leftContent = leftContent()
            self.rightContent = rightContent()
            self.spacing = spacing
        }
        
        @State private var leftContentHeight: CGFloat?
        @State private var rightContentHeight: CGFloat?
        
        let spacing: CGFloat
        let leftContent: LeftContent
        let rightContent: RightContent
        
        @State private var alignment: VerticalAlignment = .top

        public var body: some View {
            HStack (
                alignment: alignment,
                spacing: spacing
            ) {
                leftContent.background(GeometryReader { proxy in
                    Color.clear.preference(key: HeightPreferenceKey.self, value: [HeightPreferenceData(height: proxy.frame(in: .local).height)])
                })
                rightContent.background(GeometryReader { proxy in
                    Color.clear.preference(key: HeightPreferenceKey.self, value: [HeightPreferenceData(height: proxy.frame(in: .local).height)])
                })
            }.onPreferenceChange(HeightPreferenceKey.self) { prefs in
                guard prefs.count == 2 else { return }
                let leftHeight = prefs[0].height
                let rightHeight = prefs[1].height
                
                alignment = leftHeight > rightHeight ? .center : .top
            }
        }
    }
}
