//
//  DataViewController.swift
//  Single_Mind
//
//  Created by Ricardo Wu on 2018/6/14.
//  Copyright © 2018年 Ricardo Wu. All rights reserved.
//

import UIKit
import Charts

class DataViewController: UIViewController {

    //月、周、日的選項
    
    @IBOutlet weak var chartView: BarChartView!
    //月、周、日的 variables
    var monthChartView: BarChartView!
    var weekChartView: BarChartView!
    var dayChartView: BarChartView!
    //每個按鈕的資料存取,找不到辦法.先寫死
    override func viewDidLoad() {
        super.viewDidLoad()
        //顯示setChart
        setChart(datapoints: month,values: hours)
    
    }
    //改變顏色

    //月
    let month = ["April","May","June"]
    let hours:[Double] = [45.5,55.8,125.3]
    //周
    let week = ["1st","2nd","3rd","4th"]
    let wkHours:[Double] = [7.5,8.3,6.2,4.7]
    //日
    //Chart 的 function
    func setChart(datapoints: [String],values: [Double]){
        var hoursEntries: [BarChartDataEntry] = []
        var wkHoursEntries: [BarChartDataEntry] = []
        
        //月
        for i in 0..<month.count{
            let hourEntry = BarChartDataEntry(x: Double(i), y: hours[i])
            hoursEntries.append(hourEntry)
        }
        
        let ChartDataSet = BarChartDataSet(values: hoursEntries, label: "hours focused")
        let chartData = BarChartData(dataSet: ChartDataSet)
        chartView.data = chartData
        //周
        for d in 0..<week.count{
            let wkHourEntry = BarChartDataEntry(x: Double(d), y: wkHours[d])
            wkHoursEntries.append(wkHourEntry)
            
        }
        
        let wkChartDataSet = BarChartDataSet(values: wkHoursEntries, label: "hours focused")
        let wkChartData = BarChartData(dataSet: wkChartDataSet)
        chartView.data = wkChartData
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
