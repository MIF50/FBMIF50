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
        
    
    let liveStack: UIStackView = {
        
        let img = UIImageView(image: UIImage(named: "broadcast"), contentMode: .scaleAspectFit)
        img.withSize(.init(width: 25, height: 25))
        
        let btn = UIButton(title: "Live", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [UIView(),img,btn,UIView().withWidth(25)])
        stack.spacing = 4
        stack.alignment = .center
        stack.backgroundColor = .yellow
        return stack
    }()
    
    
    let photoStack: UIStackView = {
        
        let img = UIImageView(image: UIImage(named: "photo"), contentMode: .scaleAspectFit)
        img.withSize(.init(width: 25, height: 25))
        
        let btn = UIButton(title: "photo", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [UIView().withWidth(15),img,btn,UIView().withWidth(34)])
        stack.spacing = 0
        stack.alignment = .center
        stack.backgroundColor = .purple
        return stack
    }()
    
    let checkInStack: UIStackView = {
        
        let checkInImg = UIImageView(image: UIImage(named: "check_in"), contentMode: .scaleAspectFit)
        checkInImg.withSize(.init(width: 25, height: 25))
        
        let btn = UIButton(title: "Check In", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [checkInImg,btn,UIView()])
        stack.spacing = 4
        stack.alignment = .center
        stack.backgroundColor = .red
        return stack
    }()
    ///////===========
    let liveContainer: UIView = {
        
        let img = UIImageView(image: UIImage(named: "broadcast"), contentMode: .scaleAspectFit)
        img.withSize(.init(width: 25, height: 25))
        
        let btn = UIButton(title: "Live", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center
        
        let container = UIView()
        container.addSubview(img)
        img.anchor(top: container.topAnchor, leading: container.leadingAnchor, bottom: container.bottomAnchor, trailing: nil,padding: .init(top: 0, left: 24, bottom: 0, right: 0))
        container.addSubview(btn)
        btn.anchor(top: container.topAnchor, leading: img.trailingAnchor, bottom: container.bottomAnchor, trailing: container.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 24))
        container.backgroundColor = .yellow

        return container
    }()
    
    
    let photoContainer: UIView = {
        
        let img = UIImageView(image: UIImage(named: "photo"), contentMode: .scaleAspectFit)
        img.withSize(.init(width: 25, height: 25))
        
        let btn = UIButton(title: "photo", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center
        
       let container = UIView()
        container.addSubview(img)
        img.anchor(top: container.topAnchor, leading: container.leadingAnchor, bottom: container.bottomAnchor, trailing: nil,padding: .init(top: 0, left: 24, bottom: 0, right: 0))
        container.addSubview(btn)
        btn.anchor(top: container.topAnchor, leading: img.trailingAnchor, bottom: container.bottomAnchor, trailing: container.trailingAnchor,padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        container.backgroundColor = .red
        return container
    }()
    
    let checkInContainer: UIView = {
        
        let img = UIImageView(image: UIImage(named: "check_in"), contentMode: .scaleAspectFit)
        img.withSize(.init(width: 25, height: 25))
        
        let btn = UIButton(title: "Check In", titleColor: .black)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        btn.titleLabel?.textAlignment = .center
        
       let container = UIView()
        container.addSubview(img)
        img.anchor(top: container.topAnchor, leading: container.leadingAnchor, bottom: container.bottomAnchor, trailing: nil,padding: .init(top: 0, left: 24, bottom: 0, right: 0))
        container.addSubview(btn)
        btn.anchor(top: container.topAnchor, leading: img.trailingAnchor, bottom: container.bottomAnchor, trailing: container.trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 24))
        container.backgroundColor = .blue
        
        container.withWidth(100)

        return container
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        arrangeLayout()
    }
    
    
    
    private func arrangeLayout() {
        let topStack = hstack(UIView(backgroundColor: .clear).withWidth(16),userImageView, textFieldPost,spacing: 8)
        let bottomStack = hstack(liveStack, photoStack, checkInStack)
//        let bottomStack = hstack(liveContainer, photoContainer , checkInContainer)
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
