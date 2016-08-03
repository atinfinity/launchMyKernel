#include "myKernel.cuh"

#include <opencv2/imgcodecs.hpp>
#include <iostream>

int main(int argc, char *argv[])
{
    cv::Mat src = cv::imread("lena.jpg", cv::IMREAD_GRAYSCALE);
    cv::Mat dst(src.size(), src.type(), cv::Scalar(0));

    cv::cuda::GpuMat d_src(src);
    cv::cuda::GpuMat d_dst(dst.size(), dst.type());

    double f = 1000.0f / cv::getTickFrequency();
    int64 start = 0, end = 0;
    start = cv::getTickCount();

    // 自作カーネルの呼び出し
    launchMyKernel(d_src, d_dst);

    end = cv::getTickCount();
    std::cout << ((end - start) * f) << " ms." << std::endl;

    d_dst.download(dst);
    cv::imwrite("dst.png", dst);

    return 0;
}
