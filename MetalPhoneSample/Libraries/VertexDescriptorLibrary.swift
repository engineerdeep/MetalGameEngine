//
//  VertexDescriptorLibrary.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/15/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

enum VertexDescriptorTypes {
    case basic
}

class VertexDescriptorLibrary {
    public static var vertexDescriptors: [VertexDescriptorTypes: VertexDescriptor] = [:]
    
    public static func initialize () {
        createDefaultVertexDescriptors()
    }
    
    private static func createDefaultVertexDescriptors () {
        vertexDescriptors.updateValue(Basic_VertexDescriptor(), forKey: .basic)
    }
    
    public static func descriptor(_ vertexDescriptorType: VertexDescriptorTypes) -> MTLVertexDescriptor {
        return vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor { get }
}

public struct Basic_VertexDescriptor: VertexDescriptor {
    var name: String = "Basic Vertex Descriptor"
    var vertexDescriptor: MTLVertexDescriptor {
        let vertexDescriptor = MTLVertexDescriptor()
        
        //Position
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        //Color
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = float3.size
        
        vertexDescriptor.layouts[0].stride = Vertex.size
        
        return vertexDescriptor
    }
    
    
}
