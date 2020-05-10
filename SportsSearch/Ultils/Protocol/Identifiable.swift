//
//  Identifiable.swift
//  ShopChannel
//
//  Created by lio on 2019/1/14.
//  Copyright © 2019 liofty. All rights reserved.
//

import UIKit

public protocol Identifiable {
    static var reuseIdentifier: String { get }
}

extension Identifiable {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public protocol NibLoadable: class {}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

extension NibLoadable where Self: UIView {
    public static func initFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Couldn't find nib file for `\(self)`")
        }
        return view
    }
}

typealias NibIdentifiable = Identifiable & NibLoadable

extension UITableView {

    func register<T: UITableViewCell>(_ type: T.Type) where T: Identifiable {
        register(type.self, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func register<T: UITableViewCell>(_ type: T.Type) where T: NibIdentifiable {
        register(type.nib, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func registerHeaderFooterview<T: UITableViewHeaderFooterView>(_ type: T.Type) where T: Identifiable {
        register(type.self, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }

    func registerHeaderFooterview<T: UITableViewHeaderFooterView>(_ type: T.Type) where T: NibIdentifiable {
        register(type.nib, forHeaderFooterViewReuseIdentifier: type.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T where T: Identifiable {
        guard let cell = self.dequeueReusableCell(withIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't find nib file for `\(type.reuseIdentifier)`")
        }
        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T where T: Identifiable {
        let dequeueView = self.dequeueReusableHeaderFooterView(withIdentifier: type.reuseIdentifier) as? T
        guard let headerFooterView = dequeueView else {
            fatalError("Couldn't find nib file for `\(type.reuseIdentifier)`")
        }
        return headerFooterView
    }

}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ type: T.Type) where T: Identifiable {
        register(type.self, forCellWithReuseIdentifier: type.reuseIdentifier)
    }

    func register<T: UICollectionViewCell>(_ type: T.Type) where T: NibIdentifiable {
        register(type.nib, forCellWithReuseIdentifier: type.reuseIdentifier)
    }

    func register<T: UICollectionReusableView>(supplementaryViewType type: T.Type, ofKind kind: String) where T: NibIdentifiable {
        register(type.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.reuseIdentifier)
    }

    func register<T: UICollectionReusableView>(supplementaryViewType type: T.Type, ofKind kind: String) where T: Identifiable {
        register(type.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T where T: Identifiable {
        let dequeueCell = self.dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T
        guard let cell = dequeueCell else {
            fatalError("Couldn't find nib file for `\(type.reuseIdentifier)`")
        }
        return cell
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(_ type: T.Type, kind: String, for indexPath: IndexPath) -> T where T: Identifiable {
        let dequeueView = self.dequeueReusableSupplementaryView(ofKind: kind,
                                                                withReuseIdentifier: type.reuseIdentifier,
                                                                for: indexPath)
        guard let supplementaryView = dequeueView as? T else {
            fatalError("Couldn't find nib file for `\(type.reuseIdentifier)`")
        }
        return supplementaryView
    }

}
