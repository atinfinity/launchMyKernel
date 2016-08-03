# launchMyKernel
GpuMatを受け取って自作CUDAカーネルを実行するサンプルです。

## 確認環境
筆者は以下の環境にて動作確認を行いました。

* Windows 7 Professional 64bit
* GeForce GTX 980
* Visual Studio 2012 Update 5
* OpenCV 3.1(<code>WITH_CUDA</code>=ON)
* CUDA Toolkit v7.0

## 備考
### OpenCV関係
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

となっている箇所があるので、必要に応じてご自身の環境にあるOpenCVインストールディレクトリに書き換える必要があります。

### CUDA関係
同梱のプロジェクトファイル(launchMyKernel.vcxproj)ではCUDA 7.0向けのファイルをインポートしています。

```
<ImportGroup Label="ExtensionTargets">
  <Import Project="$(VCTargetsPath)\BuildCustomizations\CUDA 7.0.targets" />
</ImportGroup>
```
お手持ちのCUDA Toolkitのバージョンに合わせて書き換える必要があります。<br>
※例えば、CUDA 7.5の場合は<code>CUDA 7.5.targets</code>をインポートする必要があります。

また、同梱のプロジェクトファイル(launchMyKernel.vcxproj)ではコード生成を以下のように設定しています。

```
<CudaCompile>
  <CodeGeneration>compute_35,sm_35;compute_50,sm_50</CodeGeneration>
</CudaCompile>
```

もし、動作させるGPUが古い場合は適切なCompute Capabilityを指定する必要があります。<br>
※Compute Capabilityは[NVIDIAサイト](https://developer.nvidia.com/cuda-gpus)で確認することができます。
