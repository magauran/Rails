//
//  StationSpotsCollectionView.swift
//  Rails
//
//  Created by Azizbek Asadov on 11/04/21.
//

import UIKit

fileprivate let cellid: String = "\(SpotCollectionViewCell.self)"

class StationSpotsCollectionView: UICollectionView {
    private var collectionViewCustomLayout: CenterHorizontallyItemsCollectionFlowLayout!
    
    private var itemWidth: CGFloat = 0
    private var itemSize: CGSize = CGSize.zero

    weak var viewController: UIViewController?
    
    var data: [Spot] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.configureUI()
        
        self.updateColors()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let space: CGFloat = 20.0
        self.collectionViewCustomLayout = CenterHorizontallyItemsCollectionFlowLayout()
        self.itemWidth                      = UIScreen.main.bounds.width - space * 4 // w0 == ws
        self.itemSize = CGSize(width: itemWidth, height: 100)
        self.collectionViewCustomLayout.itemSize = self.itemSize
        self.collectionViewCustomLayout.minimumLineSpacing = space
        self.collectionViewCustomLayout.minimumInteritemSpacing = space
        self.collectionViewCustomLayout.scrollDirection = .horizontal
        self.decelerationRate = .fast
        self.collectionViewLayout = self.collectionViewCustomLayout
        self.contentInset = UIEdgeInsets(top: 10, left: space, bottom: 10, right: space)
        
        self.register(UINib(nibName: cellid, bundle: nil), forCellWithReuseIdentifier: cellid)
        self.dataSource = self
        
        self.showsHorizontalScrollIndicator = false
    }
    
    @objc private func updateColors() {
        self.backgroundColor = .clear
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension StationSpotsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! SpotCollectionViewCell
        cell.data = self.data[indexPath.item]
        
        
        if let mainViewController = self.viewController {
            if self.traitCollection.forceTouchCapability == .available {
                mainViewController.registerForPreviewing(with: mainViewController as! UIViewControllerPreviewingDelegate, sourceView: cell)
            }
        }
        
        cell.delegate = self.viewController as? SpotCVCDelegate
        return cell
    }
}
