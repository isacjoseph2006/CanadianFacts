//
//  FactViewCell.swift
//  Canada
//
//  Created by Isac Joseph on 20/03/20.
//  Copyright © 2020 Isac Joseph. All rights reserved.
//

import UIKit
import Kingfisher

class FactViewCell: UICollectionViewCell
{
    private let imgView = UIImageView()
    private let verticalStackView = UIStackView()
    private let lblTitle = UILabel()
    private let lblDesc = UILabel()
    private var cellWidth:CGFloat = 0.0
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        setUpViews()
    }
    
    /*
     * Setup inital views
     */
    private func setUpViews()
    {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        contentView.addSubview(imgView)
        lblTitle.font = isIpad ? UIFont.systemFont(ofSize: 17, weight: .semibold) : UIFont.systemFont(ofSize: 15, weight: .semibold)
        lblDesc.font = isIpad ? UIFont.systemFont(ofSize: 15, weight: .light) : UIFont.systemFont(ofSize: 13, weight: .light)
        lblDesc.numberOfLines = 0
        lblTitle.numberOfLines = 0
        verticalStackView.axis = .vertical
        verticalStackView.addArrangedSubview(lblTitle)
        verticalStackView.addArrangedSubview(lblDesc)
        verticalStackView.spacing = 5
        verticalStackView.distribution = .fill
        verticalStackView.alignment = .fill
        contentView.addSubview(verticalStackView)
        addConstraints()
    }
    
    
    /*
    * Adding required constraints
    */
    private func addConstraints()
    {
        var availableWidth = screenSize.width - 20
        
        if isLandscape
        {
            availableWidth = availableWidth - safeArea.left - safeArea.right
        }
            
        cellWidth = isIpad ? (availableWidth - 10) / 2  : availableWidth
        
        contentView.snp.removeConstraints()
        contentView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.width.equalTo(cellWidth).priority(.medium)
        }
        
        let imgSize:CGFloat = isIpad ? 200 : 100
        imgView.snp.removeConstraints()
        imgView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.top.greaterThanOrEqualTo(0).priority(.medium)
            maker.bottom.lessThanOrEqualToSuperview().priority(.medium)
            maker.centerY.equalToSuperview()
            maker.width.equalTo(imgSize)
            maker.height.equalTo(imgSize)
        }
        
        verticalStackView.snp.removeConstraints()
        verticalStackView.snp.makeConstraints { (maker) in
            maker.left.equalTo(imgSize + 10)
            maker.width.equalTo(cellWidth - imgSize - 20)
            maker.top.equalTo(10)
            maker.bottom.lessThanOrEqualTo(-10)
        }
    }
    
    /*
    * Configure cell with values from modal
    */
    func configureCell(fact:Fact)
    {
        addConstraints()
        imgView.kf.setImage(with: fact.imageHref?.url, placeholder: UIImage(named: "placeholder"))
        lblTitle.text = fact.title
        lblDesc.text = fact.description
    }
    
    /*
    * Set default values before resuing
    */
    override func prepareForReuse()
    {
        lblTitle.text = nil
        lblDesc.text = nil
        imgView.image = nil
    }
}
