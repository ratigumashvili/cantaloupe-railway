FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt-get update \
  && apt-get install -y wget unzip ca-certificates \
  && rm -rf /var/lib/apt/lists/*

# Download and extract cantaloupe
RUN wget -O /tmp/cantaloupe.zip \
  https://github.com/cantaloupe-project/cantaloupe/releases/download/v5.0.7/cantaloupe-5.0.7.zip \
  && unzip /tmp/cantaloupe.zip -d /tmp/cantaloupe \
  && cp /tmp/cantaloupe/cantaloupe-5.0.7/cantaloupe-5.0.7.jar /app/cantaloupe.jar \
  && rm -rf /tmp/cantaloupe.zip /tmp/cantaloupe

# Add demo image
RUN mkdir -p /data/images && \
    wget -O /data/images/sample.jpg \
    https://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg

COPY cantaloupe.properties /app/cantaloupe.properties

EXPOSE 8182

CMD ["java", "-Dcantaloupe.config=/app/cantaloupe.properties", "-jar", "/app/cantaloupe.jar"]