# docker-archi-cli

Wrapper for the [Archimate Tool](https://github.com/archimatetool/archi) as docker container

# Usage

simply run the docker container with corresponding command line arguments (as stated in the [Archi CLI documentation](https://github.com/archimatetool/archi/wiki/Archi-Command-Line-Interface)) and map the volumes `/data/input` and `/data/output`:

```
docker run -v `pwd`:/data/input -v `pwd`:/data/output archi:latest --loadModel /data/input/model.archimate --html.createReport /data/output/model
```
