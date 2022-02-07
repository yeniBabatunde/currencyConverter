import UIKit
import Alamofire
import DropDown
import Charts

class ViewController: UIViewController, ChartViewDelegate {
    let searchController = UISearchController()
    
    var currencyRates = [Double]()
    var rateAtIndex = 0.0
    
    let markerClass = MarkerImage()
    let months = ["01 Jan", "07 Jun", "15 Jun", "23 Jun", "30 Jun"]
    let unitsSold = [50.0, 25.0, 50.0, 75.0, 100.0, 75.0]
    var dataEntries: [ChartDataEntry] = []
    let viewModel = CurrencyViewModel(apiString: "http://data.fixer.io/api/latest?access_key=540ce48328559abe2ed4a71599bd896d&format=1")
    lazy var newText: UITextView = {
        var newText = UITextView()
        newText.text = ""
       return newText
    }()
    lazy var firstCurrencyLogo = [String]()
    lazy var secondCurrencyLogo = [String]()
    let secondCurrencyDropDown = DropDown()
    lazy var firstCurrencyDropDown = DropDown()
    @IBOutlet weak var containerView: ContainerView!
    @IBOutlet weak var firstDropDownView: UIView!
   
    @IBOutlet weak var firstDropDownLabel: UILabel!
    @IBAction func firstDropDownButton(_ sender: Any) {
        firstCurrencyDropDown.show()
    }
    @IBOutlet weak var secondDropDownView: UIView!
   
    @IBOutlet weak var secondDropDownLabel: UILabel!
    @IBAction func secondDropDownButton(_ sender: Any) {
        secondCurrencyDropDown.show()
    }
    @IBOutlet weak var lineChartView: LineChartView!
    @IBOutlet weak var BottomUIView: UIView!
    @IBOutlet weak var labelOfCurrencyToBeConverted: UILabel!
    @IBOutlet weak var labelOfCurrencyDesired: UILabel!
    @IBOutlet weak var thirtyDaysImage: UIImageView!
    @IBOutlet weak var thirtyDaysButton: UIButton!
    @IBOutlet weak var sixtyDaysImage: UIImageView!
    @IBOutlet weak var sixtyDaysButton: UIButton!
    @IBOutlet weak var firstTextField: CurrencyToBeConverted!
    @IBOutlet weak var secondTextField: TextFieldOfCurrencyConverted!
    
    @IBOutlet weak var currentTime: CurrentTimeLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        lineChartView.backgroundColor = .blue
        firstDropDownView.layer.borderWidth = 0.5
        secondDropDownView.layer.borderWidth = 0.5
        
        getConversionDate()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureChart(dataPoints: months, values: unitsSold)
        lineChartView.backgroundColor = UIColor(named: "deepBlue")
        let marker = LineChartDisplayIndicator(color: UIColor(named: "greenShade") ?? .black, font: UIFont.boldSystemFont(ofSize: 14), textColor: .white)
        lineChartView.marker = marker
    }
    
    
    @IBAction func convertButton(_ sender: Any) {
        guard let firstCurrencyText = firstTextField.text else {
            return
        }
        
        guard let firstCurrencyValue = Double(firstCurrencyText) else {
            return
        }
        
        secondTextField.text = "\(firstCurrencyValue * rateAtIndex)"
    }
    
    @IBAction func past30DaysChartButton(_ sender: Any) {
        sixtyDaysButton.alpha = 0.5
        sixtyDaysImage.alpha = 0
        thirtyDaysButton.alpha = 1
        thirtyDaysImage.alpha = 1
    }
    
    @IBAction func past60DaysChartButton(_ sender: Any) {
        thirtyDaysButton.alpha = 0.5
        thirtyDaysImage.alpha = 0
        sixtyDaysButton.alpha = 1
        sixtyDaysImage.alpha = 1
    }
    
    @IBAction func currencyShuffleButton(_ sender: Any) {
        let currencyShuffleTuple = (secondDropDownLabel.text, firstDropDownLabel.text)
        firstDropDownLabel.text = currencyShuffleTuple.0
        secondDropDownLabel.text = currencyShuffleTuple.1
    }
}

extension ViewController: UITextFieldDelegate {
    
}
