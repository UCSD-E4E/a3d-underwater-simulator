#pragma once

#include <cuda_runtime.h>
#include <iostream>
#include <optix.h>

#define CUDA_CHECK(ans) { cudaCheck(ans, __FILE__, __LINE__); }
inline void cudaCheck(cudaError_t result, const char *file, int line) {
    if (result != cudaSuccess)
    {
        std::cerr << "cudaCheck: " << cudaGetErrorString(result) << " " << file << " " << line << std::endl;
    }
}

#define OPTIX_CHECK(ans) { optixCheck(ans, __FILE__, __LINE__); }
inline void optixCheck(OptixResult result, const char *file, int line) {
    if (result != OPTIX_SUCCESS)
    {
        std::cerr << "optixCheck: " << optixGetErrorString(result) << " " << file << " " << line << std::endl;
    }
}