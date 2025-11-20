# 1. Gunakan base image Tomcat
FROM tomcat:9.0-jdk17

# 2. Hapus aplikasi bawaan Tomcat biar bersih
RUN rm -rf /usr/local/tomcat/webapps/*

# 3. COPY file website kamu
# PENTING: Ganti "." dengan "WebContent/" agar yang di-copy hanya isi foldernya,
# bukan seluruh folder project (termasuk src/git dll).
COPY WebContent/ /usr/local/tomcat/webapps/ROOT/

# 4. Expose port 8080 (Ini default Tomcat)
# Jangan ubah ke 8089 kecuali kamu ubah server.xml juga.
# Biarkan 8080 agar Railway mudah mendeteksi.
EXPOSE 8080

# 5. Start Tomcat (Gunakan script Linux!)
CMD ["catalina.sh", "run"]