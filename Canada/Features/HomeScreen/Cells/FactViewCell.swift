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
    let imgView = UIImageView()
    let verticalStackView = UIStackView()
    let lblTitle = UILabel()
    let lblDesc = UILabel()
    
    var cellWidth:CGFloat = 0.0
    
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
    
    func setUpViews()
    {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        contentView.addSubview(imgView)
        lblTitle.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        lblDesc.font = UIFont.systemFont(ofSize: 13, weight: .light)
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
    
    func addConstraints()
    {
        cellWidth = screenSize.width - 20
        
        contentView.snp.removeConstraints()
        contentView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.width.equalTo(cellWidth).priority(.medium)
        }
        
        imgView.snp.removeConstraints()
        imgView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview()
            maker.top.greaterThanOrEqualTo(0).priority(.medium)
            maker.bottom.lessThanOrEqualToSuperview().priority(.medium)
            maker.centerY.equalToSuperview()
            maker.width.equalTo(100)
            maker.height.equalTo(100)
        }
        
        verticalStackView.snp.removeConstraints()
        verticalStackView.snp.makeConstraints { (maker) in
            maker.left.equalTo(110)
            maker.width.equalTo(cellWidth - 120)
            maker.top.equalTo(10)
            maker.bottom.lessThanOrEqualTo(-10)
        }
    }
    
    func configureCell(fact:Fact)
    {
        addConstraints()
        imgView.kf.setImage(with: fact.imageHref?.url, placeholder: UIImage(named: "placeholder"))
        lblTitle.text = fact.title
        lblDesc.text = fact.description
    }
}
