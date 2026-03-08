# Clawback Docker 支持

## 构建 Docker 镜像

```bash
# 克隆仓库
git clone https://github.com/lfslang/clawback.git
cd clawback

# 构建镜像
docker build -t clawback:latest .
```

## 使用 Docker 运行

```bash
# 运行容器
docker run -it --rm \
  -v ~/.openclaw:/root/.openclaw \
  -v ~/.local/share/clawback:/root/.local/share/clawback \
  clawback:latest
```

## 从 Docker Hub 拉取（如果已发布）

```bash
# 拉取镜像
docker pull lfslang/clawback:latest

# 运行
docker run -it --rm \
  -v ~/.openclaw:/root/.openclaw \
  lfslang/clawback:latest
```

## Dockerfile 示例

```dockerfile
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    bash \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 下载并安装 clawback
RUN curl -L https://github.com/lfslang/clawback/releases/latest/download/clawback-0.9.181.tar.gz | tar xz --strip-components=1 \
    && ./install.sh

ENV PATH="/root/.local/bin:${PATH}"

CMD ["clawback"]
```

保存为 `Dockerfile` 后构建：
```bash
docker build -t clawback:latest .
```
