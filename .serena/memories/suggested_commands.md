# Development Commands Reference

## Project Lifecycle

### Initial Setup

```bash
# Install all dependencies (Python + Node.js)
mise run setup

# Verify environment installation
mise install
mise exec -- python --version
mise exec -- uv --version
```

### Development Workflow

```bash
# Start LiteLLM proxy server (for development)
mise run run

# Alternative: Run with specific config
litellm --config src/config.yaml --port 4000

# Run in background (for testing)
nohup mise run run &
```

## Code Quality Pipeline

### Formatting and Linting

```bash
# Format all code (Python + JS/TS)
mise run format

# Run linting checks
mise run lint

# Manual ruff operations
ruff check .                    # Check for issues
ruff check . --fix             # Auto-fix issues
ruff format .                  # Format code
```

### Type Checking and Testing

```bash
# Run type checking
mypy src/

# Run tests (when available)
pytest

# Spell checking
cspell "**/*.{py,md,yaml,toml}"
```

## API Testing and Debugging

### Basic API Testing

```bash
# Test API functionality
bash ./src/chat.sh

# Manual curl test
curl -X POST http://localhost:4000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "phi4-mini", "messages": [{"role": "user", "content": "Hello"}]}'
```

### Advanced Testing

```bash
# Test different models
curl -X POST http://localhost:4000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d '{"model": "gpt-4o", "messages": [{"role": "user", "content": "Test"}]}'

# Check server health
curl http://localhost:4000/health

# List available models
curl http://localhost:4000/v1/models
```

## Environment Management

### Mise Commands

```bash
# Show current environment
mise current

# Install specific tool versions
mise install python@3.12
mise install node@lts

# Run command in environment
mise exec -- command
```

### Debugging and Logs

```bash
# View server logs
tail -f ~/.local/share/litellm/logs/

# Debug mode startup
LITELLM_LOG=DEBUG mise run run

# Check process status
ps aux | grep litellm
```

## File Operations (Development)

### Project Navigation

```bash
# View project structure
tree -I '__pycache__|.git|node_modules'

# Find Python files
find . -name "*.py" -not -path "./.venv/*"

# Search for patterns
grep -r "pattern" src/
rg "pattern" src/              # Faster alternative
```

### Configuration Management

```bash
# Validate YAML configuration
python -c "import yaml; yaml.safe_load(open('src/config.yaml'))"

# Check pyproject.toml syntax
python -c "import tomllib; tomllib.load(open('pyproject.toml', 'rb'))"
```
