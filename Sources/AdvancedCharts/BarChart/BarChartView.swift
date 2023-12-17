//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 13.12.23.
//

import SwiftUI

struct BarChartView: View {
    // Text options
    var title: String = "Discofox Analytics"
    var subtitle: String? = "My personal Analytics"
    
    // Chart Style
    var radius: CGFloat = 25
        
    var body: some View {
        let data: [Double] = [2.0, 4.0, 8.0, 3.0, 1.5, 3.4, 8.0, 3.0, 1.5, 3.4, 1.5, 3.4]
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
            BarChartRow(data: data)
        }
        .padding()
        .background(.white)
        .cornerRadius(radius)
        .frame(height: 200)
        .shadow(radius: 10)
        .padding()
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
