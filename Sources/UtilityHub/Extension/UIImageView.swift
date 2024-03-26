// 
// Beeda Driver
//
// Created by Rakibur Khan on 27/10/22.
// Copyright © 2022 Beeda Inc. All rights reserved.
//

import UIKit
import SVGKit

public extension UIImageView {
    func load(url: URL?, placeholder: UIImage? = UIImage(named: "placeholder"), cache: ImageRepository? = nil) {
        Task {
            await load(url: url, placeholder: placeholder, cache: cache)
        }
    }
    
    @discardableResult
    func load(url: URL?, placeholder: UIImage? = UIImage(named: "placeholder"), cache: ImageRepository? = nil) async -> Bool {
        var repository: ImageRepository?
        
        if let cache = cache {
            repository = cache
        } else {
            repository = ImageRepository.shared
        }
        
        switch url?.pathExtension {
            case "gif":
                let imageData = await repository?.getData(imageURL: url)
                if let data = imageData {
                    if let image = UIImage.gifImageWithData(data) {
                        await MainActor.run {
                            self.image = image
                        }
                        
                        return true
                    } else {
                        await MainActor.run {
                            self.image = placeholder
                        }
                    }
                } else {
                    self.image = placeholder
                }
                
            case "svg":
                let imageData = await repository?.getData(imageURL: url)
                
                if let data = imageData {
                    if let anSVGImage: SVGKImage = SVGKImage(data: data) {
                        await MainActor.run {
                            self.image = anSVGImage.uiImage
                        }
                        return true
                    } else {
                        await MainActor.run {
                            self.image = placeholder
                        }
                    }
                } else {
                    await MainActor.run {
                        self.image = placeholder
                    }
                }
                
            default:
                let image = await repository?.getImage(imageURL: url)
                if let image = image {
                    await MainActor.run{
                        self.image = image
                    }
                    return true
                } else {
                    await MainActor.run {
                        self.image = placeholder
                    }
                }
        }
        
        return false
    }
    
    @discardableResult
    func loadGIF(data: Data, placeholder: UIImage? = UIImage(named: "placeholder"))-> Bool {
        if let image = UIImage.gifImageWithData(data) {
            self.image = image
            
            return true
        } else {
            self.image = placeholder
        }
        
        return false
    }
    
    @discardableResult
    func loadGIF(_ fileURL: String, placeholder: UIImage? = UIImage(named: "placeholder"))-> Bool {
        if let image = UIImage.gifImageWithURL(fileURL) {
            self.image = image
            
            return true
        } else {
            self.image = placeholder
        }
        
        return false
    }
    
    @discardableResult
    func loadGIF(_ name: String, bundle: Bundle = .main, placeholder: UIImage? = UIImage(named: "placeholder"))-> Bool {
        if let image = UIImage.gifImageWithName(name, bundle: bundle) {
            self.image = image
            
            return true
        } else {
            self.image = placeholder
        }
        
        return false
    }
}
