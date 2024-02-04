//
//  BarChartHorizontalView.swift
//  ChartsDemo3
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import SwiftUI
import Charts

struct BarChartHorizontalView: View {
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
                BarMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day)
                )
                .foregroundStyle(by: .value("Day", item.day))
                .annotation(
                    position: .top,
                    content: {
                        Image(systemName: "circle")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.red)
                            .opacity(chartItem.editMode ? 0.8 : 0.0)
                    })
            }
        }
        .chartLegend(position: .bottom, alignment: .center, spacing: 10)
        .chartForegroundStyleScale(range: chartItem.barColor)
        .chartXScale(domain: min...max)
        .modifier(ChartDragForHorizontal(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    BarChartHorizontalView(chartItem: .constant(ChartItem.defaultChartItem))
}
