//
//  AnnotateLineAreaGraph.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 3.02.24.
//

import SwiftUI

struct AnnotateLineAreaGraph: View {
    //MARK: - Variables
    let chartItem: ChartItem
    //MARK: - Views
    var body: some View {
        VStack(){
            if chartItem.editMode{
                Image(systemName: "square.and.pencil")
                    .foregroundStyle(chartItem.lineAreaColor)
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(chartItem.lineAreaColor)
                    )
                    .opacity(0.7)
            }else{
                Circle()
                    .fill(chartItem.lineAreaColor)
                    .frame(width: 7, height: 7)
            }
        }
    }
}

#Preview {
    AnnotateLineAreaGraph(chartItem: ChartItem.defaultChartItem)
}
