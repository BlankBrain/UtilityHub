// 
// 
//
// Created by Rakibur Khan on 9/5/23.
// Copyright © 2023 Beeda Inc. All rights reserved.
//

import UIKit
import RKAPIService

public class ImageRepository {
    static let shared: ImageRepository  = ImageRepository()
    
    private let session: RKAPIService
    private var queue: OperationQueue
    private var imageCache = NSCache<NSString, UIImage>()
    private var dataCache = NSCache<NSString, NSData>()
    
    public init() {
        var configuration: URLSessionConfiguration {
            let config = URLSessionConfiguration.ephemeral
            config.waitsForConnectivity = true
            config.allowsConstrainedNetworkAccess = true
            config.allowsCellularAccess = true
            config.networkServiceType = .background
            
            return config
        }
        
        queue = OperationQueue()
        queue.qualityOfService = .background
        
        session = RKAPIService(sessionConfiguration: configuration, delegate: nil, queue: queue)
        
        imageCache.countLimit = 500
    }
    
    deinit {
        destroyData()
    }
    
    private func downloadImage(imageURL: String, completion: ((UIImage?) ->Void)? = nil) async -> (UIImage?, Data?) {
        
        guard let url = URL(string: imageURL) else {return (nil, nil)}
        
        let reply = try? await session.fetchItems(urlLink: url, additionalHeader: nil)
        
        var downloadedImage: UIImage?
        var downloadedData: Data?
        
        if let imageData = reply?.data {
            downloadedImage = UIImage(data: imageData)
            downloadedData = imageData
        }
        
        if let data = downloadedData {
            self.dataCache.setObject(data as NSData, forKey: imageURL as NSString)
        }
        
        if let image = downloadedImage {
            
            self.imageCache.setObject(image, forKey: imageURL as NSString)
        }
        
        return (downloadedImage, downloadedData)
    }
   
    public func saveImage(url: String, image: UIImage?) {
        if let photo = image {
            imageCache.setObject(photo, forKey: url as NSString)
        }
    }
    
    public func getImage(imageURL: String?) async -> UIImage? {
        guard let url = imageURL else { return nil }
        
        if let image = imageCache.object(forKey: url as NSString){
            return image
        }
        else{
            let (image, _) = await downloadImage(imageURL: url)
            
            return image
        }
    }
    
    public func getImage(imageURL: URL?) async -> UIImage? {
        guard let url = imageURL?.absoluteString else { return nil }
        
        if let image = imageCache.object(forKey: url as NSString){
            return image
        }
        else{
            let (image, _) = await downloadImage(imageURL: url)
            
            return image
        }
    }
    
    public func getData(imageURL: String?) async -> Data? {
        guard let url = imageURL else { return nil }
        
        if let data = dataCache.object(forKey: url as NSString){
            return data as Data
        }
        else{
            let (_, data) = await downloadImage(imageURL: url)
            return data
        }
    }
    
    public func getData(imageURL: URL?) async -> Data? {
        guard let url = imageURL?.absoluteString else { return nil }
        
        if let data = dataCache.object(forKey: url as NSString){
            return data as Data
        }
        else{
            let (_, data) = await downloadImage(imageURL: url)
            return data
        }
    }
    
    public func clearData() {
        imageCache.removeAllObjects()
    }
    
    public func destroyData() {
        queue.cancelAllOperations()
        session.invalidateAndCancelSession()
        clearData()
    }
}
