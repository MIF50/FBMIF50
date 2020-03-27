//
//  StoryPhotoCell.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import LBTATools


class StoryPhotoCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFill)
    let circleImageView : UIImageView = {
        let img = UIImageView(image: UIImage(named: "avatar1"),contentMode: .scaleAspectFit)
        img.withWidth(34).withHeight(34)
        img.layer.cornerRadius = 17
        img.clipsToBounds = true
        return img
    }()
    let nameLabel = UILabel(text: "Lee Ji Eun", font: .boldSystemFont(ofSize: 14), textColor: .white)
    
    override func setupViews() {
        imageView.layer.cornerRadius = 8
        
        stack(imageView)
        setupGradientLayout()
        let circleStackt = hstack(circleImageView,UIView())
        stack(circleStackt,UIView(),nameLabel).withMargins(.allSides(8))
    }
    
    
    let gradientLayout  = CAGradientLayer()
    
    fileprivate func setupGradientLayout(){
        gradientLayout.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayout.locations = [0.6,1.1]
        gradientLayout.cornerRadius = 8
        clipsToBounds = true
        layer.addSublayer(gradientLayout)
    }
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        
        gradientLayout.frame = bounds
    }
}




#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct StoryPhotoCell_Preview: PreviewProvider {
    static var previews: some View {
        StoryPhotoCellRepresentable().previewLayout(.fixed(width: 200, height: 300))
    }
}

struct StoryPhotoCellRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return StoryPhotoCell()
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

#endif
