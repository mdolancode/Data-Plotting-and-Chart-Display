# Data Plotting and Chart Display

## Overview

This project implements a chart visualization app that displays data using a Bar Chart and a Line Chart. Users can toggle between the two chart types using a segmented control.

## Implementation Steps
1. Project Setup
* Create a new Xcode project using the App template.
* Delete the storyboard:
** Remove Main.storyboard.
* Update Info.plist to remove the storyboard reference:
** Delete the Storyboard Name key.

* In SceneDelegate, set up the root view controller programmatically:

func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = ViewController()
    self.window = window
    window.makeKeyAndVisible()
}

2. Create the BarChartView
* Create a new file named BarChartView.swift:
** Subclass UIView.
** Implement a custom draw(_:) method to render the bars using CoreGraphics.
** Add a data property to hold the data points.
** Normalize the data to fit within the view’s bounds.

* Example:

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

3. Create the LineChartView
* Create a new file named LineChartView.swift:
** Subclass UIView.
** Implement a custom draw(_:) method to render the line using CoreGraphics.
* Add a data property to hold the data points.

* Example:

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

4. Instantiate & Setup Bar & Line Chart in ViewController
* Add subviews for Bar & Line Chart
* Add example data 

5. Create the Segmented Control
* Add a UISegmentedControl in ViewController.
** Add toggle options for "Bar" and "Line".
** Set up an action method to toggle the visibility of the charts.

private let chartToggle = UISegmentedControl(items: ["Bar", "Line"])

    @objc func chartTypeChanged() {
        let isBarChart = chartToggle.selectedSegmentIndex == 0
            self.barChart.isHidden = !isBarChart
            self.lineChart.isHidden = isBarChart
    }
    
            setUpConstraints()
    
        func setUpConstraints() {
        barChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Bar Chart at the Top
            barChart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            barChart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            barChart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            barChart.heightAnchor.constraint(equalToConstant: 300),
            
            lineChart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            lineChart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            lineChart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            lineChart.heightAnchor.constraint(equalToConstant: 300),
            
            
            
        ])
    }
    





