FROM maven:3.8.5-openjdk-17 AS build

WORKDIR /app

COPY pom.xml .

COPY src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk

WORKDIR /app

RUN groupadd --system aguaGroup && useradd --system --gid aguaGroup prismaUser

RUN chown -R prismaUser:aguaGroup /app

USER prismaUser

COPY --from=build /app/target/mais_agua-0.0.1-SNAPSHOT.jar .

ENV JAVA_APP_PROFILE=production

EXPOSE 8080

CMD ["java", "-jar", "mais_agua-0.0.1-SNAPSHOT.jar"]