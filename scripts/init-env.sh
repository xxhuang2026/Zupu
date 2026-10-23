#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
if [ -e .env ]; then
  echo ".env 已存在，未覆盖。"
  exit 1
fi
cat > .env <<'EOF'
# 留空时自动使用浏览器当前访问地址；填写时不能有结尾斜线。
APP_ORIGIN=
FORCE_HTTPS=false
APP_PORT=39210
APP_BIND_IP=0.0.0.0

INITIAL_ADMIN_USERNAME=admin
INITIAL_ADMIN_PASSWORD=admin
INITIAL_ADMIN_NAME=管理员

ZUPU_IMAGE=zupu:1.0-local
ZUPU_DATA_DIR=./data
ZUPU_BACKUP_DIR=./backups
ZUPU_MANAGED_BACKUP_DIR=./managed-backups
EOF
chmod 600 .env
mkdir -p data/uploads data/family-documents backups managed-backups
echo "已生成 .env、data、backups 和 managed-backups。"
echo "直接执行 docker compose up -d --build 即可启动一个容器。"
