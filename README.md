# launchMyKernel
GpuMat���󂯎���Ď���CUDA�J�[�l�������s����T���v���ł��B

## �m�F��
�M�҂͈ȉ��̊��ɂē���m�F���s���܂����B

* Windows 7 Professional 64bit
* GeForce GTX 980
* Visual Studio 2012 Update 5
* OpenCV 3.1(<code>WITH_CUDA</code>=ON)
* CUDA Toolkit v7.0

## ���l
### OpenCV�֌W
���̃T���v���ł́A�����̃v���p�e�B�V�[�g(opencv310_with_cuda.props)��

* OpenCV�C���N���[�h�p�X
* ���C�u�����p�X
* �����N���C�u����

���w�肵�Ă��܂��B���̃v���p�e�B�V�[�g��

```
<PropertyGroup Label="UserMacros">
  <OPENCV_INSTALL_DIR>C:\dev\opencv-3.1.0\build\install</OPENCV_INSTALL_DIR>
</PropertyGroup>
```

�ƂȂ��Ă���ӏ�������̂ŁA�K�v�ɉ����Ă����g�̊��ɂ���OpenCV�C���X�g�[���f�B���N�g���ɏ���������K�v������܂��B

### CUDA�֌W
�����̃v���W�F�N�g�t�@�C��(launchMyKernel.vcxproj)�ł�CUDA 7.0�����̃t�@�C�����C���|�[�g���Ă��܂��B

```
<ImportGroup Label="ExtensionTargets">
  <Import Project="$(VCTargetsPath)\BuildCustomizations\CUDA 7.0.targets" />
</ImportGroup>
```
���莝����CUDA Toolkit�̃o�[�W�����ɍ��킹�ď���������K�v������܂��B<br>
���Ⴆ�΁ACUDA 7.5�̏ꍇ��<code>CUDA 7.5.targets</code>���C���|�[�g����K�v������܂��B

�܂��A�����̃v���W�F�N�g�t�@�C��(launchMyKernel.vcxproj)�ł̓R�[�h�������ȉ��̂悤�ɐݒ肵�Ă��܂��B

```
<CudaCompile>
  <CodeGeneration>compute_35,sm_35;compute_50,sm_50</CodeGeneration>
</CudaCompile>
```

�����A���삳����GPU���Â��ꍇ�͓K�؂�Compute Capability���w�肷��K�v������܂��B<br>
��Compute Capability��[NVIDIA�T�C�g](https://developer.nvidia.com/cuda-gpus)�Ŋm�F���邱�Ƃ��ł��܂��B
