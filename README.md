# SearX + Sandbox

[English](#english) | [中文](#中文)

---

## English

Docker Compose deployment for **SearXNG** (privacy-first search engine) + **AIO Sandbox** (AI workstation).

### Services

| Service | Port | Description |
|---------|------|-------------|
| searxng-caddy | 80/443 (host) | Reverse proxy |
| searxng-main | 10086 | SearXNG search engine |
| searxng-redis | 6379 (internal) | Cache |
| sandbox | 10087, 9222 | AI workstation + CDP browser |

### OpenCLI Integration

**opencli** can control the sandbox's browser via Chrome DevTools Protocol (CDP).

**Prerequisites:**
```bash
# Install opencli
npm install -g @jackwener/opencli

# Or use bun
bun install -g @jackwener/opencli
```

**Usage:**
```bash
# Option 1: Using the helper script
cd searx-sandbox
source .env  # Load CDP_PORT
./opencli-cdp.sh antigravity status

# Option 2: Manual
export OPENCLI_CDP_ENDPOINT="ws://localhost:9222"
opencli antigravity status
opencli antigravity send "Take a screenshot"
```

**Available Sites:** opencli supports 50+ sites including Bilibili, Zhihu, Xiaohongshu, Reddit, HackerNews, GitHub, and more via site-specific commands.

See [opencli documentation](https://github.com/jackwener/opencli) for full command reference.

### Why This Matters for AI Agents

This stack provides two critical capabilities for AI agents:

**SearXNG** — Privacy-respecting web search that AI agents can use to:
- Gather real-time information from the web
- Research topics without relying on centralized APIs
- Maintain user privacy during research tasks
- Avoid search engine tracking and bias

**AIO Sandbox** — A secure execution environment that AI agents can use to:
- Run code, scripts, and terminal commands safely
- Browse the web in an isolated browser instance
- Execute multi-step workflows with file system access
- Perform tasks that require a full operating system environment

Together, they give AI agents the ability to **search** and **act** — bridging the gap between reasoning and real-world execution.

### Quick Start

```bash
cd searx-sandbox

# Copy environment config
cp .env.example .env

# Start all services
docker compose up -d

# Check status
docker compose ps

# View logs
docker compose logs -f
```

### Configuration

Edit `.env` file:

| Variable | Default | Description |
|----------|---------|-------------|
| `SEARXNG_HOSTNAME` | http://localhost | SearXNG access URL |
| `HOST_PORT` | 10087 | Sandbox port |
| `CDP_PORT` | 9222 | Browser CDP debugging port |
| `TZ` | Asia/Singapore | Timezone |
| `WORKSPACE` | /home/gem | Working directory |
| `PROXY_SERVER` | - | Proxy server |
| `JWT_PUBLIC_KEY` | - | JWT public key |

### Access

- **Sandbox**: http://localhost:10087
- **SearXNG**: http://localhost:10086
- **Browser CDP**: ws://localhost:9222

### Stop

```bash
docker compose down
```

### Clean up data

```bash
docker compose down -v
```

---

## 中文

**SearXNG** 隐私搜索引擎 + **AIO Sandbox** AI 工作站的 Docker Compose 部署配置。

### 服务

| 服务 | 端口 | 说明 |
|------|------|------|
| searxng-caddy | 80/443 (host) | 反向代理 |
| searxng-main | 10086 | SearXNG 搜索引擎 |
| searxng-redis | 6379 (内部) | 缓存 |
| sandbox | 10087, 9222 | AI 工作站 + CDP 浏览器 |

### OpenCLI 集成

**opencli** 可以通过 Chrome DevTools Protocol (CDP) 控制 sandbox 的浏览器。

**前置条件：**
```bash
# 安装 opencli
npm install -g @jackwener/opencli

# 或使用 bun
bun install -g @jackwener/opencli
```

**使用方法：**
```bash
# 方式一：使用辅助脚本
cd searx-sandbox
source .env  # 加载 CDP_PORT
./opencli-cdp.sh antigravity status

# 方式二：手动设置
export OPENCLI_CDP_ENDPOINT="ws://localhost:9222"
opencli antigravity status
opencli antigravity send "截图"
```

**支持的站点：** opencli 支持 50+ 网站，包括 B站、知乎、小红书、Reddit、HackerNews、GitHub 等。

详细命令参考 [opencli 文档](https://github.com/jackwener/opencli)。

### 为什么这对 AI Agent 很重要

这个技术栈为 AI Agent 提供了两个关键能力：

**SearXNG** — 隐私友好的网页搜索，AI Agent 可以用来：
- 从互联网获取实时信息
- 不依赖集中式 API 进行研究
- 在研究任务中保护用户隐私
- 避免搜索引擎的追踪和偏见

**AIO Sandbox** — 安全的执行环境，AI Agent 可以用来：
- 安全地运行代码、脚本和终端命令
- 在隔离的浏览器实例中浏览网页
- 执行需要完整操作系统环境的复杂工作流
- 通过文件系统访问执行多步骤任务

两者结合，让 AI Agent 具备**搜索**和**执行**的能力——弥合了推理与现实世界操作之间的鸿沟。

### 快速启动

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

### 配置

编辑 `.env` 文件：

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `SEARXNG_HOSTNAME` | http://localhost | SearXNG 访问地址 |
| `HOST_PORT` | 10087 | Sandbox 端口 |
| `CDP_PORT` | 9222 | 浏览器 CDP 调试端口 |
| `TZ` | Asia/Singapore | 时区 |
| `WORKSPACE` | /home/gem | 工作目录 |
| `PROXY_SERVER` | - | 代理服务器 |
| `JWT_PUBLIC_KEY` | - | JWT 公钥 |

### 访问

- **Sandbox**: http://localhost:10087
- **SearXNG**: http://localhost:10086
- **浏览器 CDP**: ws://localhost:9222

### 停止

```bash
docker compose down
```

### 清理数据

```bash
docker compose down -v
```
