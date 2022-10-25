//
//  DetailViewController.swift
//  MVP-pattern
//
//  Created by Maks Kokos on 25.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!

    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
    }

    @IBAction func popButton(_ sender: Any) {
        presenter.tap()
    }
    

}

extension DetailViewController: DetailViewProtocol {
    
    func getComment(comment: Comment?) {
        self.commentLabel.text = comment?.body
    }

}
