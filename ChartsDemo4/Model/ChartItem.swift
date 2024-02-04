//
//  ChartItem.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 3.02.24.
//

import SwiftUI

struct ChartItem: Identifiable{
    let id: UUID = UUID()
    
    var title: String
    var selectedDay: String
    
    var dailySales: Array<DailySales>
    var barColor: Array<Color>
    var lineAreaColor: Color
    
    var editMode: Bool
    var isVerticalChart: Bool
    var intMode: Bool
    var showBorder : Bool
    
    var min: Double
    var max: Double
    
    var chartType: ChartType
    
    static let defaultChartItem: ChartItem = .init(
        title: "Daily Sales",
        selectedDay: "Sun",
        dailySales: defaultDailySales,
        barColor: Color.defaultColor,
        lineAreaColor: Color.purple,
        editMode: false,
        isVerticalChart: true,
        intMode: true,
        showBorder: false,
        min: 0.0,
        max: 1000.0,
        chartType: ChartType.bar
    )
}
