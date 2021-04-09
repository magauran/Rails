//
//  TrainMapViewController.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit
import TinyConstraints

final class TrainMapViewController: UIViewController {
    private let collectionView: UICollectionView
    private let collectionViewFlowLayout: UICollectionViewFlowLayout

    init() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        self.collectionViewFlowLayout = collectionViewFlowLayout
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }

    private func setup() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(WagonCell.self)

        self.collectionView.backgroundColor = .white

        self.view.addSubview(self.collectionView)
        self.collectionView.edgesToSuperview()
    }
}

extension TrainMapViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: WagonCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension TrainMapViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let contentSideInsets = collectionView.contentInset.left - collectionView.contentInset.right
        let sectionInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        let sectionSideInsets = sectionInsets.left + sectionInsets.right
        let width = self.collectionView.frame.width - contentSideInsets - sectionSideInsets
        return CGSize(
            width: width,
            height: width * 2.44
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 16, left: 32, bottom: 16, right: 32)
    }
}
