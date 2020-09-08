# kms
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FIoTcat%2Fkms.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FIoTcat%2Fkms?ref=badge_shield)

一键激活任意版本win10

## 使用
运行kms.bat脚本进行系统激活。   
参考这篇[Blog](https://www.eee.dog/tech/kms.html)


## 进阶

### 激活码
您的激活码将保存在`C:\Windows\kms.key`

### 运行日志
 - 激活日志 `%temp%\kms.log`
 - 在本机尝试过的激活码 `%temp%\kms.tried_keys`
 - kms服务器配置 `%temp%\kms.skms`
 - ato输出信息 `%temp%\kms.ato`

## 感谢
本项目使用[iotcat/kms-docker](https://github.com/IoTcat/kms-docker)搭建KMS服务器   
感谢[Wind4/vlmcsd](https://github.com/Wind4/vlmcsd)提供KMS服务器源码   

## 开源协议
本项目使用GPL-3.0协议，禁止一切非许可商业使用！！


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FIoTcat%2Fkms.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FIoTcat%2Fkms?ref=badge_large)