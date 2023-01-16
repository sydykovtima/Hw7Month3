//
//  ViewController.swift
//  еуые
//
//  Created by Mac on 12/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    @IBOutlet weak var secondImageView: UIImageView!
    
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var fourthImageview: UIImageView!
    
    @IBOutlet weak var firstCollection: UICollectionView!
    
    @IBOutlet weak var secondCollection: UICollectionView!
    var letters:[String] = ["А", "Т", "Б", "О", "К","Л","Р","У","В","Е","З","И"]
    var word:[String] = []
    var word1:[String] = []
    var correctWord:[String] = ["Л","Е","Т","О"]
   var correctWord1 = ["Г","И","К","Т","Е","Г"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpSubviews()
    }
    
    func setUpSubviews() {
        let wordLayOut = UICollectionViewFlowLayout()
        let letterLayOut = UICollectionViewFlowLayout()
        firstCollection.collectionViewLayout = wordLayOut
        secondCollection.collectionViewLayout = letterLayOut
        firstCollection.collectionViewLayout = wordLayOut
        secondCollection.collectionViewLayout = letterLayOut
        firstCollection.backgroundColor = .clear
        secondCollection.backgroundColor = .clear
        firstImageView.image = UIImage(named: "1")
        secondImageView.image = UIImage(named: "2")
        thirdImageView.image = UIImage(named: "3")
        fourthImageview.image = UIImage(named: "4")
        firstImageView.contentMode = .scaleAspectFill
        secondImageView.contentMode = .scaleAspectFill
        thirdImageView.contentMode = .scaleAspectFill
        fourthImageview.contentMode = .scaleAspectFill
        firstImageView.layer.cornerRadius = 50
        secondImageView.layer.cornerRadius = 50
        thirdImageView.layer.cornerRadius = 50
        fourthImageview.layer.cornerRadius = 50
    }


}
extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollection {
            return word.count
        } else  {
            return letters.count
        }
        if collectionView == firstCollection {
            return word1.count
        } else {
            return letters.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "word_cell", for: indexPath) as! WordCell
            cell.label.text = word[indexPath.row]
            firstCollection.reloadData()
//            cell.label.text = word1[indexPath.row]
            cell.label.layer.cornerRadius = 50
           
            return cell
            
        } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "letter_cell", for: indexPath) as! LetterCell
                cell.letterLabel.text = letters[indexPath.row]
                return cell
                
            }
        
        }
        
    
}
extension ViewController:UICollectionViewDelegateFlowLayout {
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let letter = letters[indexPath.row]
        word.append(letter)
        print(word)
        firstCollection.reloadData()
        secondCollection.reloadData()
        if word == correctWord {
            let alert = UIAlertController(title: "Поздравляем!!!", message: "вы Угадали слово!\n Перейти к следующему уровню?", preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: "ОК", style: .destructive) {
                Action in
//                let letv = self.letters[indexPath.row]
//                self.firstCollection = letters[indexPath.row]
                
                self.firstCollection.reloadData()
                self.secondCollection.reloadData()
                
                self.firstImageView.image = UIImage(named: "5")
                self.secondImageView.image = UIImage(named: "6")
                self.thirdImageView.image = UIImage(named: "7")
                self.fourthImageview.image = UIImage(named: "8")
                self.firstCollection.reloadInputViews()
                self.word = self.word1
                self.word1 = []
                self.correctWord1 = ["Г","И","К","Т","Е","Г"]
                self.letters = ["А", "Г", "Б", "Т", "К","Л","Р","У","В","Е","З","И"]
                
            }
            
            let reapeatAction = UIAlertAction(title: "Попробовать Еще Раз", style: .default)
            alert.addAction(acceptAction)
            alert.addAction(reapeatAction)
            present(alert,animated: true)
        }
        if word == correctWord1 {
            let alert1 = UIAlertController(title: "Поздравляем", message: "вы Угадали слово", preferredStyle: .alert)
            let acceptaction = UIAlertAction(title: "Ок", style: .destructive)
            alert1.addAction(acceptaction)
            present(alert1, animated: true)
        }
        
        
    }
}
