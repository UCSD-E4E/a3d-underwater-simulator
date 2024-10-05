#include <cuda_runtime.h>
#include <optix.h>

void initialize_optix() {
    // Initialize CUDA with a no-op call to the the CUDA runtime API
    cudaFree(0);
}