//
//  SwiftUIView.swift
//  AdvancedCharts
//
//  Created by Кирилл Зверев on 08.01.2025.
//

import SwiftUI

public struct HorizontalColumnChart: View {
    public let data: [Item]
    public let title: String
    public let subtitle: String?
    
    public let settings: StyleSettings
    
    private var maxValue: Double {
        return self.data.max(by: { $0.value < $1.value })?.value ?? 0
    }
    
    
    public var body: some View {
            VStack {
                ChartTitle(title: title, subtitle: subtitle, settings: settings)
                GeometryReader { geometry in
                    let width = geometry.size.width
                    VStack {
                        ForEach(data.sorted(by: {$0.value > $1.value}), id: \.self) { item in
                            HorizontalColumn(width: width, item: item, maxValue: maxValue, settings: settings)
                            
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
    }
}

#Preview {
    HorizontalColumnChart(data: [Item(title: "Анна", subtitle: "Котонкина", value: 4.0), Item(title: "Елена", subtitle: "Алексеева", value: 3.0), Item(title: "Иван", subtitle: "Петров", value: 5.0), Item(title: "Александр", subtitle: "Смирнов", value: 6.0), Item(title: "Кирилл", subtitle: "Зверев", value: 2.0)], title: "ТОП 5 партнеров", subtitle: "График показывает, сколько раз вы попадались с танцором", settings: StyleSettings(colors: ColorsSettings(max: .red, min: .blue, substrate: .white.opacity(0.1), value: .red, title: .white, subtitle: .gray, legendTitle: .white, legendSubtitle: .white)))
        .frame(height: 300)
        .background(Color.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal)
}

fileprivate struct HorizontalColumn: View {
    let width: CGFloat
    let item: Item
    let maxValue: Double
    let settings: StyleSettings
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.system(size: 14).bold())
                        .foregroundStyle(settings.colors.legendTitle)
                    if let subtitle = item.subtitle {
                        Text(subtitle)
                            .font(.system(size: 12))
                            .foregroundStyle(settings.colors.legendSubtitle)
                    }
                }
                Spacer()
            }
            .frame(width: 100)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(settings.colors.substrate)
                    .frame(width: (width - 140))
                Capsule()
                    .fill(LinearGradient(colors: [settings.colors.min, settings.colors.max], startPoint: .leading, endPoint: .trailing))
                    .frame(width: (width - 140) * (item.value / maxValue))
            }
            .frame(height: 14)
            Text("\(Int(item.value))")
                .frame(width: 20)
                .foregroundStyle(settings.colors.value)
                .bold()
        }
    }
}

public struct Item: Hashable {
    public let title: String
    public let subtitle: String!
    public let value: Double
    public init(title: String, subtitle: String? = nil, value: Double) {
        self.title = title
        self.subtitle = subtitle
        self.value = value
    }
}

fileprivate struct ChartTitle: View {
    let title: String
    let subtitle: String?
    let settings: StyleSettings
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(nil)
                if let subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundStyle(settings.colors.subtitle)
                }
            }
            Spacer()
        }
    }
}

public struct StyleSettings {
    public let colors: ColorsSettings
    
    public init(colors: ColorsSettings) {
        self.colors = colors
    }
}

public struct ColorsSettings {
    public let max: Color
    public let min: Color
    public let substrate: Color
    public let value: Color
    public let title: Color!
    public let subtitle: Color
    public let legendTitle: Color!
    public let legendSubtitle: Color!
    
    public init(max: Color = .red, min: Color! = .blue, substrate: Color = .gray, value: Color, title: Color! = nil, subtitle: Color, legendTitle: Color! = nil, legendSubtitle: Color! = nil) {
        self.max = max
        self.min = min ?? max
        self.substrate = substrate
        self.value = value
        self.title = title
        self.subtitle = subtitle
        self.legendTitle = legendTitle
        self.legendSubtitle = legendSubtitle
    }
}
