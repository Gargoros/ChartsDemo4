//
//  RandomArcFromColorList.swift
//  ExploringCharts
//
//  Created by MIKHAIL ZHACHKO on 31.01.24.
//

import SwiftUI

struct RandomArcFromColorListView: View {
    //MARK: - Variables
    let colors: Array<Color>
    let index: Int
    let minRadius: CGFloat
    let maxRadius: CGFloat
    let opacity: CGFloat
    
    let startTrim = Double.random(in: 0...0.5)
    let endTrim = Double.random(in: 0.6...1.0)
    
    var isValidIndex: Bool {
        return index < colors.count && index >= 0
    }
    var theIndex: Int {
        return isValidIndex ? index : 0
    }
    var count: CGFloat {
        return CGFloat(colors.count)
    }
    var color: Color {
        return colors[theIndex]
    }
    var endRadius: CGFloat {
        return minRadius + maxRadius / count
    }
    var rotate: CGFloat {
        return Double.random(in: 0...360)
    }
    
    //MARK: - Views
    var body: some View {
        ArcView(
            color: color.opacity(opacity),
            startRadius: minRadius,
            endRadius: endRadius,
            startTrim: startTrim,
            endTrim: endTrim,
            rotate: rotate)
    }
}

#Preview {
    RandomArcFromColorListView(
        colors: Color.defaultColor,
        index: 0,
        minRadius: 170,
        maxRadius: 180,
        opacity: 0.9)
}
