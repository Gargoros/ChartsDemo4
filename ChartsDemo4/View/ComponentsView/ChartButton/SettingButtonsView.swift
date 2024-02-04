//
//  SettingButtonsView.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import SwiftUI

struct SettingButtonsView: View {
    //MARK: - Variables
    @Binding var chartItem: ChartItem
    
    //MARK: - Views
    var body: some View {
        Menu(
            content: {
                //MARK: - Bar Chart
                Button(action: {
                    withAnimation(){
                        chartItem.chartType = .bar
                    }
                }, label: {
                    Label("Bar Chart" ,systemImage: "chart.bar")
                        .imageScale(.large)
                })
                //MARK: - Line Chart
                Button(action: {
                    withAnimation(){
                        chartItem.chartType = .line
                    }
                }, label: {
                    Label("Line Chart" ,systemImage: "chart.line.uptrend.xyaxis.circle")
                        .imageScale(.medium)
                })
                //MARK: - Sector Chart
                Button(action: {
                    withAnimation(){
                        chartItem.chartType = .sector
                    }
                }, label: {
                    Label("Sector Chart", systemImage: "chart.pie")
                    
                })
                //MARK: - Edite Mode
                Button(action: {
                    withAnimation(){
                        chartItem.editMode.toggle()
                    }
                }, label: {
                    Label("Edite Mode", systemImage: "square.and.pencil")
                })
                //MARK: - Share mode
                Button(action: {
                    //TODO: - Implement sharing
                }, label: {
                    Label("Share", systemImage: "square.and.arrow.up")
                })
            },
            label: {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: 30))
                    .foregroundStyle(Color.orangeCustom)
            })
        
    }
}

#Preview {
    SettingButtonsView(
        chartItem: .constant(ChartItem.defaultChartItem)
    )
}
