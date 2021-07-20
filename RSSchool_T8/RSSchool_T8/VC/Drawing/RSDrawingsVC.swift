import UIKit

@objcMembers class RSDrawingsVC: UIViewController {

    @objc weak var delegate: RSDrawOnCanvasDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setActionsOnButtons()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    func setActionsOnButtons() {
        for button in self.view.subviews
        {
            if (button is UIButton)
            {
                let tmp: UIButton = button as! UIButton
                tmp.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
            }
        }
    }
    
    @objc func tapOnButton(_ sender: UIButton) {
        delegate?.getResultShape(theValue: sender.currentTitle!)
        for button in self.view.subviews
        {
            if (button is UIButton)
            {
                let tmp: UIButton = button as! UIButton
                if (tmp.tag != sender.tag)
                {
                    let shadowPath0 = UIBezierPath(roundedRect: tmp.bounds, cornerRadius: 10)
                    tmp.layer.shadowPath = shadowPath0.cgPath
                    tmp.layer.shadowOffset = CGSize(width: 0, height: 0)
                    tmp.layer.shadowOpacity = 1
                    tmp.layer.cornerRadius = 10
                    tmp.layer.masksToBounds = false
                    tmp.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                    tmp.layer.shadowRadius = 4;
                }
            }
        }
    }
}
