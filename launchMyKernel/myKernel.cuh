#pragma once

#include <opencv2/core.hpp>
#include <opencv2/core/cuda.hpp>

void launchMyKernel(cv::cuda::GpuMat &src, cv::cuda::GpuMat &dst);
