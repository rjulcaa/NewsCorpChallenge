//
//  CellRegistrable.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import UIKit

protocol CellRegistrable {
    static var cellIdentifier: String { get }
}

extension CellRegistrable {
    static var cellIdentifier: String {
        String(describing: self)
    }

    static private var nib: UINib {
        UINib(nibName: cellIdentifier, bundle: nil)
    }
}

extension CellRegistrable where Self: UITableViewCell {
    static func registerCell(in tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    static func dequeue(from tableView: UITableView,
                        for indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    }
}
