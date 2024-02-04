//
//  TitleChartView.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 3.02.24.
//

import SwiftUI

struct TitleChartView: View {
    //MARK: - Variables
    @Binding var chartItem: ChartItem
    //MARK: - Views
    var body: some View {
        HStack (spacing: 20){
            
            if chartItem.editMode {
                //MARK: - Edit mode button
                TextField(chartItem.title, text: $chartItem.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    withAnimation(){
                        chartItem.editMode.toggle()
                    }
                }, label: {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 30))
                        .foregroundStyle(Color.orangeCustom)
                })
            }else {
                //MARK: - Title
                Text(chartItem.title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.2)
                
                Spacer()
                //MARK: - Color button
                ColorfulButtonView(
                    chartItem: $chartItem,
                    dim: 30,
                    offset: 10,
                    action: {})
                
                //MARK: - Orientation button
                OrientationChartButtonView(isVerticalChart: $chartItem.isVerticalChart)

                //MARK: - Settings menu button
                SettingButtonsView(chartItem: $chartItem)
            }
        }
    }
}

#Preview {
    TitleChartView(chartItem: .constant(ChartItem.defaultChartItem))
}
