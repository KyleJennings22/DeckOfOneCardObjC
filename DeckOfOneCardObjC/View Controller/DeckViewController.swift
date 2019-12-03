//
//  DeckViewController.swift
//  DeckOfOneCardObjC
//
//  Created by Kyle Jennings on 12/3/19.
//  Copyright © 2019 Kyle Jennings. All rights reserved.
//

import UIKit

class DeckViewController: UIViewController {
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCard()
    }
    
    @IBAction func fetchNewCardButtonTapped(_ sender: UIButton) {
        fetchCard()
    }
    func fetchCard() {
        KPJDeckController.fetchNewCard("") { (card) in
            guard let card = card else {return}
            KPJDeckController.fetchCardImage(card) { (image) in
                DispatchQueue.main.async {
                    guard let image = image else {return}
                    self.updateViews(card: card, image: image)
                }
            }
        }
    }
    
    func updateViews(card: KPJDeck, image: UIImage) {
        DispatchQueue.main.async {
            self.cardImageView.image = image
            self.cardLabel.isHidden = false
            self.cardLabel.text = "\(card.card.lowercased().capitalizingFirstLetter()) of \(card.suit.lowercased().capitalizingFirstLetter())"
        }
    }
}// end of class

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
