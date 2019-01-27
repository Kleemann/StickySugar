//
//  SugarViewController.swift
//  StickySugar_Example
//
//  Created by Mads Kleemann on 26/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import StickySugar

class SugarViewController: UIViewController {

    var bannerImage: UIImageView = {
        let ret = UIImageView()
        ret.backgroundColor = .red
        return ret
    }()
    
    var iconImage: UIImageView = {
        let ret = UIImageView()
        ret.backgroundColor = .blue
        ret.layer.cornerRadius = 25
        return ret
    }()
    
    var titleLabel: UILabel = {
        let ret = UILabel()
        ret.font = UIFont.boldSystemFont(ofSize: 22)
        ret.text = "An awesome app"
        ret.numberOfLines = 0
        return ret
    }()
    
    var subtitleLabel: UILabel = {
        let ret = UILabel()
        ret.font = UIFont.systemFont(ofSize: 16)
        ret.textColor = .gray
        ret.numberOfLines = 0
        ret.text = "Awesome App Builders Corp."
        return ret
    }()
    
    var actionButton: UIButton = {
        let ret = UIButton()
        ret.backgroundColor = .blue
        ret.setTitle("OPEN", for: .normal)
        return ret
    }()
    
    var moreButton: UIButton = {
        let ret = UIButton()
        ret.backgroundColor = .blue
        ret.setTitle("...", for: .normal)
        return ret
    }()
    
    var previewLabel: UILabel = {
        let ret = UILabel()
        ret.font = UIFont.boldSystemFont(ofSize: 22)
        ret.text = "Preview"
        return ret
    }()
    
    var textView: UITextView = {
        let ret = UITextView()
        ret.backgroundColor = .yellow
        return ret
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews([bannerImage, iconImage, previewLabel])
        
        bannerImage.sugar.stickToParentEdges(edges: [.leading, .trailing, .top], relativeToSafeArea: false).size(toHeight: 200)
        iconImage.sugar
            .stickTopToBottom(of: bannerImage, insets: 28)
            .stickToParentEdges(edges: [.leading], insets: 20).size(toHeight: 128)
            .aspectWidthToHeight()
        
        stack(.vertical, views: [titleLabel, subtitleLabel])
            .sugar
            .align(to: iconImage, edges: [.top])
            .stickLeadingToTrailing(of: iconImage, insets: 17)
            .stickToParentEdges(edges: [.trailing], insets: 20)
            .compressionResistance(.defaultLow, for: .vertical)
        
        stack(.horizontal, distribution: .equalSpacing, alignment: .center, views: [actionButton, moreButton]) {
            let actionBtnHeight:CGFloat = 30
            self.actionButton.sugar
                .size(toWidth: 74, height: actionBtnHeight)
            self.actionButton.layer.cornerRadius = actionBtnHeight/2
            
            let moreBtnHeight:CGFloat = 28
            self.moreButton.sugar
                .size(toHeight: moreBtnHeight)
                .aspectWidthToHeight()
            self.moreButton.layer.cornerRadius = moreBtnHeight/2
        }.sugar
            .align(to: iconImage, edges: [.bottom])
            .stickLeadingToTrailing(of: iconImage, insets: 17)
            .stickToParentEdges(edges: [.trailing], insets: 20)
            .compressionResistance(.required, for: .vertical)
        
        previewLabel.sugar
            .stickToParentEdges(edges: [.leading, .trailing], insets: 20)
            .stickTopToBottom(of: iconImage, insets: 17)
        
        let previewImage1 = generatePreviewImageView()
        let previewImage2 = generatePreviewImageView()
        let previewImage3 = generatePreviewImageView()
        let previewImage4 = generatePreviewImageView()

        scrolling(.horizontal, views: [previewImage1, previewImage2, previewImage3, previewImage4]) {
            previewImage1.sugar.stickToParentEdges(edges: [.top, .bottom]).stickToParentEdges(edges: [.leading], insets: 17).size(toWidth: 188)
            previewImage2.sugar.stickToParentEdges(edges: [.top, .bottom]).size(toWidth: 188).stickLeadingToTrailing(of: previewImage1, insets: 11)
            previewImage3.sugar.stickToParentEdges(edges: [.top, .bottom]).size(toWidth: 188).stickLeadingToTrailing(of: previewImage2, insets: 11)
            previewImage4.sugar.stickToParentEdges(edges: [.top, .bottom]).stickToParentEdges(edges: [.trailing], insets: 17).size(toWidth: 188).stickLeadingToTrailing(of: previewImage3, insets: 11)
        }.sugar
            .stickTopToBottom(of: previewLabel, insets: 17)
            .stickToParentEdges(edges: [.leading, .trailing])
            .size(toHeight: 372)
            .configure {
                $0.showsHorizontalScrollIndicator =  false
            }
    }
    

    private func generatePreviewImageView() -> UIImageView {
        let ret = UIImageView()
        ret.backgroundColor = .blue
        ret.layer.cornerRadius = 25
        
        return ret
    }

}
