//
//  AreaChartVerticalView.swift
//  ChartsDemo3
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import SwiftUI
import Charts

struct SectorChartVerticalView: View {
    //MARK: - Variables
    @Binding var chartItem: ChartItem
    //MARK: - Views
    var body: some View {
        Chart(){
            ForEach(chartItem.dailySales) {item in
                SectorMark(
                    angle: .value("Sales", item.sales),
                    angularInset: 1.2
                )
                .cornerRadius(8)
                .foregroundStyle(by: .value("Day", item.day))
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColor)
        .chartLegend(position: .bottom, alignment: .center, spacing: 10)
    }
}

#Preview {
    SectorChartVerticalView(chartItem: .constant(ChartItem.defaultChartItem))
}
