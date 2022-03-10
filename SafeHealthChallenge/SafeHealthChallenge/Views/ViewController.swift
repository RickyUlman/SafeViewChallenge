//
//  ViewController.swift
//  SafeHealthChallenge
//
//  Created by Rickie on 3/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpCollectionView()
        setUpBinding()
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    private func setUpBinding() {
        viewModel.populateData = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.getData()
    }

    private func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let size = CGSize(width: width, height: height)
        layout.itemSize = size
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
    }
    
    private func openLink(_ link: String?) {
        guard let link = link, let url = URL(string: link)
        else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        let row = indexPath.row
        let question = viewModel.questions[row]
        let imageData = viewModel.getImageData(by: row)
        cell.configureCell(title: question.title, owner: question.owner.displayName, imageData: imageData, link: question.link)
        cell.openLink = openLink(_:)
        return cell
    }
    
}

