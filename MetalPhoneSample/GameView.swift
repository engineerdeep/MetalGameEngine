//
//  ViewController.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 4/26/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

class GameView: MTKView {
    
    struct Vertex {
        var position: float3
        var color: float4
    }
    
    var commandQueue: MTLCommandQueue!
    var renderPipelineState: MTLRenderPipelineState!
    
    var vertices: [Vertex]!
    
    var vertexBuffer: MTLBuffer!

    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        self.clearColor = MTLClearColor(red: 0.0, green: 0.4, blue: 0.6, alpha: 1.0)
        
        self.colorPixelFormat = .bgra8Unorm
        
        self.commandQueue = device?.makeCommandQueue()
        
        createRenderPipelineState()
        createVertices()
        createBuffers()
    }
    
    func createVertices() {
        vertices = [
            Vertex(position: float3(0, 0.1, 0), color: float4(1,0,0,1)),
            Vertex(position: float3(-0.2, -0.1, 0), color: float4(0,1,0,1)),
            Vertex(position: float3(0.2, -0.1, 0), color: float4(0,0,1,1))
        ]
    }
    
    func createBuffers() {
        vertexBuffer = device?.makeBuffer(bytes: vertices, length: MemoryLayout<Vertex>.stride * vertices.count, options: [])
    }
    
    func createRenderPipelineState () {
        let library = device?.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
        let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
        
        let renderPipelineStateDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        renderPipelineStateDescriptor.vertexFunction = vertexFunction
        renderPipelineStateDescriptor.fragmentFunction = fragmentFunction
        
        do {
            renderPipelineState = try device?.makeRenderPipelineState(descriptor: renderPipelineStateDescriptor)
        } catch let error as NSError {
            print(error)
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard let drawable = self.currentDrawable, let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
        
        let commandBuffer = commandQueue?.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
