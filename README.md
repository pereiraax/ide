# My IDE setup as a docker container

### Build 

>  docker build -t axelpereira/ide:develop .

### Test 

>   docker run -it axelpereira/ide:develop

### Push

> docker login # on DockerHub

> docker push axelpereira/ide:develop

### How to use it 

#### windows command line exec : 

```sh
docker run -v %HOMEPATH%\.kube\config:/root/.kube/config -it axelpereira/ide:develop
```

#### Other unix like command line exec :

```sh
docker run \
-v ~/.kube/config:/root/.kube/config \
-it axelpereira/ide:develop
```
