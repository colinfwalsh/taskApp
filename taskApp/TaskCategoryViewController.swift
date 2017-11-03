//
//  TaskCategoryViewController.swift
//  taskApp
//
//  Created by Colin Walsh on 11/3/17.
//  Copyright © 2017 Colin Walsh. All rights reserved.
//

import UIKit

class TaskCategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var taskCategory: [ListItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(
            UINib(
                nibName: "CategoryCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "categoryCell"
        )

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.45, height: collectionView.frame.height/3);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let CVCell = self.collectionView.cellForItem(at: indexPath)
        self.performSegue(withIdentifier: "showTasks", sender: CVCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTasks" {
            let destinationVC = segue.destination as? TaskViewController
            let cell = sender as! UICollectionViewCell
            let indexPath = self.collectionView.indexPath(for: cell)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {return UICollectionViewCell()}
        
        cell.categoryTitle?.text = "Title"
        cell.taskCount?.text = "0"
 
        return cell
    }
    
    

}
