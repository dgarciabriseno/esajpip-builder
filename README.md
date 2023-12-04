# ESAJPIP Builder
Containerized environment for compiling & packaging [esajpip](https://github.com/Helioviewer-Project/esajpip-SWHV/) for OL8

## Usage
```bash
mkdir rpms
docker run --rm -v $PWD/rpms:/root/out dgarciabriseno/esajpip-builder {tag or branch or commit}
```
