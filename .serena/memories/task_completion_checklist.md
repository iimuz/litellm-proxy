# Task Completion Checklist

## Required Steps After Code Changes

### 1. Code Quality Checks

```bash
mise run format
mise run lint
```

### 2. Functional Testing

```bash
# Start proxy server (if not running)
mise run run

# Test API functionality
bash ./src/chat.sh
```

## Pre-commit Checklist

- [ ] Code formatted with ruff
- [ ] No linting errors
- [ ] Type checking passes
- [ ] Tests pass
- [ ] Spell checking passes
- [ ] API functionality verified
