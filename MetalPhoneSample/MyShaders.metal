//
//  MyShaders.metal
//  MetalPhoneSample
//
//  Created by Deep Ashok on 4/26/20.
//  Copyright © 2020 vie. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position;
    float4 color;
};

vertex float4 basic_vertex_shader(device VertexIn *vertices [[ buffer(0) ]],
                                  uint vertexID [[ vertex_id ]]) {
    return float4(vertices[vertexID].position, 1);
}

fragment half4 basic_fragment_shader() {
    return half4(1);
}
