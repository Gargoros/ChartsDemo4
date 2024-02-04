//
//  RuleMarkHorizontalView.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 3.02.24.
//

import SwiftUI
import Charts

struct RuleMarkHorizontalView: ChartContent {
    //MARK: - Variables
    let chartItem: ChartItem
    let salesOnSelectedDay: Double
    let lineColor: Color = Color.blue
    
    var selectedDay: String{
        return chartItem.selectedDay
    }
    var intMode: Bool {
        return chartItem.intMode
    }
    var precision: Int{
        return intMode ? 0 : 1
    }
    var specifier: String{
        return "%.\(precision)f"
    }
    //MARK: - Views
    var body: some ChartContent {
        RuleMark(x: .value("Sales", salesOnSelectedDay))
            .foregroundStyle(lineColor)
            .lineStyle(StrokeStyle(lineWidth: 3,  dash: [5]))
            .annotation(position: .topTrailing, spacing: 0, content: {
                Text("\(salesOnSelectedDay, specifier: specifier)")
                    .font(.subheadline)
                    .fontWeight(.bold)
            })
    }
}

