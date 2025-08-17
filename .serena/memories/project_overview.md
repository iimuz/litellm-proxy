# Project Technical Overview

## Architecture

LiteLLM proxy sample project designed for AI model testing and development through a unified API interface.

## Technical Specifications

### Runtime Requirements

- **Python**: 3.12 (minimum: Python >=3.11)
- **Main dependency**: `litellm[proxy]` - proxy server with extended model support
- **Environment management**: mise (formerly rtx) for consistent development environments
- **Package management**: uv for fast Python package installation

### Development Stack

- **Type checking**: mypy for static type analysis
- **Linting/Formatting**: ruff (replaces flake8, black, isort)
- **Testing framework**: pytest
- **Node.js tools**: cspell (spell checking), dprint, prettier (formatting)

## Project Structure

```
litellm-proxy/
├── src/
│   ├── config.yaml         # LiteLLM model configuration and routing
│   └── chat.sh            # Sample curl test script for API validation
├── pyproject.toml         # Python project metadata and dependencies
├── package.json           # Node.js dev dependencies and scripts
├── mise.toml             # Development environment configuration
├── .mise/tasks/          # Custom mise task definitions
│   ├── setup             # Dependency installation automation
│   ├── run               # LiteLLM proxy server startup
│   ├── format            # Code formatting pipeline
│   └── lint              # Code quality checks
└── README.md             # User-facing documentation
```

## Supported AI Models

### Local Models (Ollama)

- **phi4-mini**: Microsoft's lightweight AI model for development

### GitHub Copilot Models (via GitHub)

- **GPT-4o**: OpenAI's latest optimized model
- **GPT-4.1**: Advanced reasoning capabilities
- **Claude-4-Sonnet**: Anthropic's balanced model
- **Gemini-2.5-Pro**: Google's professional-grade model
- **GPT-5**: Next-generation OpenAI model

## Configuration Management

- **Model routing**: Defined in `src/config.yaml`
- **Proxy settings**: Environment variables and command-line options
- **Development environment**: Automated via mise.toml
- **Code quality**: Configured in pyproject.toml

## API Interface

- **Unified endpoint**: Single API for all configured models
- **Standard format**: OpenAI-compatible request/response structure
- **Model selection**: Via model parameter in API requests
- **Testing**: curl-based validation scripts
