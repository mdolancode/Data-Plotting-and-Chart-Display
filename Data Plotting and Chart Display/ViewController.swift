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
}

