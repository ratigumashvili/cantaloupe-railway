FROM eclipse-temurin:17-jre

WORKDIR /app

# Download Cantaloupe at build time
ADD https://github.com/cantaloupe-project/cantaloupe/releases/download/v5.0.7/cantaloupe-5.0.7.jar /app/cantaloupe.jar

COPY cantaloupe.properties /app/cantaloupe.properties

EXPOSE 8182

CMD ["java", "-Dcantaloupe.config=/app/cantaloupe.properties", "-jar", "/app/cantaloupe.jar"]