//
//  LineChartView.swift
//  Data Plotting and Chart Display
//
//  Created by Matthew Dolan on 2024-12-05.
//

import UIKit

class LineChartView: UIView {
    var data: [CGFloat] = []
    
    override func draw(_ rect: CGRect) {
        guard data.count > 1 else { return }
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setStrokeColor(UIColor.systemIndigo.cgColor)
        context.setLineWidth(2.0)
        let maxDataValue = data.max() ?? 1
        let pointSpacing = rect.width / CGFloat(data.count - 1)
        for (index, value) in data.enumerated() {
                let x = CGFloat(index) * pointSpacing
                let y = rect.height - (value / maxDataValue) * rect.height
            if index == 0 {
                context.move(to: CGPoint(x: x, y: y))
            } else {
                context.addLine(to: CGPoint(x: x, y: y))
            }
        }
        context.strokePath()
    }
}
