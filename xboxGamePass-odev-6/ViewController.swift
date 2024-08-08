//
//  ViewController.swift
//  xboxGamePass-odev-6
//
//  Created by İbrahim Cem Ekti on 7.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var kategori = ["BAĞIMSIZ","AİLE","KLASİKLER","NİŞANCI","SPOR","MACERA","PLATFORM","DÖVÜŞ"]
    var images: [UIImage?] = [
            UIImage(systemName: "lightbulb.fill"),
            UIImage(systemName: "figure.2.and.child.holdinghands"),
            UIImage(systemName: "gamecontroller"),
            UIImage(systemName: "scope"),
            UIImage(systemName: "football"),
            UIImage(systemName: "sailboat"),
            UIImage(systemName: "baseball.diamond.bases"),
            UIImage(systemName: "figure.boxing")
        ]
        
        
    override func viewDidLoad() {
            super.viewDidLoad()

            collectionView.delegate = self
            collectionView.dataSource = self

            // Flow Layout oluşturma
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical // Dikey kaydırma
            layout.minimumLineSpacing = 10 // Satırlar arasındaki boşluk
            layout.minimumInteritemSpacing = 5 // Hücreler arasındaki boşluk
            
            let itemWidth = (view.bounds.width - 30) / 2 // Her hücrenin genişliği
            let itemHeight: CGFloat = 100 // Her hücrenin yüksekliği
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)

            collectionView.collectionViewLayout = layout
        }
    }
    
func createLayout() -> UICollectionViewLayout {
        // Item boyutu
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Grup boyutu (2 hücre bir grup oluşturur)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        
        // Grup arası boşluk
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.interGroupSpacing = 5 // Grup arasındaki boşluk
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20) // Kenar boşlukları
        
        // Düzen oluşturma
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kategori.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? HucreTasarim
        
        cell?.imageView.image = images[indexPath.row]
        cell?.labelKategori.text = kategori[indexPath.row]
        
        print(images[indexPath.row]!) // Bu satırı ekleyerek resmin yüklendiğinden emin olun

        
        return cell!
    }
    
    
}

