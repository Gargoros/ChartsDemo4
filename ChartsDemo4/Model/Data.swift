//
//  Data.swift
//  ChartsDemo3
//
//  Created by MIKHAIL ZHACHKO on 1.02.24.
//

import Foundation

struct DailySales: Identifiable{
    let id: UUID = UUID()
    let day: String
    let sales: Double
}

func setSalesOfSelectedDay(dailySales: inout Array<DailySales>,selectedDay: String, sales: Double, min: Double, max: Double)  {
    if let i = dailySales.firstIndex(where: { $0.day == selectedDay}) {
        var newSales: Double
        if sales <= min {
            newSales = min
        }else if sales >= max{
            newSales = max
        }else{
            newSales = sales
        }
        dailySales[i] = DailySales(day: dailySales[i].day , sales: newSales)
    }
}

func getSalesOnSelectedDay(dailySales: Array<DailySales>, selectedDay: String) -> Double{
    if let i = dailySales.firstIndex(where: { $0.day == selectedDay}){
        return dailySales[i].sales
    }
    else{
        return 0
    }
}

let defaultDailySales: Array<DailySales> = [
    .init(day: "Sun", sales: 955),
    .init(day: "Mon", sales: 432),
    .init(day: "Tue", sales: 123),
    .init(day: "Wed", sales: 689),
    .init(day: "Thu", sales: 123),
    .init(day: "Fri", sales: 22),
    .init(day: "Sat", sales: 543),
]
