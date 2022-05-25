FROM openjdk:11-jre-slim-buster
ARG JAR_FILE=./build/libs/airbnb-0.0.1.jar
COPY ${JAR_FILE} app.jar
# 배포 환경 데이터베이스 구성 시 spring.profiles.active=prod 로 변경 예정
ENTRYPOINT ["java","-Dspring.profiles.active=test", "-jar","/app.jar"]
