//
//  ViewController.swift
//  Canada
//
//  Created by Isac Joseph on 20/03/20.
//  Copyright © 2020 Isac Joseph. All rights reserved.
//

import UIKit
import SnapKit

class ListingViewController: UIViewController
{
    let flowLayout = UICollectionViewFlowLayout()
    var colViewFacts: UICollectionView!
    
    var facts = [Fact]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpViews()
    }
    
    
    func setUpViews()
    {
        getCanadianFacts()
        setUpCollectionView()
    }
    
    func setUpCollectionView()
    {
        flowLayout.minimumInteritemSpacing = 10
        colViewFacts = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        colViewFacts.backgroundColor = UIColor.white
        view.addSubview(colViewFacts)
        colViewFacts.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
        }
        colViewFacts.delegate = self
        colViewFacts.dataSource = self
        colViewFacts.register(FactViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    
    func getCanadianFacts()
    {
        guard let url = Constants.URLS.BASE_URL.url else { return }
        NetworkLayer.shared.getFacts(url: url, method: .get)
        { [weak self] (response, message) in
            
            if let res = response
            {
                self?.title = res.title
                self?.facts = res.rows
                self?.colViewFacts.reloadData()
            }
            else
            {
                //TODO: Handle error here
            }
        }
    }
}

extension ListingViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return facts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FactViewCell
        cell.backgroundColor = UIColor.yellow
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: screenSize.width, height: 100)
    }
    
}

