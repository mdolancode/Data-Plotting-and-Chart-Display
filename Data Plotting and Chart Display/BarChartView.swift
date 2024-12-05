//
//  BarChartView.swift
//  Data Plotting and Chart Display
//
//  Created by Matthew Dolan on 2024-12-05.
//

import UIKit

class BarChartView: UIView {
    var data: [CGFloat] = []
    
    override func draw(_ rect: CGRect) {
        guard !data.isEmpty else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.systemIndigo.cgColor)
        let barWidth = rect.width / CGFloat(data.count * 2)
        let maxDataValue = data.max() ?? 1
        for (index, value) in data.enumerated() {
            let x = CGFloat(index * 2 + 1) * barWidth
            let height = (value / maxDataValue) * rect.height
            let y = rect.height - height
            context.fill(CGRect(x: x, y: y, width: barWidth, height: height))
            
        }
    }
}
