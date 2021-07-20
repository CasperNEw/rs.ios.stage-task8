import UIKit

@objcMembers class RSTimerVC: UIViewController {

    @IBOutlet weak var rightTime: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var leftTime: UILabel!
    @IBOutlet weak var sliderTime: UISlider!
    @objc weak var delegate: RSTimerDelegate?
    var result: Float {
        sliderTime.value
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        makeViewUI()
        sliderTime.addTarget(self, action: #selector(tapOnSlideratime), for: .valueChanged)
        for button in self.view.subviews
        {
            if button is UIButton
            {
                let tmp = button as! UIButton
                tmp.addTarget(self, action: #selector(tapOnSave), for: .touchUpInside)
            }
        }
    }
    
    @objc func tapOnSlideratime(_ sender: UISlider) {
        let val = sliderTime.value
        let str = String(format: "%.2f", val)
        time.text = "\(str) s";
    }
    
    @objc func tapOnSave(_ sender: UIButton) {
        self.view.isHidden = true
        delegate?.getResultTime(theValue: result)
    }
    
    func makeViewUI() {
        let shadowPath0 = UIBezierPath(roundedRect: CGRect(origin: .zero, size: CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)), cornerRadius: 45)
        self.view.layer.shadowPath = shadowPath0.cgPath
        self.view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.view.layer.shadowOffset = .zero
        self.view.layer.shadowOpacity = 1
        self.view.layer.shadowRadius = 4
        self.view.layer.cornerRadius = 45
        self.view.layer.masksToBounds = false
        sliderTime.minimumValue = 1
        sliderTime.maximumValue = 5
        sliderTime.value = 1;
        sliderTime.tintColor = UIColor(red: 0.13, green: 0.692, blue: 0.557, alpha: 1)
        time.text = "\(sliderTime.value)"
        leftTime.text = "1"
        rightTime.text = "5"
        time.textAlignment = .center
        for label in self.view.subviews
        {
            if (label is UILabel)
            {
                let tmp: UILabel = label as! UILabel
                tmp.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                tmp.font = UIFont(name: "Montserrat-Regular", size: 18)
            }
        }
    }
}
