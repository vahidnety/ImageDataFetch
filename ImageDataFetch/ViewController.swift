//
//  ViewController.swift
//  ImageDataFetch
//
//  Created by Vahid on 02/11/2020.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//      Solution1: without using extension
//        fetchImg()

//      Solution2: with using extension
        let urlString = "http://img10.deviantart.net/b810/i/2013/043/4/7/acceptable_by_aradiaries-d5urrg9.png"
        guard let imageUrl = URL(string: urlString) else { return }
//        self.imageView.setImage(from: imageUrl)//without placeholder
        self.imageView.setImage(from: imageUrl, withPlaceholder: UIImage(named: "placeHolder"))//with placeholder


    }

    func fetchImg(){
        let urlString = "http://img10.deviantart.net/b810/i/2013/043/4/7/acceptable_by_aradiaries-d5urrg9.png"
        guard let imageUrl = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: imageUrl){ data , _, _ in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }

        }.resume()

    }
}
