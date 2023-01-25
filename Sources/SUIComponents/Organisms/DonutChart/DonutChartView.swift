//
//  SwiftUIView.swift
//  
//
//  Created by Chris J W Walker on 17/01/2023.
//

import SwiftUI

struct DonutChartView: View {
    let donutData: DonutData
    let boxSize: Double
    
    var body: some View {
        var sum = 0.0
        let slices: [SliceDetails] = donutData.sliceData.map {
            return SliceDetails.init(
                key: $0.key,
                amount: $0.amount,
                colour: $0.colour,
                endAngle: (sum += $0.amount * 360.0 / donutData.total, sum).1
            )
        }
        
        HStack {
            Spacer()
            ZStack {
                ForEach(Array(slices.enumerated()), id: \.offset) { (idx, slice) in
                    ArcView(
                        startAngle: idx == 0 ? 0.0 : slices[idx - 1].endAngle,
                        endAngle: slice.endAngle,
                        colour: slice.colour,
                        boxSize: boxSize
                    )
                }
                CenterCircle(boxSize: boxSize)
            }
            Spacer()
        }
    }
}

struct DonutChartView_Previews: PreviewProvider {
    static var previews: some View {
        DonutChartView(
            donutData: .init(
                total: 4636,
                sliceData: [
                    .init(key: "Total after tax", amount: 3781, colour: Color.Named.teal.colour),
                    .init(key: "Income Tax paid", amount: 855, colour: Color.Named.blue.colour),
                ]
            ),
            boxSize: 200
        )
        
        DonutChartView(
            donutData: .init(
                total: 1000,
                sliceData: [
                    .init(key: "National Insurance", amount: 150, colour: Color.Named.pink.colour),
                    .init(key: "Total after tax", amount: 700, colour: Color.Named.teal.colour),
                    .init(key: "Income Tax paid", amount: 150, colour: Color.Named.blue.colour),
                ]
            ),
            boxSize: 200
        )
        
        DonutChartView(
            donutData: .init(
                total: 10000,
                sliceData: [
                    .init(key: "Housing", amount: 3000, colour: Color.Named.green1.colour),
                    .init(key: "Company car", amount: 1000, colour: Color.Named.yellow.colour),
                    .init(key: "Health", amount: 1000, colour: Color.Named.red.colour),
                    .init(key: "Life Insurace", amount: 1000, colour: Color.Named.green2.colour),
                    .init(key: "Pension", amount: 3000, colour: Color.Named.pink.colour),
                    .init(key: "PTO", amount: 1000, colour: Color.Named.blue.colour),
                ]
            ),
            boxSize: 200
        )
    }
}
