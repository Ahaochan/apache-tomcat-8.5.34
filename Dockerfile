FROM tomcat
LABEL maintainer="Ahaochan" version="1.0" description="一个自定义的Tomcat"
ARG war

# 1. 删除 Tomcat 自带管理界面
RUN rm -rf /usr/local/tomcat/webapps/*
# 2. 复制自定义配置
COPY conf /usr/local/tomcat/conf
# 3. 复制一个 war 到 webapps 下.
COPY $war /usr/local/tomcat/webapps/

# 4. 作为服务启动 Tomcat
# Server 端口
EXPOSE 8005
# Http 端口
EXPOSE 8080
# Http 重定向 端口
EXPOSE 8443
# AJP 端口
EXPOSE 8009
ENTRYPOINT startup.sh && tail -fn 300 /usr/local/tomcat/logs/catalina.out
CMD []

