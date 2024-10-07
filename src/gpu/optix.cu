#include <cuda_runtime.h>
#include <optix.h>
#include <optix_stubs.h>
#include <optix_function_table_definition.h>

#include "gpu/exceptions.hpp"

OptixDeviceContext initializeOptix() {
    OptixDeviceContext context = nullptr;

    // Initialize CUDA with a no-op call to the the CUDA runtime API
    CUDA_CHECK(cudaFree(0));

    // Take the current context.
    CUcontext cuContext = 0;
    OPTIX_CHECK(optixInit());
    OptixDeviceContextOptions options = {};
    OPTIX_CHECK(optixDeviceContextCreate(cuContext, &options, &context));

    return context;
}