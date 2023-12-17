//
//  SwiftUIView.swift
//  
//
//  Created by Кирилл Зверев on 12.12.23.
//

import SwiftUI



public struct Bar: View {
    // Dimensions
    var width: CGFloat
    var height: CGFloat
    @State var scaleValue: Double = 0
    
    // Values
    var value: Double
    var mark: String {
        return String(Int(self.value))
    }
    
    // Style
    var color: Color?
    let defaultColor: Color = .red
    var blur: CGFloat?
    var cornerRadius: CGFloat?
    
    public var body: some View {
        VStack(spacing: 5) {
            Text(mark)
                .font(.caption)
                .fontWeight(.bold)
//                .frame(height: 10)
            ZStack {
                if blur != nil {
                    RoundedRectangle(cornerRadius: cornerRadius ?? 3)
                        .fill(color ?? .red)
                        .blur(radius: blur!)
                }
                RoundedRectangle(cornerRadius: cornerRadius ?? 3)
                    .fill(color ?? .red)
            }
            .frame(width: width)
            .frame(height: scaleValue)
            .onAppear {
                withAnimation(.easeOut(duration: 0.5)) {
                    self.scaleValue = self.height
                }
            }
        }
    }
}

#if DEBUG
struct Bar_Previews : PreviewProvider {
    static var previews: some View {
        Bar(width: 20, height: 200, value: 320, blur: 5)
    }
}
#endif

/*
public struct BarChartCell : View {
    var value: Double
    var index: Int = 0
    var width: Float
    var numberOfDataPoints: Int
    var cellWidth: Double {
        return Double(width)/(Double(numberOfDataPoints) * 1.5)
    }
    var accentColor: Color
    var gradient: GradientColor?
    
    @State var scaleValue: Double = 0
    @Binding var touchLocation: CGFloat
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(LinearGradient(gradient: gradient?.getGradient() ?? GradientColor(start: accentColor, end: accentColor).getGradient(), startPoint: .bottom, endPoint: .top))
            }
            .frame(width: CGFloat(self.cellWidth))
            .scaleEffect(CGSize(width: 1, height: self.scaleValue), anchor: .bottom)
            .onAppear(){
                self.scaleValue = self.value
            }
        .animation(Animation.spring().delay(self.touchLocation < 0 ?  Double(self.index) * 0.04 : 0))
    }
}
*/
