Nobody likes setting up forensic tools like Volatility2, so here's a dockerfile for packaging together common forensic tools.

### Main Tools included:
- Volatility 2 and 3
- sleuthkit, autopsy
- exiftool
- Binwalk, Foremost
- Steghide, stegosuite, outguess
- uncompyle6
- apktool


### Usage

First, download the Dockerfile and navigate to where it is. Then build using the following command:

```sh
docker build [-t your_image_name] .
```

Now you can run using the following command which also mounts the files from your current directory:
```sh
docker run -it -v $(pwd):/challenge [your_image_name] 
```

Symlinks for Volatility2 and Volatility3 were created. Use `vol2` and `vol3` to launch the respective versions
