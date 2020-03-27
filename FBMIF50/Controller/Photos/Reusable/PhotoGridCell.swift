//
//  PhotoGridCell.swift
//  FBMIF50
//
//  Created by BeInMedia on 3/26/20.
//  Copyright © 2020 MIF50. All rights reserved.
//

import UIKit
import LBTATools


class PhotoGridCell: LBTAListCell<String> {
    
    override var item: String! {
        didSet {
            imageView.image = UIImage(named: item)
        }
    }
    
    let imageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "avatar1"), contentMode: .scaleAspectFill)
        return img
    }()
    
    override func setupViews() {
        backgroundColor = .yellow
        stack(imageView)
    }
}





#if canImport(SwiftUI) && DEBUG
import SwiftUI

@available(iOS 13.0, *)
struct PhotoGridCell_Preview: PreviewProvider {
    static var previews: some View {
        PhotoGridCellRepresentable().previewLayout(.fixed(width: 200, height: 200))
    }
}

struct PhotoGridCellRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        return PhotoGridCell()
    }

    func updateUIView(_ view: UIView, context: Context) {

    }
}

#endif

