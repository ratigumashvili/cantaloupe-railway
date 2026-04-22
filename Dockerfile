FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt-get update \
  && apt-get install -y wget ca-certificates \
  && rm -rf /var/lib/apt/lists/*

RUN wget -O /app/cantaloupe.jar \
  https://github.com/cantaloupe-project/cantaloupe/releases/download/v5.0.7/cantaloupe-5.0.7.jar

COPY cantaloupe.properties /app/cantaloupe.properties

EXPOSE 8182

CMD ["java", "-Dcantaloupe.config=/app/cantaloupe.properties", "-jar", "/app/cantaloupe.jar"]