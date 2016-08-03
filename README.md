# launchMyKernel
GpuMatを受け取って自作CUDAカーネルを実行するサンプル

## 確認環境
* Windows 7 Professional 64bit
* GeForce GTX 980
* Visual Studio 2012 Update 5
* OpenCV 3.1(<code>WITH_CUDA</code>=ON)
* CUDA Toolkit v7.0

## 備考
このサンプルでは、同梱のプロパティシート(opencv310_with_cuda.props)で

* OpenCVインクルードパス
* ライブラリパス
* リンクライブラリ

を指定しています。このプロパティシートで

```
<PropertyGroup Label="UserMacros">
  <OPENCV_INSTALL_DIR>C:\dev\opencv-3.1.0\build\install</OPENCV_INSTALL_DIR>
</PropertyGroup>
```

となっている箇所があるので、必要に応じてご自身の環境にあるOpenCVインストールディレクトリに書き換えてください。
