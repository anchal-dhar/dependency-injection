# Reference

Simple hello-world application  

### compare run times Java 8/ GraalVM/ Graal native image

#### Run Code via Java 8  

Anchals-MacBook-Pro-3:docker-java8 anchal$ time docker run anchaldocker1/hello-world
Hello World !!!

real	0m1.410s
user	0m0.039s
sys	0m0.022s


### Run via docker  
1.Create the Dockerfile  and create a repository in dockerhub  

2.build docker file  
docker build -t anchaldocker1/hello-world .  

3.Check if image is created and attached to correct tag/repository  
docker images  

Anchals-MacBook-Pro-3:hello-world anchal$ docker images
REPOSITORY                                      TAG                 IMAGE ID            CREATED             SIZE
anchaldocker1/hello-world                       latest              a0531010a25c        2 minutes ago       643MB
anchaldocker1/hello-world                       <none>              c01896916f89        4 days ago          646MB
anchaldocker1/hello-world                       <none>              b753fa4f202e        4 days ago          646MB
anchaldocker1/hello-world                       <none>              6815a2395bce        4 days ago          643MB
helloworld                                      latest              4514671b11a1        4 days ago        

4.run the docker container via below command 
( dockerfile relative path is - dependency-injection/hello-world/Dockerfile)  
Anchals-MacBook-Pro-3:hello-world anchal$ time docker run --rm anchaldocker1/hello-world
Hola

real	0m1.173s
user	0m0.036s
sys	0m0.021s

5.run the docker container via Java8 base image (dockerfile relative path is - dependency-injection/hello-world/docker-java8/Dockerfile )  
```console
Anchals-MacBook-Pro-3:docker-java8 anchal$ pwd
/Users/anchal/2019/dependency-injection-clone/dependency-injection/hello-world/docker-java8  
Anchals-MacBook-Pro-3:docker-java8 anchal$ docker build -t anchaldocker1/hello-world .
Sending build context to Docker daemon   5.12kB
Step 1/4 : FROM java:8
 ---> d23bdf5b1b1b
Step 2/4 : WORKDIR /
 ---> Using cache
 ---> 7f3526bb78e7
Step 3/4 : COPY hello-world-1.00-jar-with-dependencies.jar hello-world-1.00-jar-with-dependencies.jar
 ---> Using cache
 ---> e3dfac9c2fa2
Step 4/4 : RUN echo $JAVA_HOME
 ---> Using cache
 ---> 2514af28b541
Successfully built 2514af28b541
Successfully tagged anchaldocker1/hello-world:latest  
Anchals-MacBook-Pro-3:docker-java8 anchal$ docker images  
REPOSITORY                                      TAG                 IMAGE ID            CREATED             SIZE
anchaldocker1/hello-world                       latest              2514af28b541        2 days ago          643MB
<none>                                          <none>              e99ad3e052bb        2 days ago          1.74GB
<none>                                          <none>              d13037b03a99        
Anchals-MacBook-Pro-3:docker-java8 anchal$ docker run --entrypoint /bin/bash -i -t anchaldocker1/hello-world:latest   
root@50d978842e49:/# time java -jar hello-world-1.00-jar-with-dependencies.jar  
Hello World !!!

real	0m0.256s
user	0m0.110s
sys	0m0.140s
root@50d978842e49:/# 
```

5.run the docker container via graalvm native base image (dockerfile relative path is - dependency-injection/hello-world/docker-graalvm/Dockerfile)  
```console
Anchals-MacBook-Pro-3:docker-graalvm anchal$ pwd  
/Users/anchal/2019/dependency-injection-clone/dependency-injection/hello-world/docker-graalvm  
Anchals-MacBook-Pro-3:docker-graalvm anchal$ docker build -t anchaldocker1/hello-world .
Sending build context to Docker daemon   2.49MB
Step 1/7 : FROM oracle/graalvm-ce:19.0.0
 ---> d413331a996d
Step 2/7 : WORKDIR /opt/graalvm
 ---> Using cache
 ---> 2dfc6fb090ab
Step 3/7 : COPY hello-world-1.00-jar-with-dependencies hello-world-1.00-jar-with-dependencies
 ---> Using cache
 ---> e693679ebb21
Step 4/7 : COPY hello-world-1.00-jar-with-dependencies.jar hello-world-1.00-jar-with-dependencies.jar
 ---> Using cache
 ---> 4eac146ce3ef
Step 5/7 : RUN echo "Testing"
 ---> Using cache
 ---> 489310b094ac
Step 6/7 : RUN echo $JAVA_HOME
 ---> Using cache
 ---> bbae79a9bdf4
Step 7/7 : RUN gu install native-image
 ---> Using cache
 ---> 76342d747a28
Successfully built 76342d747a28
Successfully tagged anchaldocker1/hello-world:latest  
Anchals-MacBook-Pro-3:docker-graalvm anchal$ docker images  
REPOSITORY                  TAG                 IMAGE ID            CREATED             SIZE
<none>                      <none>              f5b77aa3bd70        4 minutes ago       643MB
anchaldocker1/hello-world   latest              76342d747a28        14 minutes ago      1.74GB
oracle/graalvm-ce           19.0.0              d413331a996d        7 weeks ago         1.71GB
java                        8                   d23bdf5b1b1b        2 years ago         643MB
Anchals-MacBook-Pro-3:docker-graalvm anchal$ 
Anchals-MacBook-Pro-3:docker-graalvm anchal$ docker run --entrypoint /bin/bash -i -t anchaldocker1/hello-world:latest  
bash-4.2# native-image -java hello-world-1.00-jar-with-dependencies.jar  
Error: Unrecognized option: -java
bash-4.2# native-image -jar hello-world-1.00-jar-with-dependencies.jar
Build on Server(pid: 11, port: 40735)*
[hello-world-1.00-jar-with-dependencies:11]    classlist:   6,278.99 ms
[hello-world-1.00-jar-with-dependencies:11]        (cap):   1,467.22 ms
[hello-world-1.00-jar-with-dependencies:11]        setup:   4,286.85 ms
[hello-world-1.00-jar-with-dependencies:11]   (typeflow):   5,779.25 ms
[hello-world-1.00-jar-with-dependencies:11]    (objects):   1,245.07 ms
[hello-world-1.00-jar-with-dependencies:11]   (features):     208.77 ms
[hello-world-1.00-jar-with-dependencies:11]     analysis:   7,379.92 ms
[hello-world-1.00-jar-with-dependencies:11]     (clinit):     156.82 ms
[hello-world-1.00-jar-with-dependencies:11]     universe:     601.44 ms
[hello-world-1.00-jar-with-dependencies:11]      (parse):   1,235.42 ms
[hello-world-1.00-jar-with-dependencies:11]     (inline):   2,327.34 ms
[hello-world-1.00-jar-with-dependencies:11]    (compile):  11,602.16 ms
[hello-world-1.00-jar-with-dependencies:11]      compile:  15,567.84 ms
[hello-world-1.00-jar-with-dependencies:11]        image:     534.49 ms
[hello-world-1.00-jar-with-dependencies:11]        write:     207.06 ms
[hello-world-1.00-jar-with-dependencies:11]      [total]:  35,195.76 ms
bash-4.2# ./hello-world-1.00-jar-with-dependencies
Hello World !!!
bash-4.2# time ./hello-world-1.00-jar-with-dependencies  
Hello World !!!

real	0m0.002s
user	0m0.000s
sys	0m0.000s
bash-4.2# 
```






