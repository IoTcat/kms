# kms


[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FIoTcat%2Fkms.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FIoTcat%2Fkms?ref=badge_shield)
![size](https://badge-size.herokuapp.com/iotcat/kms/master/kms.bat)

Activate any win10 version with one click..

[简体中文](./README.md)

## Usage
Run the `kms.bat` script or run this [.exe program](https://github.com/IoTcat/kms/releases/download/v1.0/kms.exe) to activate the system.
Refer to this [Blog](https://www.eee.dog/tech/kms.html)


## Advanced Usage

### Activation code
Your activation code will be saved at `C:\Windows\kms.key`

### Run log
  - Activation log `%temp%\kms.log`
  - Tried activation codes `%temp%\kms.tried_keys`
  - kms server configuration `%temp%\kms.skms`
  - ato output information `%temp%\kms.ato`

## Thanks
This project uses [iotcat/kms-docker](https://github.com/IoTcat/kms-docker) to build a KMS server   

Thanks to [Wind4/vlmcsd](https://github.com/Wind4/vlmcsd) for providing the KMS server source code

## License
This project uses GPL-3.0 license, all non-licensed commercial use is prohibited! !
