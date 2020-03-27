//
//  UIButton+Extension.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit


extension UIButton {
    
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: image.size.width / 2)
        self.contentHorizontalAlignment = .left
        self.imageView?.contentMode = .scaleAspectFit
    }

    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func centerImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left:image.size.width / 2, bottom: 0, right: 0)
        self.contentHorizontalAlignment = .right
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func alignVertical(spacing: CGFloat = 6.0) {
      guard let imageSize = imageView?.image?.size,
        let text = titleLabel?.text,
        let font = titleLabel?.font
      else { return }

      titleEdgeInsets = UIEdgeInsets(
        top: 0.0,
        left: -imageSize.width,
        bottom: -(imageSize.height + spacing),
        right: 0.0
      )

      let titleSize = text.size(withAttributes: [.font: font])
      imageEdgeInsets = UIEdgeInsets(
        top: -(titleSize.height + spacing),
        left: 0.0,
        bottom: 0.0, right: -titleSize.width
      )

      let edgeOffset = abs(titleSize.height - imageSize.height) / 2.0
      contentEdgeInsets = UIEdgeInsets(
        top: edgeOffset,
        left: 0.0,
        bottom: edgeOffset,
        right: 0.0
      )
    }

    
}

