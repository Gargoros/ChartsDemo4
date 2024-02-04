//
//  ContentView.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import SwiftUI
import Charts


struct MainView: View {
    
    //MARK: - Variables
    @State var chartItem: ChartItem = .defaultChartItem
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading

    
    
    
    //MARK: - Views
    var body: some View {
        VStack {
            //MARK: - Title and Setting Buttons
            TitleChartView(chartItem: $chartItem)
            
            //MARK: - Charts
            if chartItem.isVerticalChart {
                switch(chartItem.chartType){
                case .bar:
                    BarChartVerticalView(chartItem: $chartItem)
                case .line:
                    LineChartVerticalView(chartItem: $chartItem)
                case .sector:
                    SectorChartVerticalView(chartItem: $chartItem)
                }
            }
            else{
                switch(chartItem.chartType){
                case .bar:
                    BarChartHorizontalView(chartItem: $chartItem)
                case .line:
                    LineChartHorizontalView(chartItem: $chartItem)
                case .sector:
                    SectorChartHorizontalView(chartItem: $chartItem)
                }}
        }
        .padding()
    }
}


#Preview {
    MainView()
}
