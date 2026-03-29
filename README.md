# SearX + Sandbox

SearXNG 隐私搜索引擎 + AIO Sandbox AI 工作站的 Docker Compose 部署配置。

## 服务

| 服务 | 端口 | 说明 |
|------|------|------|
| caddy | 80/443 (host) | 反向代理 |
| searxng | 10086 | 搜索引擎 |
| redis | 6379 (内部) | 缓存 |
| sandbox | 10087 | AI 工作站 |

## 快速启动

```bash
cd searx-sandbox

# 复制环境变量配置
cp .env.example .env

# 启动所有服务
docker compose up -d

# 查看服务状态
docker compose ps

# 查看日志
docker compose logs -f
```

## 配置

编辑 `.env` 文件自定义配置：

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `SEARXNG_HOSTNAME` | http://localhost | SearXNG 访问地址 |
| `HOST_PORT` | 10087 | Sandbox 端口 |
| `TZ` | Asia/Singapore | 时区 |
| `WORKSPACE` | /home/gem | 工作目录 |
| `PROXY_SERVER` | - | 代理服务器 |
| `JWT_PUBLIC_KEY` | - | JWT 公钥 |

## 访问

- **Sandbox**: http://localhost:10087
- **SearXNG**: http://localhost:10086

## 停止

```bash
docker compose down
```

## 清理数据

```bash
docker compose down -v
```
