#!/bin/sh
# ==================================================================
# https://gist.github.com/terrancesnyder/986029
# ==================================================================

# 一般设置
export JAVA_HOME="/opt/jdk/jdk1.8"
export CATALINA_PID="$CATALINA_BASE/CATALINA_PID" # 保存 PID, 方便 kill
export CATALINA_OPTS="$CATALINA_OPTS -server"     # hotspot server JVM 优化加速

# 内存 相关配置
# 官方推荐 CATALINA_OPTS 来设置内存, http://wiki.apache.org/tomcat/FAQ/Memoryhttp://wiki.apache.org/tomcat/FAQ/Memory
export CATALINA_OPTS="$CATALINA_OPTS -Xms64m"  # 设置 JVM 初始可用内存, 一般为物理内存 1/4
export CATALINA_OPTS="$CATALINA_OPTS -Xmx512m" # 设置 JVM 最大可用内存, 一般为物理内存 1/2
export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxPermSize=256m" # 设置永久代的内存最大值
export CATALINA_OPTS="$CATALINA_OPTS -Xss192k" # 设置线程栈大小

# GC 相关配置
export CATALINA_OPTS="$CATALINA_OPTS -XX:+UseParallelGC"        # 使用 UseParallelGC 垃圾收集器
export CATALINA_OPTS="$CATALINA_OPTS -XX:MaxGCPauseMillis=1500" # 设置垃圾回收的最大停顿时间. 若无法满足设置值, 则会优先缩小新生代大小, 仍无法满足的话则会牺牲吞吐量.
export CATALINA_OPTS="$CATALINA_OPTS -XX:GCTimeRatio=9" # 设置系统的吞吐量. 比如设为99, 则GC时间比为1/1+99=1%, 也就是要求吞吐量为99%. 若无法满足会缩小新生代大小.
export CATALINA_OPTS="$CATALINA_OPTS -XX:+DisableExplicitGC" # 禁用System.gc()

# Check for application specific parameters at startup
if [ -r "$CATALINA_BASE/bin/appenv.sh" ]; then
  . "$CATALINA_BASE/bin/appenv.sh"
fi

# 打印参数
echo "Using CATALINA_OPTS:"
for arg in $CATALINA_OPTS
do
    echo ">> " $arg
done
echo ""
echo "Using JAVA_OPTS:"
for arg in $JAVA_OPTS
do
    echo ">> " $arg
done
echo "_______________________________________________"
echo ""