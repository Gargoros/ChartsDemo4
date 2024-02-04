//
//  ArcView.swift
//  ExploringCharts
//
//  Created by MIKHAIL ZHACHKO on 31.01.24.
//

import SwiftUI

struct ArcView: View {
    
    //MARK: - Variables
    let color: Color
    let startRadius: CGFloat
    let endRadius: CGFloat
    let startTrim: CGFloat
    let endTrim: CGFloat
    let rotate: CGFloat
    @State private var finalTrim: CGFloat = 0
    
    var lineWidth: CGFloat {
        return endRadius - startRadius
    }
    var finalRadius: CGFloat {
        return endRadius - lineWidth
    }
    
    //MARK: - Views
    var body: some View {
        Circle()
            .trim(from: startTrim, to: finalTrim)
            .stroke(color,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round)
            )
            .rotationEffect(.degrees(rotate))
            .frame(
                width: finalRadius,
                height: finalRadius
            )
            .onAppear(){
                withAnimation(){
                    finalTrim = endTrim
                }
            }
    }
}

#Preview {
    ZStack {
        ArcView(
            color: .darkOrange,
            startRadius: 90,
            endRadius: 100,
            startTrim: 0.25,
            endTrim: 0.75,
        rotate: 30)
        Circle()
            .stroke()
            .frame(width: 100, height: 100)
    }
}
