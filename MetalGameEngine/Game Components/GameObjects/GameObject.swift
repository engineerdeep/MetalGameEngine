//
//  Gameobject.swift
//  MetalPhoneSample
//
//  Created by Deep Ashok on 5/15/20.
//  Copyright © 2020 vie. All rights reserved.
//

import MetalKit

class GameObject: Node {
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        mesh = MeshLibrary.mesh(meshType)
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        //        renderCommandEncoder.setTriangleFillMode(.lines)
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
