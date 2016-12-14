Batter manager for thinkpad x250 for ubuntu 14.04
=================================================

## About this tips ##

Thinkpadのバッテリの寿命を伸ばすための方法のメモ  
TLPを利用する.TLPはX230以下のsandy bridgeまでしか対応してないかも.



## TLP ##

- **Ubuntu 16.04**
  ubuntu公式リポジトリで提供されている.最新バージョンを利用する際にはPPAの追加が必要.
  
- **Ubuntu 14.04**
  Add the TLP-PPA to yourpackage sources with the commands:
  
  ```sh
  sudo add-apt-repository ppa:linrunner/tlp
  sudo apt-get update
  ```
	  
- **Package install**

	install the following package
	
	- tlp - Power saving
	- tlp-rdw - optional, Radio Device Wizard
	- tp-smapi-dkms - optional, ThinkPad only. for battery charge thresholds.
	- acpi-call-dkms - ThinkPad only for newer model X220, X230
	
	Install with the commands after you add PPA repo.

	```sh
	sudo apt-get install tlp tlp-rdw tp-smapi-dkms acpi-call-dkms
	```
	
	> Note: ThinkPad Specify is needed to disable secure boot.
	






