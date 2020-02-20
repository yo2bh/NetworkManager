//
//  ActivityIndicator.swift
//  TopTenApps
//
//  Created by Yogesh Bharate on 1/7/20.
//  Copyright © 2020 Bharate, Yogesh. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
  convenience init(activityIndicatorStyle: UIActivityIndicatorView.Style, color: UIColor, placeInTheCenterOf parentView: UIView) {
    self.init(style: activityIndicatorStyle)
    center = parentView.center
    self.color = color
    parentView.addSubview(self)
  }
}
