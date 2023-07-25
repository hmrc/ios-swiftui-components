/*
 * Copyright 2023 HM Revenue & Customs
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

extension Components.Organisms {
    public struct DonutLegendView: View {
        public let donutLegendItems: [DonutLegendItem]
        public let vStackSpacing: CGFloat
        
        public init(donutLegendItems: [DonutLegendItem], vStackSpacing: CGFloat) {
            self.donutLegendItems = donutLegendItems
            self.vStackSpacing = vStackSpacing
        }
            
        public var body: some View {
            VStack(alignment: .leading, spacing: vStackSpacing) {
                ForEach(donutLegendItems, id: \.id) { legendItem in
                    HStack {
                        if legendItem.dashed {
                            Stripes(
                                config: StripesConfig(
                                    background: Color.Named.white.colour,
                                    foreground: legendItem.colour,
                                    degrees: 180.0,
                                    barWidth: 3,
                                    barSpacing: 2
                                )
                            ).frame(
                                width: 20,
                                height: 20
                            )
                        } else {
                            Rectangle()
                                .fill(legendItem.colour)
                                .aspectRatio(1.0, contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
                        
                        Text(legendItem.title)
                            .style(.body)
                        
                        Spacer()
                        
                        Text(legendItem.value)
                            .style(.body)
                    }
                }
            }
            .padding()
        }
        
        public struct DonutLegendItem: Identifiable {
            public let id = UUID()
            public let colour: Color
            public let title: String
            public let value: String
            public let dashed: Bool
            
            public init(colour: Color, title: String, value: String, dashed: Bool = false) {
                self.colour = colour
                self.title = title
                self.value = value
                self.dashed = dashed
            }
        }
    }
}

struct DonutLegendView_Previews: PreviewProvider {
    static var previews: some View {
        Components.Organisms.DonutLegendView(
            donutLegendItems: [
                Components.Organisms.DonutLegendView.DonutLegendItem(
                    colour: Color.Named.teal.colour,
                    title: "Total after Tax",
                    value: "£1041.00"
                ),
                Components.Organisms.DonutLegendView.DonutLegendItem(
                    colour: Color.Named.blue.colour,
                    title: "Income Tax paid",
                    value: "£315.00"
                ),
                Components.Organisms.DonutLegendView.DonutLegendItem(
                    colour: Color.Named.pink.colour,
                    title: "National Insurance Paid",
                    value: "£189.00",
                    dashed: true
                )
            ],
            vStackSpacing: 8
        )
    }
}
