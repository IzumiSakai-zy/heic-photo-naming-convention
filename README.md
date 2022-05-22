# heic-photo-naming-convention

a useful tool to change the convention of iphone heic photo names from like `IMG_0937.HEIC` to `2022-05-18_185520.HEIC`



## How to use

1. get shell script

   ```bash
   cd ~
   wget 
   ```

2. grant executable permission

   ```bash
   chmod +x heicrename.sh
   ```

3. specify a directory that contains heic files in it with `-d` option, or a heic file with `-f` option, then execute it.

   ```bash
   ./heicrename.sh -d ~/heic-directory -f ~/IMG_0651.HEIC
   ```

## Examples

### file strcture

```bash
/Users/<your usrname>
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

3. result like

   ```bash
   /Users/<your usrname>
   |--- heic-directory
   	|--- IMG_0933.HEIC
   	|--- IMG_0934.HEIC
   	|--- IMG_0937.JPG # this file will not change due to it's not a heic file
   ```

   

### rename a file

1. execute command below

   ```bash
   ./heicrename.sh -f IMG_0933.HEIC
   ```

2. output like

   ```bash
   
   ```

3. result like

   ```bash
   /Users/<your usrname>
   	|--- IMG_0933.HEIC
   ```

## Note

only macos tested



## Thanks

[exiftool](https://github.com/exiftool/exiftool)