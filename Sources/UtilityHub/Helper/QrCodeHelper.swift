//
//  File.swift
//
//
//  Created by Mehedi Hasan on 1/29/24.
//

import Foundation
import EFQRCode
import UIKit


public func generateQrCodeForWifi(ssid: String , password: String, encryption: String, logo: UIImage? = nil , backgroundColor: CGColor? = nil , foregroundColor: CGColor? = nil ) -> UIImage{
    var logoImage = UIImage(named: "ic_beeda",in: .module,with: nil)!
    if let logo = logo {
        logoImage = logo
    }
    let wifiData = "WIFI:S:\(ssid);P:\(password);T:\(encryption);"
    print(wifiData)
    
    if let image = EFQRCode.generate(for: wifiData ,
                                     size: EFIntSize(width: 1200 , height: 1200) ,
                                     backgroundColor: backgroundColor ?? UIColor.white.cgColor ,
                                     foregroundColor: foregroundColor ?? UIColor.black.cgColor ,
                                     icon: logoImage.cgImage ,
                                     iconSize: EFIntSize(width: 200 , height: 200)  ) {
        print("Create QRCode image success (image)")
        return convertCGImageToUIImage(image)
        
    } else {
        print("Create QRCode image failed!")
    }
    return logoImage
}
public func generateBeedaQrCodeForWifi(ssid: String , password: String, encryption: String, logo: UIImage? = nil , backgroundColor: CGColor? = nil , foregroundColor: CGColor? = nil ) -> UIImage{
    var logoImage = UIImage(named: "ic_beeda",in: .module,with: nil)!
    if let logo = logo {
        logoImage = logo
    }
    let wifiData = "WIFI:S:\(ssid);P:\(password);T:\(encryption);"
    print(wifiData)
    
    if let image = EFQRCode.generate(for: wifiData ,
                                     size: EFIntSize(width: 1200 , height: 1200) ,
                                     backgroundColor: backgroundColor ?? UIColor.white.cgColor ,
                                     foregroundColor: foregroundColor ?? UIColor.black.cgColor ,
                                     watermark: logoImage.cgImage ,
                                     watermarkMode: .scaleAspectFit   ) {
        print("Create QRCode image success (image)")
        return convertCGImageToUIImage(image)
        
    } else {
        print("Create QRCode image failed!")
    }
    return logoImage
}

public func generateQrCodeWithMessage(message: String) -> UIImage{
    //    print(message)
    let logoImage = UIImage(named: "ic_beeda",in: .module,with: nil)!
    if let image = EFQRCode.generate(for: message ,
                                     size: EFIntSize(width: 1200 , height: 1200) ,
                                     backgroundColor: UIColor.white.cgColor ,
                                     foregroundColor: UIColor.black.cgColor  ) {
        print("Create QRCode image success (image)")
        return convertCGImageToUIImage(image)
        
    } else {
        print("Create QRCode image failed!")
    }
    return logoImage
}

public func generateBeedaQrCodeWithMessage(message: String) -> UIImage{
    //    print(message)
    let logoImage = UIImage(named: "ic_beeda",in: .module,with: nil)!
    if let image = EFQRCode.generate(for: message ,
                                     size: EFIntSize(width: 1200 , height: 1200) ,
                                     backgroundColor: UIColor.white.cgColor ,
                                     foregroundColor: UIColor.black.cgColor,
                                     watermark: logoImage.cgImage ,
                                     watermarkMode: .scaleAspectFit ) {
        print("Create QRCode image success (image)")
        return convertCGImageToUIImage(image)
        
    } else {
        print("Create QRCode image failed!")
    }
    return logoImage
}

public func convertCGImageToUIImage(_ cgImage: CGImage) -> UIImage {
    return UIImage(cgImage: cgImage)
}
