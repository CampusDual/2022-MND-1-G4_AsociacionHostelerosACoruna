FROM maven:3.9.1-eclipse-temurin-17-alpine
WORKDIR /app
COPY ./src ./src
COPY pom.xml .
EXPOSE 9999
RUN mvn install
CMD mvn spring-boot:run