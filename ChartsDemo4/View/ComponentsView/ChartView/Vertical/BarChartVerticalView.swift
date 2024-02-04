//
//  BarChartVerticalView.swift
//  ChartsDemo3
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import SwiftUI
import Charts

struct BarChartVerticalView: View {
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
                RuleMarkVerticalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
            ForEach(chartItem.dailySales) {item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
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
        .chartYScale(domain: min...max)
        .modifier(ChartDragForVertical(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    BarChartVerticalView(
        chartItem: .constant(ChartItem.defaultChartItem))
}
