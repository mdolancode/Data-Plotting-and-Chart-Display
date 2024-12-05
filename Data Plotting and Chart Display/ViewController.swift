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
        view.backgroundColor = .white
        
        setUpBarChart()
        setUpLineChart()
        setUpChartToggle()
        
        setUpConstraints()
    }
    
    func setUpBarChart() {
        view.addSubview(barChart)
        // Example Data
        barChart.data = [10, 20, 15, 30, 25]
    }
    
    func setUpLineChart() {
        view.addSubview(lineChart)
        lineChart.data = [10, 20, 15, 30, 25]
        lineChart.isHidden = true
    }
    
    func setUpChartToggle() {
        view.addSubview(chartToggle)
        chartToggle.selectedSegmentIndex = 0
        chartToggle.addTarget(self, action: #selector(chartTypeChanged), for: .valueChanged)
    }
    
    @objc func chartTypeChanged() {
        let isBarChart = chartToggle.selectedSegmentIndex == 0
            self.barChart.isHidden = !isBarChart
            self.lineChart.isHidden = isBarChart
    }
    
    func setUpConstraints() {
    barChart.translatesAutoresizingMaskIntoConstraints = false
    lineChart.translatesAutoresizingMaskIntoConstraints = false
    chartToggle.translatesAutoresizingMaskIntoConstraints = false
    
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
        
        chartToggle.topAnchor.constraint(equalTo: barChart.bottomAnchor, constant: 16),
        chartToggle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        chartToggle.widthAnchor.constraint(equalToConstant: 200),
        chartToggle.heightAnchor.constraint(equalToConstant: 32)
    ])
}
}

