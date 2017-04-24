//
//  Data.swift
//  Thompson Center App
//
//  Created by Jeff Orr on 4/21/17.
//  Copyright © 2017 Chase J Allen. All rights reserved.
//

import Foundation

struct ChildStruct {
    var childName: String
    var birthDate: Date
    var doctorName: String
    var medication: String
}

class Data {
    
    //Make singleton
    static var sharedInstance = Data()
    
    var children = [ChildStruct]()
    
    
    func addChild(){
        
    }
    
    func removeChild() {
        
    }
    
    func getAllChildren() {
        
    }
    
    private init() {
        //Makes true singleton
        
        let child = ChildStruct(childName: "Billy", birthDate: Date(), doctorName: "Dr. Rachel Rick", medication: "Advil")
        children.append(child)
        
        let child2 = ChildStruct(childName: "Sarah", birthDate: Date(), doctorName: "Dr. Steven Jones", medication: "Advil")
        children.append(child2)
        
        let child3 = ChildStruct(childName: "Johnny", birthDate: Date(), doctorName: "Dr. Jeff Lohr", medication: "Advil")
        children.append(child3)
        
    }
    
    
}
