import UIKit

@objc protocol RSTimerDelegate: NSObjectProtocol {
    @objc func getResultTime(theValue: Float)
}
