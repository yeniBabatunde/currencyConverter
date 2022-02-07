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
    
    override func draw(context: CGContext, point: CGPoint) {
        // custom padding around text
        let labelWidth = dayText.size(withAttributes: attrs).width + 20
        // if you modify labelHeigh you will have to tweak baselineOffset in attrs
        let labelHeight = dayText.size(withAttributes: attrs).height + 5
        // if you modify labelHeigh you will have to tweak baselineOffset in attrs
        // place pill above the marker, centered along x
        var rectangle = CGRect(x: point.x, y: point.y, width: labelWidth, height: labelHeight)
        rectangle.origin.x -= rectangle.width / 2.0
        let spacing: CGFloat = 25
        rectangle.origin.y -= rectangle.height + spacing
        // rounded rect
        let clipPath = UIBezierPath(roundedRect: rectangle, cornerRadius: 6.0).cgPath
        let color = CGColor(red: 0.004, green: 0.698, blue: 0.322, alpha: 1)
        context.addPath(clipPath)
        context.setFillColor(color)
        context.setStrokeColor(color)
        context.closePath()
        context.drawPath(using: .fillStroke)
        // add the text
        dayText.draw(with: rectangle, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
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
