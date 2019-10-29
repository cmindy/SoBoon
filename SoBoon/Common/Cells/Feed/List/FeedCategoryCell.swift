//
//  FeedCategoryCell.swift
//  SoBoon
//
//  Created by CHOMINJI on 17/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class FeedCategoryCell: UITableViewCell {

    // MARK: - Vars
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let categoryList: [String] = ["아프지마", "생활용품", "헬스뷰티", "집꾸밀때", "기타"]
    
    // MARK: - Life Cycle
    
    private func initVars() {
        self.clipsToBounds = true
    }
    
    private func initBackgroundView() {
        baseView.backgroundColor = kWHITE
    }
    
    private func initCollectionView() {
        let listCell = UINib(nibName: FeedCategoryListCell.reuseID, bundle: nil)
        categoryCollectionView.register(listCell, forCellWithReuseIdentifier: FeedCategoryListCell.reuseID)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 72.0, height: 80.0)
        flowLayout.headerReferenceSize = .zero
        flowLayout.footerReferenceSize = .zero
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.collectionViewLayout = flowLayout
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initVars()
        initBackgroundView()
        initCollectionView()
    }
    
}

// MARK: - Extension

extension FeedCategoryCell {
    
    func entity() {
        categoryCollectionView.reloadData()
    }
    
}

// MARK: - CollectionView

extension FeedCategoryCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCategoryListCell.reuseID, for: indexPath) as? FeedCategoryListCell else {
            return .init()
        }
        
        let title = categoryList[indexPath.row]
        cell.configure(title: title)
        
        return cell
    }
    
}

extension FeedCategoryCell: UICollectionViewDelegate {
    
}
