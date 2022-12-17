//
//  SecondViewController.swift
//  GCD
//
//  Created by Андрей Паутов on 10.12.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var image = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "VC 2"
        view.backgroundColor = .white
        loadPhoto()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        initImage()
    }
    
    func initImage() {
        image.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        image.center = view.center
        view.addSubview(image)
    }

    func loadPhoto() {
        guard let imageURL: URL = URL(string: "https://answit.com/wp-content/uploads/2017/01/full-hd.jpg") else { return }
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            if let data = try? Data(contentsOf: imageURL) {
                DispatchQueue.main.async {
                    self.image.image = UIImage(data: data)
                }
            }
        }
    }
}
