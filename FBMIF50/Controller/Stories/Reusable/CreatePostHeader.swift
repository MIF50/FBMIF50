//
//  CreatePostHeader.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import LBTATools

class CreatePostHeader: UICollectionReusableView {
    
    let userImageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "avatar1"), contentMode: .scaleToFill)
        img.withSize(.init(width: 60, height: 60))
        img.clipsToBounds = true
        img.layer.cornerRadius = 30
        return img
    }()
    
    let textFieldPost: UITextField = {
       let textField = UITextField(placeholder: "what's on your mind?")
        return textField
    }()
    
    let liveBtn: UIButton = {
        let btn = UIButton(title: "Live", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center
//        btn.setImage(UIImage(named: "broadcast")!, for: .normal)
//        btn.imageView?.contentMode = .scaleAspectFit
//        btn.alignVertical()
        
        btn.backgroundColor = .yellow


        return btn
    }()
    
    let photoBtn: UIButton = {
        let btn = UIButton(title: "Photo", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center

//        btn.setImage(UIImage(named: "photo")!, for: .normal)
//        btn.imageView?.contentMode = .scaleAspectFit
//        btn.alignVertical()
        
        btn.backgroundColor = .blue

        return btn
    }()
    
    let checkInBtn: UIButton = {
        let btn = UIButton(title: "check In", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center

//        btn.setImage(UIImage(named: "check_in")!, for: .normal)
//        btn.imageView?.contentMode = .scaleAspectFit
//        btn.alignVertical()
        
        let widthTitle = btn.titleLabel?.frame.width
        print("widthTitle = \(widthTitle)")
        
        btn.backgroundColor = .purple

        return btn
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        arrangeLayout()
    }
    
    private func arrangeLayout() {
        let topStack = hstack(UIView(backgroundColor: .clear).withWidth(16),userImageView, textFieldPost,spacing: 8)
        let bottomStack = hstack(liveBtn, photoBtn, checkInBtn).withMargins(.init(top: 0, left: 0, bottom: 0, right: 0))
        bottomStack.distribution = .fillEqually
        stack(UIView().withHeight(12),topStack,bottomStack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct CreatePostHeader_Preview: PreviewProvider {
    static var previews: some View {
        CreatePostHeaderRepresentable().previewLayout(.fixed(width: 450, height: 130))
    }
}

struct CreatePostHeaderRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return CreatePostHeader()
    }

    func updateUIView(_ view: UIView, context: Context) {}
    
}

#endif
