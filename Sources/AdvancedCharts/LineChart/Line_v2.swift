//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 05.09.2024.
//

import SwiftUI

struct Line_v2: View {
    let data = [LineData(date: "1", value: 2),
                LineData(date: "2", value: 1),
                LineData(date: "3", value: 4),
                LineData(date: "4", value: 3),
                LineData(date: "5", value: 5),
                LineData(date: "6", value: 2)]
    
    var maxPoint: LineData {
        guard let maxPoint = self.data.max(by: {$0.value < $1.value}) else {
            return LineData(date: "", value: 0)
        }
        return maxPoint
    }
    var minPoint: LineData {
        guard let minPoint = self.data.min(by: {$0.value < $1.value}) else {
            return LineData(date: "", value: 0)
        }
        return minPoint
    }
    var body: some View {
        Text(minPoint.date)
    }
}

#Preview {
    Line_v2()
}
