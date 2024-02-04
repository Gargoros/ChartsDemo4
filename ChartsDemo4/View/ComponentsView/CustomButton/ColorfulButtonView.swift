//
//  ColorfulButtonView.swift
//  ExploringCharts
//
//  Created by MIKHAIL ZHACHKO on 31.01.24.
//

import SwiftUI

struct ColorfulButtonView: View {
    //MARK: - Variables
    @Binding var chartItem: ChartItem
    let dim: CGFloat
    let offset: CGFloat
    let action: () -> Void
    
    @State private var flip: Bool = false
    var count: CGFloat{
        return CGFloat(chartItem.barColor.count)
    }
    var factor: CGFloat {
        return (dim - offset) / count
    }
    var lastColor: Color{
        return chartItem.barColor.last ?? .black
    }
    
    func minRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i) + offset
    }
    func maxRadius(i: Int, offset: CGFloat) -> CGFloat {
        return factor * CGFloat(i + 1) + offset
    }
    
    //MARK: - Views
    var body: some View {
        ZStack(){
            if chartItem.chartType == .bar{
                ForEach(0 ..< chartItem.barColor.count, id: \.self) { item in
                    RandomArcFromColorListView(
                        colors: chartItem.barColor,
                        index: item,
                        minRadius: minRadius(i: item, offset: offset),
                        maxRadius: maxRadius(i: item, offset: offset),
                        opacity: 0.9)
                    Circle()
                        .stroke(lastColor, lineWidth: factor)
                        .frame(width: dim, height: dim)
                }
            }
            else {
                Circle()
                    .fill(chartItem
                        .lineAreaColor
                        .gradient)
                    .frame(width: dim, height: dim)
            }
        }
        .rotation3DEffect(
            flip ? .zero : .degrees(180),
            axis: (
                x: Double.random(in: -1...1),
                y: Double.random(in: -1...1),
                z: 0.0)
        )
        .onTapGesture {
            if chartItem.chartType == .bar{
                chartItem.barColor = Color.randomColorsN(n: chartItem.barColor.count)
            }
            else {
                chartItem.lineAreaColor = Color.randomColorsN(n: chartItem.barColor.count).first ?? .darkRed
            }
            
            withAnimation(){
                flip.toggle()
            }
            //MARK: Call Action
            action()
        }
    }
}

#Preview {
    ColorfulButtonView(
        chartItem: .constant(ChartItem.defaultChartItem),
        dim: 40,
        offset: 10,
        action: {})
}
