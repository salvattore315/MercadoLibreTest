//
//  Helper.swift
//  MercadoLibreChallenge
//
//  Created by Salvador Martinez on 19/12/20.
//

import Foundation
import UIKit
import KVNProgress

class Helper {
    //MARK: - Animation
    static func rotateAnimation(imageView: UIImageView, duration: Double ){
        UIView.animate(withDuration: duration) {
            imageView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
        }
    }
    
    static func initScreenProgress(){
        
        let configuration = KVNProgressConfiguration.init()
        configuration.circleStrokeBackgroundColor = UIColor.white.withAlphaComponent(0.3)
        configuration.circleStrokeForegroundColor = GlobalConstants.Colors.yellowMercadoLibre
        configuration.successColor = GlobalConstants.Colors.yellowMercadoLibre
        configuration.errorColor = GlobalConstants.Colors.yellowMercadoLibre
        configuration.isFullScreen = true
        configuration.statusColor = GlobalConstants.Colors.blueMercadoLibre
        configuration.backgroundFillColor = .systemGray6
        configuration.backgroundType = .solid
        configuration.minimumDisplayTime = 1.0
        configuration.minimumSuccessDisplayTime = 1.0
        configuration.minimumErrorDisplayTime = 1.0
        KVNProgress.setConfiguration(configuration)
        
    }
}
