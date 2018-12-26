#!/bin/bash
# 删除所有自带的管理项目
find . ! -name 'rm.sh' -exec rm -f {} \;