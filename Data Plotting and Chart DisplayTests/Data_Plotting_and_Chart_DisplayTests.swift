//
//  Data_Plotting_and_Chart_DisplayTests.swift
//  Data Plotting and Chart DisplayTests
//
//  Created by Matthew Dolan on 2024-12-05.
//

import XCTest


final class Data_Plotting_and_Chart_DisplayTests: XCTestCase {
    
    func testBartChartDataValidation() {
        // Arrange
        let barChart = BarChartView()
        let testData: [CGFloat] = [10, 20, 15, 30, 25]
        barChart.data = testData
        
        // Act
        let isDataEmpty = barChart.data.isEmpty
        let maxValue = barChart.data.max()
        
        // Assert
        XCTAssertFalse(isDataEmpty, "Data array should not be empty")
        XCTAssertEqual(maxValue, 30, "Max value should be 30")
    }
}
