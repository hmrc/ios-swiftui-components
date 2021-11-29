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

public extension Components.Atoms {
    struct CustomButton<Content: View>: View {
        let content: Content
        let highlightedBackgroundColour: Color
        let normalBackgroundColour: Color
        let tapped: () -> Void
        
        @State private var selected: Bool = false {
            didSet {
                
                if selected {
                    delayedCall(0.1) {
                        tapped()
                        withAnimation {
                            selected = false
                        }
                    }
                }
            }
        }
        
        public init(normalBackgroundColour: Color, highlightedBackgroundColour: Color, tapped: @escaping () -> Void, @ViewBuilder content: () -> Content) {
            self.content = content()
            self.highlightedBackgroundColour = highlightedBackgroundColour
            self.normalBackgroundColour = normalBackgroundColour
            self.tapped = tapped
        }
        public var body: some View {
            content
                .background(selected ? highlightedBackgroundColour : normalBackgroundColour)
                .onTapGesture {
                    withAnimation {
                        selected = true
                    }
                }
        }
    }
}
