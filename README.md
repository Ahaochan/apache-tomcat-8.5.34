# 支持的Web组件版本号

| Servlet | JSP | EL | WebSocket | JASPIC | Tomcat Version | Latest Released Version | Java Versions |
|:---:|:---:|:---:|:---:|:---:|:-----:|:------:|:-----------:|
| 3.1 | 2.3 | 3.0 | 1.1 | 1.1 | 8.5.x | 8.5.34 | 7 and later |

# 原版获取
- [Tomcat 8 Download](https://tomcat.apache.org/download-80.cgi)
- [Tomcat 8 Documentation](https://tomcat.apache.org/tomcat-8.5-doc/)

# 安全加固
1. 删除 `webapps` 自带的控制台程序
1. 添加环境变量配置文件 `bin/setenv.sh`
1. 外部项目部署`conf/context.xml`
1. 修改`tomcat/lib/catalina.jar/org/apache/catalina/util/ServerInfo.properties/`中的`Tomcat`版本信息

# 不使用 Nginx 的安全加固
1. 开启`server.xml`的`AJP`的`Connector`. 如果用`Nginx`则需要注释掉.
1. 修改`server.xml`的`shutdown`端口和命令.
1. 在`web.xml`添加`error-page`页面.

# 参考资料
- [Tomcat服务安全加固](https://help.aliyun.com/knowledge_detail/37421.html)

# Licensing
Please see [LICENSE](LICENSE) for more info.
