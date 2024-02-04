//
//  ChartDragForHorizontal.swift
//  ChartsDemo4
//
//  Created by MIKHAIL ZHACHKO on 3.02.24.
//

import SwiftUI

struct ChartDragForHorizontal: ViewModifier{
    
    @Binding var chartItem: ChartItem
    @Binding var isDragging: Bool
    
    var min: Double {
        return chartItem.min
    }
    var max: Double {
        return chartItem.max
    }
    
    func body(content: Content) -> some View {
        let innerProxyColor: Color = .clear
        
        content
            .chartOverlay{proxy in
                GeometryReader {innerProxy in
                        Rectangle()
                        .fill(innerProxyColor)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged(){value in
                                    if chartItem.editMode {
                                        isDragging = true
                                        let location = value.location
                                        let (sales, newDay) = proxy.value(at: location, as: (Double, String).self) ?? (-1, "error")
                                        // Update selected day
                                        chartItem.selectedDay = newDay
                                        setSalesOfSelectedDay(
                                            dailySales: &chartItem.dailySales,
                                            selectedDay: chartItem.selectedDay,
                                            sales: sales,
                                            min: min,
                                            max: max)
                                    }
                                }
                                .onEnded(){value in
                                       isDragging = false
                                    
                                }
                        )
                }
            }
    }
}
