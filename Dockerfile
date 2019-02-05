FROM tomcat
LABEL maintainer="Ahaochan" version="1.0" description="一个自定义的Tomcat"

# 1. 删除 Tomcat 自带管理界面
RUN rm -rf /usr/local/tomcat/webapps/*
# 2. 复制自定义配置
COPY conf /usr/local/tomcat/conf
# 3. 复制一个 war 到 webapps 下.
COPY ROOT.war /usr/local/tomcat/webapps/

# 4. 作为服务启动 Tomcat
EXPOSE 8080
ENTRYPOINT startup.sh && tail -fn 300 /usr/local/tomcat/logs/catalina.out
CMD []
# docker build -t tomcat-my .
# docker run -d -p 80:8080 tomcat-my

