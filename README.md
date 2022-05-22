# heic-photo-naming-convention

a useful tool to change the convention of heic photo names from like `IMG_0937.HEIC` to `2022-05-18_185520.HEIC`

***

## How to use

1. install `exiftool`

   ```shell
   brew install exiftool
   ```

1. get shell script

   ```bash
   cd ~
   wget https://raw.githubusercontent.com/IzumiSakai-zy/heic-photo-naming-convention/main/heicrename.sh
   ```

2. grant executable permission

   ```bash
   chmod +x heicrename.sh
   ```

3. specify a directory that contains heic files in it with `-d` option, or a heic file with `-f` option, then execute it.

   ```bash
   ./heicrename.sh -d ~/heic-directory -f ~/heic-file.HEIC
   ```

***

## Examples

### file strcture

```bash
/Users/<your username>
|--- heicrename.sh
|--- heic-directory
	|--- IMG_0933.HEIC
	|--- IMG_0934.HEIC
	|--- IMG_0937.JPG # this is not a heic file
|--- heic-file.HEIC
```

### rename a directory

1. execute command below

   ```bash
   ./heicrename.sh -d heic-directory
   ```

2. output like

   ```bash
   directory is /Users/izumisakai/heic-directory
       1 image files updated
       1 image files updated

3. result like

   ```bash
   /Users/<your username>
   |--- heic-directory
   	|--- 2022-05-18_162905.HEIC
   	|--- 2022-05-18_173417.HEIC
   	|--- IMG_0937.JPG # this file will not be changed due to it's not a heic file
   ```

   

### rename a file

1. execute command below

   ```bash
   ./heicrename.sh -f heic-file.HEIC
   ```

2. output like

   ```bash
   heic file is /Users/izumisakai/heic-file.HEIC
       1 image files updated
   ```

3. result like

   ```bash
   /Users/<your username>
   	|--- 2022-05-18_185520.HEIC
   ```

***

## Note

1. only macos tested
2. renaming action will only be successful when the heic file contains `CreateDate` exif information. you can export original photos from your Mac by following [this](https://support.apple.com/zh-cn/guide/photos/pht6e157c5f/mac)
3. for more naming-convention details please refer [exiftool renaming examples](https://exiftool.org/exiftool_pod.html#RENAMING-EXAMPLES) 

***

## Thanks

[exiftool](https://github.com/exiftool/exiftool)