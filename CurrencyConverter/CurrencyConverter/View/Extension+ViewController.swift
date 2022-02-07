import DropDown
import Foundation
import Charts
extension ViewController {
    
    func configureViews() {
        lineChartView.backgroundColor = .blue
        lineChartView.delegate = self
        viewModel.saveData()
        viewModel.passRetreivedData(completionHandler: { [self]
            data in
            if let base = data.base, let currency = data.currency{
                self.firstCurrencyLogo = base
                self.secondCurrencyLogo = currency
                configureCurrencyDropDown(firstCurrencyLogo)
                configureSecondCurrencyDropDown(secondCurrencyLogo)
            }
        })
        getConversionDate()
    }
    
    func configureLayoutViews() {
        configureChart(dataPoints: months, values: unitsSold)
        lineChartView.backgroundColor = UIColor(named: "deepBlue")
        let marker = LineChartDisplayIndicator(color: UIColor(named: "greenShade") ?? .black, font: UIFont.boldSystemFont(ofSize: 14), textColor: .white)
        lineChartView.marker = marker
    }
    
    func configureCurrencyDropDown(_ list:[String]) {
        firstDropDownView.layer.borderWidth = 0.5
        firstDropDownLabel.text = ""
        firstCurrencyDropDown.anchorView = firstDropDownView
        firstCurrencyDropDown.dataSource = list
        firstCurrencyDropDown.direction = .bottom
        firstCurrencyDropDown.bottomOffset = CGPoint(x: 0, y: (firstCurrencyDropDown.anchorView?.plainView.bounds.height) ?? 0 )
        firstCurrencyDropDown.selectionAction = { [unowned self] (index: Int, item: String) in firstDropDownLabel.text = list[index]
        }
    }
    
    func configureSecondCurrencyDropDown(_ list:[String]) {
        secondDropDownView.layer.borderWidth = 0.5
        secondDropDownLabel.text = ""
        secondCurrencyDropDown.direction = .bottom
        secondCurrencyDropDown.anchorView = secondDropDownView
        secondCurrencyDropDown.dataSource = list
        secondCurrencyDropDown.bottomOffset = CGPoint(x: 0, y: (secondCurrencyDropDown.anchorView?.plainView.bounds.height) ?? 0)
        secondCurrencyDropDown.selectionAction = { [unowned self] (index: Int, item: String) in secondDropDownLabel.text = list[index]
            labelOfCurrencyDesired.text = list[index]
            secondCurrencyDropDown.userActivity?.isEligibleForSearch = true
            rateAtIndex = currencyRates[index]
            print("THE RATE AT INDEX: \(index) IS: \(rateAtIndex)")
        }
    }
    
    
    func configureChart(dataPoints: [String], values: [Double]) {
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
             dataEntry = ChartDataEntry(x: Double(i), y: values[i], data: dataPoints[i] as AnyObject)
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
        chartDataSet.circleRadius = 8
        chartDataSet.circleHoleRadius = 6
        chartDataSet.drawValuesEnabled = false
        chartDataSet.setColor(UIColor(named: "greenShade") ?? .black)
        chartDataSet.fill = Fill(color: UIColor(named: "ashColor") ?? .black)
        chartDataSet.fillAlpha = 0.8
        chartDataSet.drawFilledEnabled = true
        chartDataSet.mode = .cubicBezier
        chartDataSet.drawHorizontalHighlightIndicatorEnabled = false
        chartDataSet.drawVerticalHighlightIndicatorEnabled = false
        chartDataSet.drawCirclesEnabled = true
        let chartData = LineChartData(dataSets: [chartDataSet])
        lineChartView.data = chartData
    }
    func configureLineChartView() {
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.xAxis.drawGridLinesEnabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.leftAxis.enabled = false
        lineChartView.leftAxis.zeroLineDashLengths = [20]
        lineChartView.leftAxis.zeroLineDashPhase = 2.0
        lineChartView.xAxis.avoidFirstLastClippingEnabled = true
        lineChartView.xAxis.labelTextColor = UIColor(named: "ashColor") ?? .black
        lineChartView.leftAxis.labelTextColor = UIColor(named: "ashColor") ?? .black
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)
        lineChartView.xAxis.setLabelCount(months.count, force: true)
        lineChartView.rightAxis.drawAxisLineEnabled = false
        lineChartView.rightAxis.drawLabelsEnabled = false
        lineChartView.leftAxis.drawAxisLineEnabled = false
        lineChartView.pinchZoomEnabled = false
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.legend.enabled = false
        lineChartView.animate(xAxisDuration: 1.5)
    }
    func getConversionDate() {
        viewModel.getConversionRate = { [weak self] ratesArray in
            self?.currencyRates = ratesArray
        }
        
        viewModel.getDate = { [weak self] time in
            self?.currentTime.text = "Mid-market exchange rate at \(time.toHour) UTC"
        }
    }
    
}
