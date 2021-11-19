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
    public struct TabBarView: View {
        private struct Colours {
            static let backgroundColour = Color("tabBarBackground", bundle: .module)
            static let highlightViewColour = Color("tabBarHighlightViewColour", bundle: .module)
            static let titleColourNormal = Color("tabBarTitleColourNormal", bundle: .module)
            static let titleColourSelected = Color("tabBarTitleColourSelected", bundle: .module)
        }
        @State var selectedSegmentIndex: Int = 0
        
        public struct Model {
            public struct Segment: Hashable {
                public var hashValue: Int {
                    title.hashValue
                }
                public func hash(into hasher: inout Hasher) {
                    title.hash(into: &hasher)
                }
                public static func == (lhs: Components.Molecules.TabBarView.Model.Segment, rhs: Components.Molecules.TabBarView.Model.Segment) -> Bool {
                    lhs.title == rhs.title
                }

                let title: String
                let startSelected: Bool
                let action: (() -> Void)

                public init(title: String, startSelected: Bool = false, action: @escaping (() -> Void)) {
                    self.title = title
                    self.startSelected = startSelected
                    self.action = action
                }
            }

            let segments: [Segment]

            public init(_ segments: [Segment]) {
                self.segments = segments
            }
        }

        let model: Model
       
    
        public init(_ model: Model) {
            self.model = model
        }

        public var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: .spacer8) {
                    ForEach(model.segments, id: \.self) { segmentModel in
                        Button(action: {
                            print("Segment `\(segmentModel.title)` tapped")
                        }, label: {
                            Text(segmentModel.title)
                                .bold()
                                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)
                                .foregroundColor(Colours.titleColourNormal)
                                .padding(10)
                        }).background(
                            GeometryReader { proxy in
                                proxy.frame(in: .local)
                            }
                        )
                        
                    }
                }
                
                .background(Colours.backgroundColour)
            }.frame(maxWidth: .infinity)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(
            alignment: .leading,
            spacing: .spacer16,
            content: {
                Components.Molecules.InsetView(
                    model: .init(
                        body: "Body"
                    )
                )
            }
        ).frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .leading
        ).background(Color.gray)
    }
}
