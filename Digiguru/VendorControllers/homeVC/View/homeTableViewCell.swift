//
//  homeTableViewCell.swift
//  DigiguruVendor
//
//  Created by Macbook Air on 8/6/21.
//

import UIKit
import Charts

class homeTableViewCell: UITableViewCell,ChartViewDelegate {

    @IBOutlet weak var barChartView: BarChartView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        

        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    
        

        // Configure the view for the selected state
    }
    
    func setbarData(data:[String],value:[Double]){

        let xAxis = barChartView.xAxis
        
        
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
        xAxis.labelCount = value.count
//
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1

     //   let leftAxis = barChartView.leftAxis
       // leftAxis.labelFont = .systemFont(ofSize: 10)
       // leftAxis.labelCount = 5
      //  leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
//        leftAxis.labelPosition = .outsideChart
//        leftAxis.spaceTop = 0.15
//        leftAxis.axisMinimum = 10
//        leftAxis.axisMaximum = 100
    
        leftAxisFormatter.negativeSuffix = " $"
        leftAxisFormatter.positiveSuffix = " $"
        
        
        xAxis.labelTextColor = UIColor.black
        
        barChartView.drawBarShadowEnabled = false
        barChartView.drawValueAboveBarEnabled = false
        
        barChartView.maxVisibleCount = 30
        
        barChartView.pinchZoomEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        
        self.barChartView.rightAxis.enabled = false;
        self.barChartView.leftAxis.enabled = false
        
        
        self.barChartView.leftAxis.drawZeroLineEnabled = false
        self.barChartView.xAxis.drawGridLinesEnabled = false
        
        self.barChartView.leftAxis.drawBottomYLabelEntryEnabled = false
        self.barChartView.leftAxis.drawTopYLabelEntryEnabled = false
        self.barChartView.leftAxis.labelTextColor = UIColor.white
        
        self.barChartView.borderLineWidth = 0
        
        barChartView.drawGridBackgroundEnabled = false
        barChartView.gridBackgroundColor = UIColor.clear
        let legend = barChartView.legend
     
        if value.count > 0 {
            
            let months = data
            let unitsSold = value
            
            barChartView.setBarChartData(xValues: months, yValues: unitsSold, label: "")
//            barChartView.setBarChartData(xValues: months, yValues: unitsSold, label: "")

        }
        else{
            barChartView.data = nil
        }
    }

}

extension BarChartView {

    private class BarChartFormatter: NSObject, IAxisValueFormatter {
        
        var labels: [String] = []
        
        func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            return labels[Int(value)]
        }
        
        init(labels: [String]) {
            super.init()
            self.labels = labels
        }
    }
    
    
    func colorPicker(value : Double) -> NSUIColor {
       

            return NSUIColor(red: 0.05, green: 0.29, blue: 0.52, alpha: 1.00)

    }

    
    func setBarChartData(xValues: [String], yValues: [Double], label: String) {
        
        var dataEntries: [BarChartDataEntry] = []
        var valueColors = [NSUIColor]()
        
        for i in 0..<yValues.count {
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: yValues[i])
            dataEntries.append(dataEntry)
            valueColors.append(colorPicker(value: yValues[i]))
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: label)
        chartDataSet.colors = valueColors
        
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = 0.2
        chartData.setDrawValues(false)

        
        let chartFormatter = BarChartFormatter(labels: xValues)
        let xAxis = XAxis()
        xAxis.labelTextColor = UIColor.black
        xAxis.valueFormatter = chartFormatter
        self.xAxis.valueFormatter = xAxis.valueFormatter
        self.animate(xAxisDuration: 1.5)
        
        self.data = chartData
    }
}
