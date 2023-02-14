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
                        .trim(from: startAngle, to: stateEndAngle)
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
                                stateEndAngle = endAngle
                            }
                        }
                }
                
                
                Circle()
                    .trim(from: startAngle, to: stateEndAngle)
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
                            stateEndAngle = endAngle
                        }
                    }
            }
        }
    }
    
    public struct DonutChartView: View {
        public let sliceData: [SliceData]
        public let globalStyleProperties: GlobalStylingProperties
        public let total: Double
        
        public init(sliceData: [SliceData], globalStyleProperties: GlobalStylingProperties) {
            self.sliceData = sliceData
            self.globalStyleProperties = globalStyleProperties
            self.total = sliceData.map({$0.amount}).reduce(0, +)
        }
        
        private func createSliceDetails(_ sliceData: [SliceData], _ total: Double) -> [SliceDetails] {
            var sum = 0.0
            let slices: [SliceDetails] = sliceData.enumerated().map { (idx, slice) in
                return SliceDetails.init(
                    amount: slice.amount,
                    endAngle: (slice.amount * 1.0) / total,
                    
                    styleProperties: slice.styleProperties
                )
            }
            
            let reversedSegments = slices.sorted(by: {$0.amount < $1.amount})
            
            let summedSegments = reversedSegments.enumerated().map { (idx, slice) in
                if (idx == 0) {
                    sum = slice.endAngle
                }
                
                return SliceDetails(
                    amount: slice.amount,
                    endAngle: idx == 0 ? slice.endAngle : (sum += slice.endAngle, sum).1,
                    styleProperties: slice.styleProperties
                )
            }

            return summedSegments.reversed()
        }
        
        public var body: some View {
            let sliceDetails: [SliceDetails] = createSliceDetails(sliceData, total)
        
            ZStack {
                ForEach(Array(sliceDetails.enumerated()), id: \.offset) { (idx, slice) in
                    Components.Organisms.DonutSliceView(
                        index: idx,
                        startAngle: 0.0,
                        endAngle: slice.endAngle,
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
                    amount: 1041.00,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.teal.colour
                    )
                ),
                .init(
                    amount: 315.00,
                    styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                        colour: Color.Named.blue.colour,
                        dashed: false
                    )
                ),
                .init(
                    amount: 189.00,
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
                        colour: Color.Named.green1.colour,
                        dashStyle: nil
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
                        colour: Color.Named.green2.colour,
                        dashStyle: nil
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
                        colour: Color.Named.blue.colour,
                        dashStyle: nil
                    )
                ),
            ],
            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                animationDuration: 1.0,
                viewHeight: 200,
                sliceWidth: 30.0
            )
        )
    }
}

