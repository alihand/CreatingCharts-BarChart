//
//  ViewController.swift
//  CreatingChartsBarChart
//
//  Created by Alihan Demir on 7.05.2019.
//  Copyright © 2019 Alihan Demir. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var barChart : BarChartView!
    var months: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
        setChart(dataPoints: months, value: unitsSold)
    }

    func setChart(dataPoints:[String],value :[Double] ){
        var dataEntries: [BarChartDataEntry] = []
        var counter = 0.0
        
        for i in 0..<dataPoints.count{
            counter += 1.0
            let dataEntry = BarChartDataEntry(x : value[i], y:counter)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Times")
        let chartData = BarChartData()
        
        chartData.addDataSet(chartDataSet)
        barChart.data = chartData
        chartDataSet.colors = ChartColorTemplates.colorful()
        barChart.animate(xAxisDuration: 3.0, yAxisDuration: 3.0)
    }
}

