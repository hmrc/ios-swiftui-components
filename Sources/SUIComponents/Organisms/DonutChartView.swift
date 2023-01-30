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
        var index: Int
        var startAngle: Double
        var endAngle: Double
        var colour: Color
        var viewHeight: Double
        var sliceWidth: Double
        var dash: [CGFloat]?
        var isLast: Bool
        var globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties
        
        @State private var stateEndAngle: Double = 0.0
                
        var body: some View {
            let firstOrLast: Bool = index == 0 || isLast
            let dashRequired: Bool = dash != nil
            
            ZStack {
                if dashRequired {
                    Circle()
                        .trim(from: firstOrLast ? 0.0 : startAngle, to: stateEndAngle)
                        .rotation(Angle(degrees: -90.0))
                        .stroke(Color.Named.white.colour, style: StrokeStyle(lineWidth: sliceWidth))
                        .frame(height: viewHeight)
                        .padding()
                        .animation(.linear(duration: globalStyleProperties.animationDuration).delay(Double(firstOrLast ? 0 : index)))
                        .if(!firstOrLast, transform: { circle in
                            circle.rotation3DEffect(.degrees(180.0), axis: (x: 0, y: 1, z: 0))
                        })
                        .onAppear {
                            withAnimation {
                                stateEndAngle = firstOrLast ? 1.0 : endAngle
                            }
                        }
                }
                
                
                Circle()
                    .trim(from: firstOrLast ? 0.0 : startAngle, to: stateEndAngle)
                    .rotation(Angle(degrees: -90.0))
                    .stroke(colour, style: StrokeStyle(lineWidth: sliceWidth, dash: dash ?? []))
                    .frame(height: viewHeight)
                    .padding()
                    .animation(.linear(duration: globalStyleProperties.animationDuration).delay(Double(firstOrLast ? 0 : index)))
                    .if(!firstOrLast, transform: { circle in
                        circle.rotation3DEffect(.degrees(180.0), axis: (x: 0, y: 1, z: 0))
                    })
                    .onAppear {
                        withAnimation {
                            stateEndAngle = firstOrLast ? 1.0 : endAngle
                        }
                    }
            }
        }
    }
    
    public struct DonutChartView: View {
        public let sliceData: [SliceData]
        public let globalStyleProperties: GlobalStylingProperties
        
        public init(sliceData: [SliceData], globalStyleProperties: GlobalStylingProperties) {
            self.sliceData = sliceData
            self.globalStyleProperties = globalStyleProperties
        }
        
        private func createSliceDetails(_ sliceData: [SliceData]) -> [SliceDetails] {
            let total: Double = sliceData.map({$0.amount}).reduce(0, +)
            
            var sum = 0.0
            var slices: [SliceDetails] = sliceData.enumerated().map { (idx, slice) in
                return SliceDetails.init(
                    amount: slice.amount,
                    endAngle: idx + 1 == sliceData.count ? (slice.amount * 360.0) / total : (sum += slice.amount * 360.0 / total, sum).1,
                    styleProperties: slice.styleProperties
                )
            }
            
            var sliceDetails: [SliceDetails] = []
            
            if slices.count > 1 {
                let first: SliceDetails = slices.removeFirst()
                let last: SliceDetails = slices.removeLast()
                
                sliceDetails = slices.sorted {
                    $0.endAngle > $1.endAngle
                }
                
                var _: () = sliceDetails.insert(contentsOf: [first], at: 0)
                var _: () = sliceDetails.append(contentsOf: [last])
            } else {
                sliceDetails = slices
            }
            
            return sliceDetails
        }
        
        public var body: some View {
            let sliceDetails: [SliceDetails] = createSliceDetails(sliceData)
        
            ZStack {
                ForEach(Array(sliceDetails.enumerated()), id: \.offset) { (idx, slice) in
                    Components.Organisms.DonutSliceView(
                        index: idx,
                        startAngle: 0.0,
                        endAngle: slice.endAngle / 360,
                        colour: slice.styleProperties.colour,
                        viewHeight: globalStyleProperties.viewHeight,
                        sliceWidth: globalStyleProperties.sliceWidth,
                        dash: slice.styleProperties.dashStyle,
                        isLast: idx == sliceDetails.count,
                        globalStyleProperties: globalStyleProperties
                    )
                }
            }
        }
        
        struct SliceDetails {
            var amount: Double
            var endAngle: Double
            var styleProperties: SliceStyleProperties
        }
        
        public struct SliceStyleProperties {
            public let colour: Color
            public let dashStyle: [CGFloat]?
            
            public init(colour: Color) {
                self.colour = colour
                self.dashStyle = nil
            }
            
            public init(colour: Color, dashed: Bool) {
                self.colour = colour
                self.dashStyle = dashed ? [3, 3] : nil
            }
            
            public init(colour: Color, dashStyle: [CGFloat]?) {
                self.colour = colour
                self.dashStyle = dashStyle
            }
        }
        
        public struct GlobalStylingProperties {
            public let animationDuration: Double
            public let viewHeight: Double
            public let sliceWidth: Double
            
            public init() {
                self.animationDuration = 1.0
                self.viewHeight = 200
                self.sliceWidth = 20
            }
            
            public init(animationDuration: Double) {
                self.animationDuration = animationDuration
                self.viewHeight = 200
                self.sliceWidth = 20
            }
            
            public init(animationDuration: Double, viewHeight: Double, sliceWidth: Double) {
                self.animationDuration = animationDuration
                self.viewHeight = viewHeight
                self.sliceWidth = sliceWidth
            }
        }
        
        public struct SliceData {
            public let amount: Double
            public let styleProperties: SliceStyleProperties
            
            public init(amount: Double, styleProperties: SliceStyleProperties) {
                self.amount = amount
                self.styleProperties = styleProperties
            }
        }
    }
}

struct DonutChartView_Previews: PreviewProvider {
    static var previews: some View {
        let sliceWidth: Double = 20
        let viewHeight: Double = 200
        
        Components.Organisms.DonutChartView(
            sliceData: [
                .init(
                    amount: 500,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.teal.colour
                    )
                ),
            ],
            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                animationDuration: 0.5,
                viewHeight: viewHeight,
                sliceWidth: sliceWidth
            )
        )
        
        Components.Organisms.DonutChartView(
            sliceData: [
                .init(
                    amount: 500,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.teal.colour
                    )
                ),
                .init(
                    amount: 500,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.blue.colour,
                        dashed: false
                    )
                ),
            ],
            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                animationDuration: 0.5,
                viewHeight: viewHeight,
                sliceWidth: sliceWidth
            )
        )
        
        Components.Organisms.DonutChartView(
            sliceData: [
                .init(
                    amount: 500,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.teal.colour
                    )
                ),
                .init(
                    amount: 500,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.blue.colour,
                        dashed: false
                    )
                ),
                .init(
                    amount: 500,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.pink.colour,
                        dashed: false
                    )
                ),
            ],
            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                animationDuration: 0.5,
                viewHeight: viewHeight,
                sliceWidth: sliceWidth
            )
        )
        
        Components.Organisms.DonutChartView(
            sliceData: [
                .init(
                    amount: 3000,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.green1.colour
                    )
                ),
                .init(
                    amount: 1000,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.yellow.colour,
                        dashStyle: [3, 3]
                    )
                ),
                .init(
                    amount: 1000,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.red.colour,
                        dashStyle: [3, 3]
                    )
                ),
                .init(
                    amount: 1000,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.green2.colour
                    )
                ),
                .init(
                    amount: 3000,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.pink.colour,
                        dashStyle: [3, 3]
                    )
                ),
                .init(
                    amount: 1000,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.blue.colour
                    )
                ),
            ],
            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties()
        )
    }
}

