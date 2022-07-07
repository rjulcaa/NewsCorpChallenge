//
//  PhotoListViewController.swift
//  NewsCorpChallenge
//
//  Created by Richard Julca Amaro on 5/07/22.
//

import UIKit

// MARK: PhotoListViewController
final class PhotoListViewController: UIViewController {
    
    @IBOutlet private weak var photoListTableView: UITableView!
    
    private var presenter: PhotoListPresenter? = nil
    private var photos: [PhotoModel] = []
    private var contentHeight: CGFloat = 150.0
    
    /// Default initializer for the refresh controller
    private var refreshControl: UIRefreshControl = UIRefreshControl()
    
    init(presenter: PhotoListPresenter?) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter?.attachView(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.presenter?.fetchPhotos()
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.navigationItem.title = "My Photos"
    }
    
    /// Use this method to setup the required behavior a the main tableview
    private func setupTableView() {
        PhotoTableViewCell.registerCell(in: photoListTableView)
        photoListTableView.dataSource = self
        photoListTableView.delegate = self
        photoListTableView.refreshControl = self.refreshControl
    }
    
    /// Use this method execute the pull to refresh feature
    @objc func refresh() {
        fetchData()
    }
    
    /// Use this method to refresh the list of photos
    private func fetchData() {
        self.presenter?.fetchPhotos()
    }
    
}

// MARK: PhotoListView Delegate

extension PhotoListViewController: PhotoListView {
    
    /// Use this method refresh the list of photos with the array from the presenter
    /// - Parameters:
    ///  - photos: Array on the entity PhotoModel
    func loadData(with photos: [PhotoModel]) {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.photos = photos
            self.photoListTableView.reloadData()
        }
    }
    
    
    /// Use this method to implement the delegated method showErrorAlert
    /// - Parameters:
    ///  - title: Title of the alert
    ///  - message: Message of the alert
    func showErrorAlert(with title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.navigationController?.present(alert, animated: false)
    }
    
}

// MARK: UITableView Delegate

extension PhotoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = PhotoTableViewCell.dequeue(from: tableView, for: indexPath)
                as? PhotoTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: self.photos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = self.photos[indexPath.row]
        self.presenter?.presentPhotoDetail(with: self.navigationController, photo: photo)
    }
    
}

extension PhotoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.contentHeight
    }
    
}
