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
    private struct DonutSliceView: View {
        var startAngle: Double
        var endAngle: Double
        var colour: Color
        var viewHeight: Double
        var sliceWidth: Double
        var dash: [CGFloat]?
        
        var body: some View {
            if (dash == nil) {
                Circle()
                    .trim(from: startAngle, to: endAngle)
                    .rotation(Angle(degrees: -90.0))
                    .stroke(colour, style: StrokeStyle(lineWidth: sliceWidth))
                    .frame(height: viewHeight)
                    .padding()
            } else {
                Circle()
                    .trim(from: startAngle, to: endAngle)
                    .rotation(Angle(degrees: -90.0))
                    .stroke(colour, style: StrokeStyle(lineWidth: sliceWidth, dash: dash!))
                    .frame(height: viewHeight)
                    .padding()
            }
        }
    }
    
    public struct DonutChartView: View {
        public let donutData: DonutData
        
        public init(donutData: DonutData) {
            self.donutData = donutData
        }

        public var body: some View {
            var sum = 0.0
            let slices: [SliceDetails] = donutData.sliceData.map {
                return SliceDetails.init(
                    key: $0.key,
                    amount: $0.amount,
                    endAngle: (sum += $0.amount * 360.0 / donutData.total, sum).1,
                    styleProperties: $0.styleProperties
                )
            }

            ZStack {
                ForEach(Array(slices.enumerated()), id: \.offset) { (idx, slice) in
                    Components.Organisms.DonutSliceView(
                        startAngle: idx == 0 ? 0.0 : slices[idx - 1].endAngle / 360,
                        endAngle: slice.endAngle / 360,
                        colour: slice.styleProperties.colour,
                        viewHeight: slice.styleProperties.viewHeight,
                        sliceWidth: slice.styleProperties.sliceWidth,
                        dash: slice.styleProperties.dashStyle
                    )
                }
            }
        }
        
        struct SliceDetails {
            var key: String
            var amount: Double
            var endAngle: Double
            var styleProperties: SliceStyleProperties
        }
        
        public struct SliceStyleProperties {
            public let colour: Color
            public let dashStyle: [CGFloat]?
            public let viewHeight: Double
            public let sliceWidth: Double
            
            public init(colour: Color, dashStyle: [CGFloat]?, viewHeight: Double, sliceWidth: Double) {
                self.colour = colour
                self.dashStyle = dashStyle
                self.viewHeight = viewHeight
                self.sliceWidth = sliceWidth
            }
        }
        
        
        public struct SliceData {
            public let key: String
            public let amount: Double
            public let styleProperties: SliceStyleProperties
            
            public init(key: String, amount: Double, styleProperties: SliceStyleProperties) {
                self.key = key
                self.amount = amount
                self.styleProperties = styleProperties
            }
        }
        
        public struct DonutData {
            public let total: Double
            public let sliceData: [SliceData]
            
            public init(total: Double, sliceData: [SliceData]) {
                self.total = total
                self.sliceData = sliceData
            }
        }
    }
}

struct DonutChartView_Previews: PreviewProvider {
    static var previews: some View {
        let sliceWidth: Double = 20
        let viewHeight: Double = 200
        
        Components.Organisms.DonutChartView(
            donutData: .init(
                total: 1000,
                sliceData: [
                    .init(
                        key: "Total after tax",
                        amount: 500,
                        styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                            colour: Color.Named.teal.colour,
                            dashStyle: nil,
                            viewHeight: viewHeight,
                            sliceWidth: sliceWidth
                        )
                    ),
                    .init(
                        key: "Income Tax paid",
                        amount: 500,
                        styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                            colour: Color.Named.blue.colour,
                            dashStyle: [3, 3],
                            viewHeight: viewHeight,
                            sliceWidth: sliceWidth
                        )
                    ),
                ]
            )
        )
    }
}

