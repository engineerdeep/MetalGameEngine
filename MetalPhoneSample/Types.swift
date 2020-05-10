//
//  Types.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/10/20.
//  Copyright © 2020 vie. All rights reserved.
//

import simd

protocol sizable {
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}

extension sizable {
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

extension float3: sizable { }

struct Vertex: sizable {
    var position: float3
    var color: float4
}
