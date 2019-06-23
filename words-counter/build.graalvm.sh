#!/bin/sh

# Graalvm should be pre installed , for the instal procedure follow the script 'TBD'

#Set versions
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8.0_131)
export JAVA_GRAALVM_HOME=$(/usr/libexec/java_home -v1.8.0_212) 

# TODO
# export JAVA_9_HOME=$(/usr/libexec/java_home -v9)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java_graal='export JAVA_HOME=$JAVA_GRAALVM_HOME'
# alias java9='export JAVA_HOME=$JAVA_9_HOME'

# Create the graalvm native image
# --no-fallback ensures graallvm JVM is not used
java_graal
echo "Create the graalvm native image  "
echo The JAVA_HOME points to - JAVA_HOME =  $JAVA_HOME
native-image --no-fallback -jar target/words-counter-1.00-jar-with-dependencies.jar 

# Run Code via Java 8 
java8
echo "Run Code via Java 8  "
echo The JAVA_HOME points to - JAVA_HOME = $JAVA_HOME
time java -jar target/words-counter-1.00-jar-with-dependencies.jar


# Run Code via Java graal vm ce
java_graal
echo "Run Code via Java graal vm ce  " 
echo The JAVA_HOME points to - JAVA_HOME = $JAVA_HOME
time java -jar target/words-counter-1.00-jar-with-dependencies.jar


# Run Code via Java graal native image
java8
echo "Run Code via Java graal native image  "
echo The JAVA_HOME points to - JAVA_HOME = $JAVA_HOME
time ./words-counter-1.00-jar-with-dependencies

# Run Code via Java 9




