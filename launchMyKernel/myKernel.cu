#include "myKernel.cuh"

#include <opencv2/cudev.hpp>
#include <cuda_runtime.h>
#include <device_launch_parameters.h>

// 画素値をネガポジ反転させるだけのCUDAカーネル
__global__ void myKernel(const cv::cudev::GlobPtrSz<uchar> src, cv::cudev::GlobPtrSz<uchar> dst)
{
	int x = blockDim.x * blockIdx.x + threadIdx.x;
	int y = blockDim.y * blockIdx.y + threadIdx.y;
	dst.data[y*src.step + x] =  UCHAR_MAX - src.data[y*src.step + x];
}

void launchMyKernel(cv::cuda::GpuMat &src, cv::cuda::GpuMat &dst)
{
	cv::cudev::GlobPtrSz<uchar> pSrc = 
		cv::cudev::globPtr(src.ptr<uchar>(), src.step, src.rows, src.cols * src.channels());

	cv::cudev::GlobPtrSz<uchar> pDst = 
		cv::cudev::globPtr(dst.ptr<uchar>(), dst.step, dst.rows, dst.cols * dst.channels());

	const dim3 block(32, 8);
	const dim3 grid(cv::cudev::divUp(src.cols, block.x), cv::cudev::divUp(src.rows, block.y));

	// 自作CUDAカーネルを呼び出す
	myKernel<<<grid, block>>>(pSrc, pDst);

	CV_CUDEV_SAFE_CALL(cudaGetLastError());
	CV_CUDEV_SAFE_CALL(cudaDeviceSynchronize());
}
