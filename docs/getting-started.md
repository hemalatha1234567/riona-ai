# 🚀 Getting Started with Riona AI Agent

## Prerequisites

Before you begin, ensure you have the following installed:

- **Node.js** >= 20.0.0
- **npm** >= 10.0.0
- **Docker** & **Docker Compose**
- **Git**
- **Ollama** (for AI features)

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/riona-ai-agent.git
cd riona-ai-agent
```

### 2. Setup Ollama

Install Ollama if you haven't already:

```bash
# macOS/Linux
curl -fsSL https://ollama.ai/install.sh | sh

# Windows
# Download from https://ollama.ai/download
```

Pull the Llama 20B model:

```bash
ollama pull llama2:20b
```

Start Ollama server:

```bash
ollama serve
```

### 3. Configure Environment

Copy the example environment file:

```bash
cp .env.example .env
```

Edit `.env` with your configuration:

```env
# Instagram Credentials
IG_USERNAME=your_instagram_username
IG_PASSWORD=your_instagram_password

# Ollama Configuration  
OLLAMA_BASE_URL=http://localhost:11434
OLLAMA_MODEL=llama2:20b

# Database
MONGODB_URI=mongodb://localhost:27017/riona_ai
REDIS_URL=redis://localhost:6379
```

### 4. Start Services

Start MongoDB and Redis using Docker:

```bash
make docker-up
# or
docker-compose up -d mongodb redis
```

### 5. Install Dependencies

Install all project dependencies:

```bash
make install
# or
npm install
cd backend && npm install
cd ../frontend && npm install
cd ../shared && npm install
```

### 6. Start Development Servers

Start all services in development mode:

```bash
make dev
# or
npm run dev
```

This will start:
- Backend API on `http://localhost:3000`
- Frontend on `http://localhost:3001`
- WebSocket server on `ws://localhost:3000`

## First Run

### 1. Access the Dashboard

Open your browser and navigate to:

```
http://localhost:3001
```

### 2. Initial Setup Wizard

On first run, you'll be guided through:

1. **Instagram Connection**
   - Enter your Instagram credentials
   - Configure 2FA if enabled

2. **AI Personality Setup**
   - Choose personality traits
   - Set content style
   - Configure language and tone

3. **Training Data** (Optional)
   - Upload training documents
   - Connect YouTube channel
   - Import existing content

### 3. Create Your First Post

1. Click "Generate Content"
2. Upload an image or select from stock
3. Let AI generate caption and hashtags
4. Review and edit if needed
5. Post immediately or schedule

## Project Structure

```
riona-ai-agent/
├── backend/          # API and business logic
├── frontend/         # React dashboard
├── shared/           # Shared types and utilities
├── infrastructure/   # Docker, K8s configs
└── docs/            # Documentation
```

## Common Commands

### Development

```bash
# Start development
make dev

# Start backend only
make dev-backend

# Start frontend only
make dev-frontend

# Start Ollama
make dev-ollama
```

### Testing

```bash
# Run all tests
make test

# Unit tests
make test-unit

# E2E tests
make test-e2e

# Coverage report
make test-coverage
```

### Building

```bash
# Build all
make build

# Build backend
make build-backend

# Build frontend
make build-frontend
```

### Database

```bash
# MongoDB shell
make mongo-shell

# Redis CLI
make redis-cli
```

## Troubleshooting

### Ollama Connection Issues

If Ollama isn't connecting:

1. Check if Ollama is running:
```bash
curl http://localhost:11434/api/tags
```

2. Verify model is installed:
```bash
ollama list
```

3. Restart Ollama:
```bash
ollama serve
```

### MongoDB Connection Issues

1. Check if MongoDB is running:
```bash
docker ps | grep mongodb
```

2. Restart MongoDB:
```bash
docker-compose restart mongodb
```

3. Check logs:
```bash
docker-compose logs mongodb
```

### Instagram Authentication Issues

1. Verify credentials in `.env`
2. Check if 2FA is enabled
3. Try clearing cookies:
```bash
rm -rf backend/sessions/
```

## Next Steps

- Read the [Architecture Overview](./architecture.md)
- Check the [API Reference](./api-reference.md)
- Follow the [User Guide](./user-guide.md)
- Join our [Discord Community](https://discord.gg/riona-ai)

## Getting Help

If you encounter issues:

1. Check the [FAQ](./faq.md)
2. Search [GitHub Issues](https://github.com/yourusername/riona-ai-agent/issues)
3. Ask in [Discord](https://discord.gg/riona-ai)
4. Create a new issue with:
   - Error messages
   - Steps to reproduce
   - System information
