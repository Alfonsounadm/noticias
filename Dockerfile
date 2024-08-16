# Usar la imagen de Gradle para construir el proyecto
FROM gradle:8.1.1-jdk17-alpine AS build

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar solo los archivos necesarios para aprovechar la cache de Docker
COPY build.gradle settings.gradle ./
COPY src ./src

# Construir el proyecto y empaquetarlo como un archivo JAR
RUN gradle build -x test

# Usar una imagen base de Java para ejecutar la aplicación
FROM eclipse-temurin:17-jdk-alpine

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo JAR del paso de construcción usando un comodín
COPY --from=build /app/build/libs/*.jar app.jar

# Exponer el puerto en el que la aplicación escuchará
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "app.jar"]
