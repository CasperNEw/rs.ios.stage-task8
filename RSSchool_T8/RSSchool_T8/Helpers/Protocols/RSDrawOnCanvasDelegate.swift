import UIKit

@objc protocol RSDrawOnCanvasDelegate: NSObjectProtocol {
    @objc func getResultShape(theValue: String)
}

