# Compiles the project
mvn compile

# Creates the jar
mvn package

# Creates the jar with all dependencies included
mvn assembly:single

# Puts all required jar on local maven install directry starting with .m2
mvn clean install

# Run the dependencies jar , the normal jar cannot be run as it does not hold all dependencies
time java -jar target/hello-world-1.00-jar-with-dependencies.jar
