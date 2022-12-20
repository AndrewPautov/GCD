//
//  Lesson5.swift
//  GCD
//
//  Created by Андрей Паутов on 17.12.2022.
//

import Foundation
import UIKit

// MARK: - Exapmle 1 of Dispatch Group
class DispatchGroupTest {
    
    private let queueSerial = DispatchQueue(label: "Lesson5")
    
    private let groupRed = DispatchGroup()
    
    func loadInfo() {
        
        queueSerial.async(group: groupRed) {
            sleep(1)
            print("1")
        }
        
        queueSerial.async(group: groupRed) {
            sleep(1)
            print("2")
        }
        
        groupRed.notify(queue: .main) {
            print("finish all")
        }
        
    }
    
}

// MARK: - Exapmle 2 of Dispatch Group
class DispatchGroupTest2 {
    
    private let queueConcurrent = DispatchQueue(label: "Lesson5", attributes: .concurrent)
    
    private let groupBlack = DispatchGroup()
    
    func loadInfo() {
        groupBlack.enter()
        queueConcurrent.async {
            sleep(1)
            print("1")
            self.groupBlack.leave()
        }
        
        groupBlack.enter()
        queueConcurrent.async {
            sleep(2)
            print("2")
        }
        
        groupBlack.wait()
        
        print("finish")
        
        groupBlack.notify(queue: .main) {
            print("finish all")
        }
    }
    
}

// MARK: - Exapmle 3 of Dispatch Group in Simulalor
class EightImage: UIView {
    public var ivs = [UIImageView]()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 100, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 0, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))
        
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 300, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 0, y: 400, width: 100, height: 100)))
        ivs.append(UIImageView(frame: CGRect(x: 100, y: 400, width: 100, height: 100)))
        
        for i in 0...7 {
            ivs[i].contentMode = .scaleAspectFit
            self.addSubview(ivs[i])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageURLs = ["https://storge.pic2.me/cm/5120x2880/566/593fd655eec57.jpg", "https://mobimg.b-cdn.net/v3/fetch/b7/b76a766ef450b12d3f47b8d5dcd3b0bb.jpeg?w=1470&r=0.5625", "https://catherineasquithgallery.com/uploads/posts/2021-02/1612678074_74-p-kartinka-fon-zelenii-lug-125.jpg", "https://mobimg.b-cdn.net/v3/fetch/89/89b1452e43e738be92c573fdebfb1d22.jpeg" ]

    var images = [UIImage]()
    
    func asyncLoadImage(imageURL: URL, runQueue: DispatchQueue, completionQueue: DispatchQueue, completion: @escaping(UIImage?, Error?) -> ()) {
        
        runQueue.async {
            do {
                guard let data = try? Data(contentsOf: imageURL) else { return }
                completionQueue.async {
                    completion(UIImage(data: data), nil)
                }
            } catch let error {
                completionQueue.async {
                    completion(nil, error)
                }
            }
        }
    }
}

