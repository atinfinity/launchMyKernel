# launchMyKernel
GpuMat���󂯎���Ď���CUDA�J�[�l�������s����T���v��

## �m�F��
* Windows 7 Professional 64bit
* GeForce GTX 980
* Visual Studio 2012 Update 5
* OpenCV 3.1(<code>WITH_CUDA</code>=ON)
* CUDA Toolkit v7.0

## ���l
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

�ƂȂ��Ă���ӏ�������̂ŁA�K�v�ɉ����Ă����g�̊��ɂ���OpenCV�C���X�g�[���f�B���N�g���ɏ��������Ă��������B
