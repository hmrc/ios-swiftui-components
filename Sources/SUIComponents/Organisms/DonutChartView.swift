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
                        .trim(from: 0.0, to: stateEndAngle)
                        .rotation(Angle(degrees: -90.0))
                        .stroke(Color.Named.white.colour, style: StrokeStyle(lineWidth: sliceWidth))
                        .padding()
                        .position(x: viewHeight / 2, y: viewHeight / 2)
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
                    .trim(from: 0.0, to: stateEndAngle)
                    .rotation(Angle(degrees: -90.0))
                    .stroke(colour, style: StrokeStyle(lineWidth: sliceWidth, dash: dash ?? []))
                    .padding()
                    .position(x: viewHeight / 2, y: viewHeight / 2)
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
        public let sliceDetails: [SliceDetails]
        public let globalStyleProperties: GlobalStylingProperties
        
        public init(sliceDetails: [SliceDetails], globalStyleProperties: GlobalStylingProperties) {
            self.sliceDetails = sliceDetails
            self.globalStyleProperties = globalStyleProperties
        }
        
        public var body: some View {
            ZStack {
                ForEach(Array(sliceDetails.enumerated()), id: \.offset) { (idx, slice) in
                    Components.Organisms.DonutSliceView(
                        index: idx,
                        endAngle: slice.endAngle,
                        colour: slice.colour,
                        viewHeight: globalStyleProperties.viewHeight,
                        sliceWidth: globalStyleProperties.sliceWidth,
                        dash: slice.dashStyle,
                        isLast: idx == sliceDetails.count,
                        globalStyleProperties: globalStyleProperties
                    )
                    .drawingGroup()
                }
            }
            .frame(
                width: globalStyleProperties.viewHeight,
                height: globalStyleProperties.viewHeight
            )
        }
        
        public struct SliceDetails {
            public var key: String
            public var endAngle: Double
            public var colour: Color
            public var dashStyle: [CGFloat]?
        }
        
        public struct SliceStyleProperties {
            public let colour: Color
            public let smallColour: Color
            public let dashStyle: [CGFloat]?
            
            public init(colour: Color) {
                self.colour = colour
                self.smallColour = colour
                self.dashStyle = nil
            }
            
            public init(colour: Color, smallColour: Color, dashed: Bool) {
                self.colour = colour
                self.smallColour = smallColour
                self.dashStyle = dashed ? [3, 3] : nil
            }
            
            public init(colour: Color, smallColour: Color, dashStyle: [CGFloat]?) {
                self.colour = colour
                self.smallColour = smallColour
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
            public let key: String
            public let amount: Double
            public let styleProperties: SliceStyleProperties
            
            public init(key: String, amount: Double, styleProperties: SliceStyleProperties) {
                self.key = key
                self.amount = amount
                self.styleProperties = styleProperties
            }
        }
    }
}

extension Array where Element == Components.Organisms.DonutChartView.SliceData {
    public func convertToSliceDetails() -> [Components.Organisms.DonutChartView.SliceDetails] {
        var sum = 0.0
        
        let total = self.map({$0.amount}).reduce(0, +)
        
        let slices: [Components.Organisms.DonutChartView.SliceDetails] = self.enumerated().map { (idx, slice) in
            let endAngle = (slice.amount * 1.0) / total
            let isTooSmall = endAngle < 0.035
            
            return Components.Organisms.DonutChartView.SliceDetails.init(
                key: slice.key,
                endAngle: (slice.amount * 1.0) / total,
                colour: isTooSmall ? slice.styleProperties.smallColour : slice.styleProperties.colour,
                dashStyle: isTooSmall ? [] : slice.styleProperties.dashStyle
            )
        }
        
        let reversedSegments = slices.sorted(by: {$0.endAngle < $1.endAngle})
        
        let summedSegments = reversedSegments.enumerated().map { (idx, slice) in
            if (idx == 0) {
                sum = slice.endAngle
            }
            
            return Components.Organisms.DonutChartView.SliceDetails(
                key: slice.key,
                endAngle: idx == 0 ? slice.endAngle : (sum += slice.endAngle, sum).1,
                colour: slice.colour,
                dashStyle: slice.dashStyle
            )
        }

        return summedSegments.reversed()
    }
}


struct DonutChartView_Previews: PreviewProvider {
    static var previews: some View {
        let sliceWidth: Double = 20
        let viewHeight: Double = 200
        
        let sliceData: [Components.Organisms.DonutChartView.SliceData] = [
            .init(
                key: "Take home",
                amount: 2046.00,
                styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                    colour: Color.Named.teal.colour,
                    smallColour: Color.Named.teal.colour,
                    dashed: false
                )
            ),
            .init(
                key: "Income tax",
                amount: 545.00,
                styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                    colour: Color.Named.blue.colour,
                    smallColour: Color.Named.blue.colour,
                    dashed: false
                )
            ),
            .init(
                key: "national insurance",
                amount: 125.00,
                styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                    colour: Color.Named.blue.colour,
                    smallColour: Color.Named.pink.colour,
                    dashed: true
                )
            )]
                
        Components.Organisms.DonutChartView(
            sliceDetails: sliceData.convertToSliceDetails(),
            globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                animationDuration: 0.5,
                viewHeight: viewHeight,
                sliceWidth: sliceWidth
            )
        )
    }
}

