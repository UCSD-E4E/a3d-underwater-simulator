#include <cuda_runtime.h>
#include <optix.h>
#include <optix_stubs.h>
#include <optix_function_table_definition.h>

void initialize_optix() {
    OptixDeviceContext context = nullptr;

    // Initialize CUDA with a no-op call to the the CUDA runtime API
    cudaFree(0);

    // Take the current context.
    CUcontext cuContext = 0;
    optixInit();
    OptixDeviceContextOptions options = {};
    optixDeviceContextCreate(cuContext, &options, &context);
}