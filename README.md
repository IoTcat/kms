# kms

[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FIoTcat%2Fkms.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FIoTcat%2Fkms?ref=badge_shield)
![size](https://badge-size.herokuapp.com/iotcat/kms/master/kms.bat)

一键激活任意版本Windows 8/10/11    

> 本项目仅供学术测试目的！请在激活后24小时内自行注销激活！谢谢！   

## 使用
 1. 下载源码压缩包，可通过GitHub或国内链接:（[http://eee.dog/kms](http://eee.dog/kms)）   
 2. 解压压缩包到任意本地文件夹（比如桌面）   
 3. 运行`kms`文件进行系统激活   

## 进阶

### 原理
 - 快速激活将使用kms服务器配合[gvlk激活码](./keys/gvlk.keys)进行激活。
 - 永久激活将暴力尝试所有从互联网上搜集的[retail, oem, mak激活码](./keys/mak.keys)。如果均失败再尝试快速激活。


### 激活码
您的激活码将保存在`C:\Windows\kms.key`

### 运行日志
 - 激活日志 `%temp%\kms.log`
 - 在本机尝试过的激活码 `%temp%\kms.tried_keys`
 - kms服务器配置 `%temp%\kms.skms`
 - ato输出信息 `%temp%\kms.ato`

## 声明
本项目使用的所有资源（激活码，KMS服务器）均源自互联网！本项目不对此负任何责任！

## 开源协议
本项目使用MIT协议。

## Stargazers over time

[![Stargazers over time](https://starchart.cc/IoTcat/kms.svg)](https://starchart.cc/IoTcat/kms)