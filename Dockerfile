# 使用官方 OpenJDK 基础镜像 (根据你的 JDK 版本调整，如 openjdk:17-jdk-alpine)
FROM amazoncorretto:17-alpine-jdk

#FROM openjdk:17
# 设置应用程序的网络端口配置
ENV PORT=9003



# 配置邮件服务器连接参数（SMTP服务器地址、端口及认证信息）
#ENV EMAIL_HOST mail.qq.com
#ENV EMAIL_PORT 465
#ENV EMAIL_USERNAME 123456789@qq.com
#ENV EMAIL_PASSWORD 123456789
#ARG VERSION=2.5.2
#ENV VERSION=${VERSION}

# 设置工作目录
WORKDIR /app

# 将构建好的 jar 包复制到镜像中
# 假设你的 jar 包生成在 target 目录下，且名为 app.jar
COPY blog/target/*.jar app.jar

# 暴露后端端口 (与 applicaxstion.properties 中的 server.port 一致)
EXPOSE 9003

# 启动命令
ENTRYPOINT ["java", "-jar", "-Xms1024m", "-Xmx2048m", "app.jar"]
