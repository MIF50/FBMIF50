//
//  PostCell.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import LBTATools


class PostCell: LBTAListCell<String> {
    
    let imageView: UIImageView = {
       let img = UIImageView(backgroundColor: .red)
        img.withHeight(40).withWidth(40)
        return img
    }()
    
    let nameLabel = UILabel(text: "Name Label")
    let dateLabel = UILabel(text: "Friday at 11:11 Am")
    let postTextLabel = UILabel(text: "Here is my post text ")
    let photoGridController = PhotosGridController()
    
    override func setupViews() {
        backgroundColor = .white
        arrangeLayout()
        
    }
    
    private func arrangeLayout(){
        let vstack = stack(nameLabel,dateLabel)
        let hStack = hstack(imageView,vstack,spacing: 8).padLeft(12).padRight(12).padTop(12)
        stack(hStack, postTextLabel,photoGridController.view,spacing: 8)
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct PostCell_Preview: PreviewProvider {
    static var previews: some View {
        PostCellRepresentable().previewLayout(.fixed(width: 400, height: 500))
    }
}

struct PostCellRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return PostCell()
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

#endif


