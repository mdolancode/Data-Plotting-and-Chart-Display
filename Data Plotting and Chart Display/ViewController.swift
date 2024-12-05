//
//  ViewController.swift
//  Data Plotting and Chart Display
//
//  Created by Matthew Dolan on 2024-12-05.
//

import UIKit

class ViewController: UIViewController {
    private let barChart = BarChartView()
    private let lineChart = LineChartView()
    private let chartToggle = UISegmentedControl(items: ["Bar", "Line"])

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        setUpBarChart()
        setUpLineChart()
    }
    
    func setUpBarChart() {
        view.addSubview(barChart)
        // Example Data
        barChart.data = [10, 20, 15, 30, 25]
    }
    
    func setUpLineChart() {
        view.addSubview(lineChart)
        lineChart.data = [10, 20, 15, 30, 25]
    }
    
    func setUpCharToggle() {
        view.addSubview(chartToggle)
        chartToggle.selectedSegmentIndex = 0
        chartToggle.addTarget(self, action: #selector(chartTypeChanged), for: .valueChanged)
    }
    
    @objc func chartTypeChanged() {
        let isBarChart = chartToggle.selectedSegmentIndex == 0
            self.barChart.isHidden = !isBarChart
            self.lineChart.isHidden = isBarChart
    }
}

