//
//  MeshLibrary.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/17/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

enum MeshTypes {
    case triangle
    case quad
}

class MeshLibrary {
    private static var meshes: [MeshTypes: Mesh] = [:]

    public static func initialize() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes.updateValue(TriangleMesh(), forKey: .triangle)
        meshes.updateValue(QuadMesh(), forKey: .quad)
    }
    
    public static func mesh(_ meshType: MeshTypes) -> Mesh {
        return meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createVertices() { }
    
    func createBuffers() {
        vertexBuffer = Engine.device.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
}

class TriangleMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: float3(0, 0.1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-0.2, -0.1, 0), color: float4(0,1,0,1)),
            Vertex(position: float3(0.2, -0.1, 0), color: float4(0,0,1,1))
        ]
    }
}

class QuadMesh: CustomMesh {
    override func createVertices() {
        vertices = [
            Vertex(position: float3(0.2, 0.1, 0), color: float4(1,0,0,1)),      //Top Right
            Vertex(position: float3(-0.2, 0.1, 0), color: float4(0,1,0,1)),     //Top Left
            Vertex(position: float3(-0.2, -0.1, 0), color: float4(0,0,1,1)),    //Bottom Left
            
            Vertex(position: float3(0.2, 0.1, 0), color: float4(1,0,0,1)),      //Top Right
            Vertex(position: float3(-0.2, -0.1, 0), color: float4(0,0,1,1)),    //Bottom Left
            Vertex(position: float3(0.2, -0.1, 0), color: float4(1,0,1,1)),     //Bottom Right
        ]
    }
}
