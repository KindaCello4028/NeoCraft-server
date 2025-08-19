#!/bin/bash

#启动变量说明，修改前务必查看
#https://www.yuque.com/simpfun/sfe/startup

openjdk8="/usr/bin/jdk/jdk1.8.0_361/bin/java"
openjdk11="/usr/bin/jdk/jdk-11.0.18/bin/java"
openjdk17="/usr/bin/jdk/jdk-17.0.6/bin/java"
openjdk19="/usr/bin/jdk/jdk-19.0.2/bin/java"
openjdk21="/usr/bin/jdk/jdk-21.0.2/bin/java"

maxmem=$((SERVER_MEMORY - 1000))


${openjdk21} -Xms1024M -Xmx${maxmem}M -Dfile.encoding=utf-8 -Duser.language=zh -Duser.country=CN -jar server-release.jar nogui