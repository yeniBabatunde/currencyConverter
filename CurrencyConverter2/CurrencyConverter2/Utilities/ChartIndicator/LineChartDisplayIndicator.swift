import UIKit
import Charts

class LineChartDisplayIndicator: MarkerImage {
    
    init(color: UIColor, font: UIFont, textColor: UIColor) {
        self.color = color
        self.font = font
        self.textColor = textColor
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attrs = [.font: font, .paragraphStyle: paragraphStyle, .foregroundColor: textColor, .baselineOffset: NSNumber(value: -4)]
        super.init()
    }
    
    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        lazy var yaxis = entry.y
        lazy var xaxis = entry.x
        dayText = "\(yaxis) \n \(xaxis)"
    }
    private (set) var color: UIColor
    private (set) var font: UIFont
    private (set) var textColor: UIColor
    private var dayText: String = ""
    private var attrs: [NSAttributedString.Key: AnyObject]!
    
    static let formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .short
        return formatter
    }()

}
