//
//  OrientationChartButtonView.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 2.02.24.
//

import SwiftUI

struct OrientationChartButtonView: View {
    //MARK: - Variables
    @Binding var isVerticalChart: Bool
    //MARK: - Views
    var body: some View {
        Button(action: {
            withAnimation(){
                isVerticalChart.toggle()
            }
        }, label: {
            Image(systemName: "chart.bar.doc.horizontal")
                .rotationEffect(.degrees(isVerticalChart ? -90 : 0))
                .font(.system(size: 30))
                .foregroundStyle(Color.orange)
        })
    }
}

#Preview {
    OrientationChartButtonView(isVerticalChart: .constant(true))
}
