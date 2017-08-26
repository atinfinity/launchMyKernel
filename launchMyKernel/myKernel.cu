#include "myKernel.cuh"

#include <opencv2/cudev.hpp>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

// 画素値をネガポジ反転させるだけのCUDAカーネル
__global__ void myKernel(const cv::cudev::GlobPtrSz<uchar> src, cv::cudev::GlobPtrSz<uchar> dst)
{
    const int x = blockDim.x * blockIdx.x + threadIdx.x;
    const int y = blockDim.y * blockIdx.y + threadIdx.y;
    if((x < dst.cols) && (y < dst.rows)){
        dst.data[y*src.step + x] = UCHAR_MAX - src.data[y*src.step + x];
    }
}

void launchMyKernel(cv::cuda::GpuMat &src, cv::cuda::GpuMat &dst)
{
    const dim3 block(32, 8);
    const dim3 grid(cv::cudev::divUp(src.cols, block.x), cv::cudev::divUp(src.rows, block.y));

    // 自作CUDAカーネルを呼び出す
    myKernel<<<grid, block>>>(src, dst);

    CV_CUDEV_SAFE_CALL(cudaGetLastError());
    CV_CUDEV_SAFE_CALL(cudaDeviceSynchronize());
}
