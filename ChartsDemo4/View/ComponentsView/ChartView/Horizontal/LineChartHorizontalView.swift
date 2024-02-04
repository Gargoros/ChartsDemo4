//
//  LineChartHorizontalView.swift
//  ChartsDemo3
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import SwiftUI
import Charts

struct LineChartHorizontalView: View {
    //MARK: - Variables
    @Binding var chartItem: ChartItem
    
    var min: Double {
        return chartItem.min
    }
    var max: Double {
        return chartItem.max
    }
    @State var isDragging: Bool = false
    var salesOnSelectedDay: Double {
        getSalesOnSelectedDay(
            dailySales: chartItem.dailySales, selectedDay: chartItem.selectedDay)
    }
    //MARK: - Views
    var body: some View {
        Chart(){
            if isDragging {
                RuleMarkHorizontalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
            ForEach(chartItem.dailySales) {item in
                LineMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day)
                )
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol(){
                    AnnotateLineAreaGraph(chartItem: chartItem)
                }}
        }
        .chartXScale(domain: min...max)
        .modifier(ChartDragForHorizontal(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    LineChartHorizontalView(chartItem: .constant(ChartItem.defaultChartItem))
}
