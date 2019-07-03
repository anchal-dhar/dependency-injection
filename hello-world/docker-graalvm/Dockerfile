FROM oracle/graalvm-ce:19.0.0
WORKDIR /opt/graalvm
COPY hello-world-1.00-jar-with-dependencies hello-world-1.00-jar-with-dependencies
COPY hello-world-1.00-jar-with-dependencies.jar hello-world-1.00-jar-with-dependencies.jar
RUN echo "Testing"
RUN echo $JAVA_HOME
RUN gu install native-image
RUN native-image -jar hello-world-1.00-jar-with-dependencies.jar
RUN time ./hello-world-1.00-jar-with-dependencies






