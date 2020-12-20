//
//  Helper.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import Foundation
import UIKit

class Helper {
    //MARK: - Animation
    static func rotateAnimation(imageView: UIImageView, duration: Double ){
        UIView.animate(withDuration: duration) {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
    }
}
