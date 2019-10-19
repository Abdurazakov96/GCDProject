//
//  ViewController.swift
//  GCDProject
//
//  Created by Магомед Абдуразаков on 19/10/2019.
//  Copyright © 2019 Магомед Абдуразаков. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    //MARK: Public properties
    
    let urlFirst = "https://somanyhorses.ru/wp-content/images/lifestyle/lifehack/2017/10105cb065b64d448_5.jpg"
    let urlSecond = "https://cdn.shazoo.ru/c1430x645/71738_W4YRXXxZUT_need_for_speed_hot_pursuit_lambo.jpg"
    let urlThird = "https://cs8.pikabu.ru/post_img/big/2016/02/24/8/145631569519169246.jpg"
    let urlFourth = "https://s0.rbk.ru/v6_top_pics/media/img/0/63/755174936982630.jpg"
    var arrayOfData: [Data] = []
    
    
    //MARK: IBOtlets
    
    @IBOutlet var imageFirst: UIImageView!
    @IBOutlet var imageSecond: UIImageView!
    @IBOutlet var imageThird: UIImageView!
    @IBOutlet var imageFourth: UIImageView!
    
    
    //MARK: Overriden methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //MARK: IBAction
    
    @IBAction func showImages(_ sender: Any) {
        let queue = DispatchQueue(label: "queque", attributes: .concurrent)
        let group = DispatchGroup()
        
        queue.async(group: group) {
            self.downloadImage(urlString: self.urlFirst)
        }
        
        queue.async(group: group) {
            self.downloadImage(urlString: self.urlSecond)
        }
        
        queue.async(group: group) {
            self.downloadImage(urlString: self.urlThird)
        }
        
        queue.async(group: group) {
            self.downloadImage(urlString: self.urlFourth)
        }
        
        group.notify(queue: .main) {
            
            self.imageFirst.image = UIImage(data: self.arrayOfData[0])
            self.imageSecond.image = UIImage(data: self.arrayOfData[1])
            self.imageThird.image = UIImage(data: self.arrayOfData[2])
            self.imageFourth.image = UIImage(data: self.arrayOfData[3])
            
            
        }
        
    }
    
    
    //MARK: Public method
    
    func downloadImage(urlString: String) {
        
        guard let url = URL(string: urlString) else {return}
        
        guard let imageDate = try? Data(contentsOf: url) else {return}
        
        arrayOfData.append(imageDate)
        
        
        let date = Date()
        let calendar = Calendar.current
        let seconds = calendar.component(.second, from: date)
        let nanoSeconds = calendar.component(.nanosecond, from: date)
        print("Время загрузки изображения: \(seconds):\(nanoSeconds)")
        
    }
    
}

