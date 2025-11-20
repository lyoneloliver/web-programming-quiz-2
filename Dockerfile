# --- TAHAP 1: BUILD (Memasak kode Java jadi .war) ---
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app

# Copy semua file project ke dalam Docker
COPY . .

# Perintah maven untuk compile dan package (bikin folder target otomatis)
RUN mvn clean package -DskipTests

# --- TAHAP 2: RUN (Menjalankan Tomcat) ---
FROM tomcat:9.0-jdk17

# Bersihkan aplikasi bawaan
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy hasil build dari Tahap 1 ke folder Tomcat
# Kita ambil file .war yang dihasilkan Maven lalu taruh sebagai ROOT
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]