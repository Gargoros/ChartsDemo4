//
//  LineChartVerticalView.swift
//  ChartsDemo3
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import SwiftUI
import Charts

struct LineChartVerticalView: View {
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
            ForEach(chartItem.dailySales) {item in
                LineMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol(){
                    AnnotateLineAreaGraph(chartItem: chartItem)
                }
                
            }
            if isDragging {
                RuleMarkVerticalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
        }
        .chartYScale(domain: min...max)
        .modifier(ChartDragForVertical(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    LineChartVerticalView(chartItem: .constant(ChartItem.defaultChartItem))
}
