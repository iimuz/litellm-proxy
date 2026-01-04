FROM python:3.13-slim

# Prevent Python from writing .pyc files and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 非rootユーザーの作成
ARG USERNAME=appuser
ARG USER_UID=1001
ARG USER_GID=$USER_UID
ENV HOME=/home/$USERNAME
RUN set -eu \
  && groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && chown -R $USERNAME:$USERNAME $HOME \
  && chmod -R 755 $HOME

# Install build dependencies
RUN set -eu \
  && apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    git \
  && rm -rf /var/lib/apt/lists/*

USER appuser

# Create app directory
WORKDIR /app

# Copy only pyproject and setup files first to leverage Docker cache
COPY pyproject.toml setup.py ./

# Install package and dependencies
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"
RUN set -eu \
  && pip install --upgrade pip setuptools wheel \
  && pip install --no-cache-dir .

# Copy application files
COPY ./src/config.yaml ./src/config.yaml

# Expose the port the proxy serves on (litellm default HTTP port)
EXPOSE 4000

# Default command to run the litellm proxy using the provided config
CMD ["litellm", "--config", "./src/config.yaml"]
