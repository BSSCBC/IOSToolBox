//
//  BSSSandboxToolCache.swift
//  IOSToolBox
//
//  Created by BSSCBC on 2024/10/13.
//

import UIKit

extension BSSSandboxTool {
    public static func bccaluefileSize(atPath path: String) -> Int? {
        let fileManager = FileManager.default
        
        // 检查文件是否存在
        if fileManager.fileExists(atPath: path) {
            // 尝试获取文件的大小
            do {
                let attributes = try fileManager.attributesOfItem(atPath: path)
                if let size = attributes[.size] as? Int {
                    return size
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        } else {
            print("File does not exist at path: \(path)")
        }
        
        return nil
    }
}

extension BSSSandboxTool {
    public static func bccaluefolderSize(atPath path: String) -> Int? {
        let fileManager = FileManager.default
        
        // 检查文件夹是否存在
        var isDir: ObjCBool = false
        if fileManager.fileExists(atPath: path, isDirectory: &isDir) && isDir.boolValue {
            // 遍历文件夹
            do {
                let contents = try fileManager.subpathsOfDirectory(atPath: path)
                var folderSize: Int = 0
                
                for content in contents {
                    let fullPath = path.appending("/\(content)")
                    do {
                        let attributes = try fileManager.attributesOfItem(atPath: fullPath)
                        if let size = attributes[.size] as? Int {
                            folderSize += size
                        }
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
                
                return folderSize
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        } else {
            print("Folder does not exist at path: \(path)")
        }
        
        return nil
    }
}

extension BSSSandboxTool {
    public static func bccalculatefilesize(filePath : String) -> Float {
        
        let fileManager = FileManager.default
        
        do {
            let fileSize = try fileManager.attributesOfItem(atPath: filePath)[FileAttributeKey.size]
            
            return (fileSize as? Float) ?? 0
            
        } catch {
            print(error)
            return 0
        }
        
    }
    
    public static func bccalculatefoldersize(folderPath : String, completion : @escaping (_ fileSize : Float)->()) {
        
        let operation = BlockOperation{
            
            var fileSize : Float = 0.0
            
            let fileManager = FileManager.default
            
            guard let fileArray = fileManager.subpaths(atPath: folderPath) else {
                return completion(fileSize)
            }
            
            for filePath in fileArray {
                if filePath.hasPrefix(".DS") {
                    continue
                }
                let fileAllPath = (folderPath as NSString).appendingPathComponent(filePath)
                
                fileSize = fileSize + (bccalculatefilesize(filePath: fileAllPath))
            }
            
            return completion(fileSize)
        }
        
        let queue = OperationQueue.init()
        queue.addOperation(operation)
    }
    
}

extension BSSSandboxTool{
    public static func bccalculatecachessize(completion : @escaping (_ fileSize : Float)->()) {
        guard let path = bccachespath() else {
            completion(0)
            return
        }
        bccalculatefoldersize(folderPath: path) { (size) in
            completion(size)
        }
    }
    
    public static func bccalculatetempsize(completion : @escaping (_ fileSize : Float)->()) {
        bccalculatefoldersize(folderPath: bctemppath()) { (size) in
            completion(size)
        }
    }
    
    public static func bcdeletecache(finishCallBack: (() -> Void)? = nil) {
        guard let path = bccachespath() else {
            return
        }
        bcdeletefileoffolder(folderPath: path, finishCallBack: finishCallBack)
    }
    
    public static func bcdeletetemp(finishCallBack: (() -> Void)? = nil) {
        bcdeletefileoffolder(folderPath: bctemppath(), finishCallBack: finishCallBack)
    }
}

extension BSSSandboxTool {
    public static func bcdeletefile(filePath : String) -> Bool {
        let fileManager = FileManager.default
        
        do {
            try fileManager.removeItem(atPath: filePath)
            return true
        } catch  {
            return false
        }
    }
    
    public static func bcdeletefileoffolder(folderPath : String, finishCallBack: (() -> Void)? = nil) {
        //  获取文件管理者
        let fileManager = FileManager.default
        
        guard let fileArray = fileManager.subpaths(atPath: folderPath) else {
            if finishCallBack != nil {
                finishCallBack!()
            }
            return
        }
        
        if fileArray.count <= 0 {
            if finishCallBack != nil {
                finishCallBack!()
            }
        }
        
        DispatchQueue(label: "deleteFile").async {
            //  遍历文件夹
            for (index, filePath) in fileArray.enumerated() {
                //  拼接完整路径
                let fileAllPath = (folderPath as NSString).appendingPathComponent(filePath)
                
                if (bcdeletefile(filePath: fileAllPath)) {
                    if index == fileArray.count - 1 {
                        if finishCallBack != nil {
                            finishCallBack!()
                        }
                    }
                    continue
                }else{
                    if finishCallBack != nil {
                        finishCallBack!()
                    }
                }
            }
        }
    }
}
