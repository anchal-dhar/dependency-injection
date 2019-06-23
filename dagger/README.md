# Reference

The build.sh has required mvn commands notes as well  
The refrence for this code is from dagger official website https://dagger.dev/  

# First Git Commit to create project
-Create a git repository  
-Follow git instructions as on github  to use git init  
-Create project and .gitignore file  
-Run the command 'git rm --cached' for all files/folders to  be ignored  
-git fetch ( git pull if instructed)  
-git add .   
-git status ( to check status of files raedy to be commited and ones untracked)  
-git push  

# Results For Run time comparision for code between JAVA 8/ GRAAL VM CE/ GRAAL Native Image  

Run Code via Java 8 
The JAVA_HOME points to - JAVA_HOME = /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/  

Contents/Home
Inside the Main!
Inside the CoffeShop
~ ~ ~ heating ~ ~ ~
=> => pumping => =>
 [_]P coffee! [_]P 
Brewing the coffee

real	0m0.158s
user	0m0.131s
sys	0m0.037s  

Run Code via Java graal vm ce
The JAVA_HOME points to - JAVA_HOME = /Library/Java/JavaVirtualMachines/graalvm-ce-19.0.2/Contents/Home
Inside the Main!
Inside the CoffeShop
~ ~ ~ heating ~ ~ ~
=> => pumping => =>
 [_]P coffee! [_]P 
Brewing the coffee

real	0m0.150s
user	0m0.138s
sys	0m0.032s  

Run Code via Java graal native image
The JAVA_HOME points to - JAVA_HOME = /Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home
Inside the Main!
Inside the CoffeShop
~ ~ ~ heating ~ ~ ~
=> => pumping => =>
 [_]P coffee! [_]P 
Brewing the coffee

real	0m0.007s
user	0m0.002s
sys	0m0.003s
