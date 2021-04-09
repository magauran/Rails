//
//  UICollectionView++.swift
//  Rails
//
//  Created by Alexey Salangin on 4/9/21.
//

import UIKit

extension UICollectionView {
    public final func register<C: UICollectionViewCell>(
        _ cellType: C.Type,
        with identifier: String? = nil
    ) {
        let identifier = identifier ?? String(describing: cellType)
        self.register(cellType, forCellWithReuseIdentifier: identifier)
    }

    public final func dequeueReusableCell<C: UICollectionViewCell>(
        _ cellType: C.Type = C.self,
        with identifier: String? = nil,
        for indexPath: IndexPath
    ) -> C {
        let identifier = identifier ?? String(describing: cellType)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? C else {
            assertionFailure("Failed to cast the cell with identifier \(identifier) to \(C.self).")
            return C()
        }
        return cell
    }
}
