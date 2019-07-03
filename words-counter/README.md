# Reference

Simple word-counter application  

### compare run times Java 8/ GraalVM/ Graal native image

#### Run Code via Java 8  
```console
The JAVA_HOME points to - JAVA_HOME = /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
Inside Main !!!
1 (452 ms)
2 (410 ms)
3 (173 ms)
4 (409 ms)
5 (227 ms)
6 (142 ms)
7 (676 ms)
8 (646 ms)
9 (222 ms)
total: 39999996 (3478 ms)

real	0m3.731s
user	0m2.385s
sys	0m0.743s

#### Run Code via Java graal vm ce  
The JAVA_HOME points to - JAVA_HOME = /Library/Java/JavaVirtualMachines/graalvm-ce-19.0.2/Contents/Home
Inside Main !!!
1 (337 ms)
2 (166 ms)
3 (137 ms)
4 (158 ms)
5 (123 ms)
6 (105 ms)
7 (224 ms)
8 (143 ms)
9 (102 ms)
total: 39999996 (1609 ms)

real	0m1.785s
user	0m1.897s
sys	0m0.387s

#### Run Code via Java graal native image  
The JAVA_HOME points to - JAVA_HOME = /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
Inside Main !!!
1 (1022 ms)
2 (800 ms)
3 (701 ms)
4 (753 ms)
5 (817 ms)
6 (761 ms)
7 (702 ms)
8 (690 ms)
9 (752 ms)
total: 39999996 (7819 ms)

real	0m7.843s
user	0m7.357s
sys	0m0.205s
Anchals-MacBook-Pro-3:words-counter anchal
```
