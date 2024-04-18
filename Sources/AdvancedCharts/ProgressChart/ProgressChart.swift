//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.12.23.
//

import SwiftUI

public struct ProgressChart: View {
    var radius: CGFloat = 25
    var title: String = "Discofox Analytics"
    var subtitle: String? = "My personal Analytics"
    public var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(subtitle ?? "")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            ProgressChartRow()
        }
        .padding()
        .background(.white)
        .cornerRadius(radius)
        .frame(width: nil, height: 200)
        .shadow(radius: 10)
        .padding()
    }
}

struct ProgressChart_Previews: PreviewProvider {
    static var previews: some View {
        ProgressChart()
    }
}
