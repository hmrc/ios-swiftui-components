//
//  SwiftUIView.swift
//  
//
//  Created by Chris J W Walker on 24/02/2023.
//

import SwiftUI

struct PAYEEmploymentMockupView: View {
    var body: some View {
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
                amount: 25.00,
                styleProperties: Components.Organisms.DonutChartView.SliceStyleProperties(
                    colour: Color.Named.blue.colour,
                    smallColour: Color.Named.pink.colour,
                    dashed: true
                )
            )
        ]
                
        let sliceDetails = sliceData.convertToSliceDetails()
        
        let niDetails = sliceDetails.first(where: {$0.key == "national insurance"})
        
        VStack {
            Components.Organisms.DonutChartView(
                sliceDetails: sliceDetails,
                globalStyleProperties: Components.Organisms.DonutChartView.GlobalStylingProperties(
                    animationDuration: 0.5,
                    viewHeight: viewHeight,
                    sliceWidth: sliceWidth
                )
            )
            
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
                        colour: niDetails!.colour,
                        title: "National Insurance Paid",
                        value: "£189.00",
                        dashed: niDetails!.endAngle > 0.035
                    )
                ],
                vStackSpacing: 8
            )
        }
    }
}

struct PAYEEmploymentMockupView_Previews: PreviewProvider {
    static var previews: some View {
        PAYEEmploymentMockupView()
    }
}
