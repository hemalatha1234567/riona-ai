# Riona AI Agent - Makefile
# Automation commands for development and deployment

.PHONY: help setup dev build test clean docker

# Colors for output
RED=\033[0;31m
GREEN=\033[0;32m
YELLOW=\033[1;33m
NC=\033[0m # No Color

# Default target
help:
	@echo "$(GREEN)Riona AI Agent - Available Commands:$(NC)"
	@echo ""
	@echo "$(YELLOW)Setup & Installation:$(NC)"
	@echo "  make setup          - Complete project setup"
	@echo "  make install        - Install all dependencies"
	@echo "  make setup-ollama   - Install and configure Ollama"
	@echo ""
	@echo "$(YELLOW)Development:$(NC)"
	@echo "  make dev            - Start all services in dev mode"
	@echo "  make dev-backend    - Start backend only"
	@echo "  make dev-frontend   - Start frontend only"
	@echo "  make dev-ollama     - Start Ollama server"
	@echo ""
	@echo "$(YELLOW)Build & Production:$(NC)"
	@echo "  make build          - Build all services"
	@echo "  make build-backend  - Build backend"
	@echo "  make build-frontend - Build frontend"
	@echo "  make docker-build   - Build Docker images"
	@echo ""
	@echo "$(YELLOW)Testing:$(NC)"
	@echo "  make test           - Run all tests"
	@echo "  make test-unit      - Run unit tests"
	@echo "  make test-e2e       - Run E2E tests"
	@echo "  make test-coverage  - Generate test coverage"
	@echo ""
	@echo "$(YELLOW)Docker & Services:$(NC)"
	@echo "  make docker-up      - Start Docker services"
	@echo "  make docker-down    - Stop Docker services"
	@echo "  make docker-logs    - View Docker logs"
	@echo "  make mongo-shell    - Open MongoDB shell"
	@echo "  make redis-cli      - Open Redis CLI"
	@echo ""
	@echo "$(YELLOW)Maintenance:$(NC)"
	@echo "  make clean          - Clean all build artifacts"
	@echo "  make reset          - Reset entire project"
	@echo "  make lint           - Run linters"
	@echo "  make format         - Format code"

# Complete setup
setup:
	@echo "$(GREEN)🚀 Setting up Riona AI Agent...$(NC)"
	@./scripts/setup.sh
	@make install
	@make setup-ollama
	@make docker-up
	@echo "$(GREEN)✅ Setup complete! Run 'make dev' to start.$(NC)"

# Install dependencies
install:
	@echo "$(YELLOW)📦 Installing dependencies...$(NC)"
	@npm install
	@cd backend && npm install
	@cd frontend && npm install
	@cd shared && npm install

# Setup Ollama
setup-ollama:
	@echo "$(YELLOW)🤖 Setting up Ollama...$(NC)"
	@which ollama > /dev/null || (echo "Installing Ollama..." && curl -fsSL https://ollama.ai/install.sh | sh)
	@ollama pull llama2:20b
	@echo "$(GREEN)✅ Ollama ready with Llama 20B model$(NC)"

# Development
dev:
	@echo "$(GREEN)🔧 Starting development servers...$(NC)"
	@npx concurrently \
		"make dev-backend" \
		"make dev-frontend" \
		"make dev-ollama" \
		--names "BACKEND,FRONTEND,OLLAMA" \
		--prefix-colors "bgBlue,bgGreen,bgYellow"

dev-backend:
	@cd backend && npm run dev

dev-frontend:
	@cd frontend && npm run dev

dev-ollama:
	@ollama serve

# Build
build:
	@echo "$(YELLOW)🏗️ Building production...$(NC)"
	@make build-backend
	@make build-frontend
	@echo "$(GREEN)✅ Build complete$(NC)"

build-backend:
	@cd backend && npm run build

build-frontend:
	@cd frontend && npm run build

# Docker
docker-build:
	@echo "$(YELLOW)🐳 Building Docker images...$(NC)"
	@docker-compose build

docker-up:
	@echo "$(YELLOW)🐳 Starting Docker services...$(NC)"
	@docker-compose up -d mongodb redis

docker-down:
	@docker-compose down

docker-logs:
	@docker-compose logs -f

# Database access
mongo-shell:
	@docker exec -it riona-mongodb mongosh

redis-cli:
	@docker exec -it riona-redis redis-cli

# Testing
test:
	@echo "$(YELLOW)🧪 Running tests...$(NC)"
	@make test-unit
	@make test-integration
	@make test-e2e

test-unit:
	@cd backend && npm run test:unit
	@cd frontend && npm run test:unit

test-integration:
	@cd backend && npm run test:integration

test-e2e:
	@cd backend && npm run test:e2e
	@cd frontend && npm run test:e2e

test-coverage:
	@cd backend && npm run test:coverage
	@cd frontend && npm run test:coverage

# Code quality
lint:
	@echo "$(YELLOW)🔍 Running linters...$(NC)"
	@cd backend && npm run lint
	@cd frontend && npm run lint

format:
	@echo "$(YELLOW)✨ Formatting code...$(NC)"
	@cd backend && npm run format
	@cd frontend && npm run format

# Cleaning
clean:
	@echo "$(RED)🧹 Cleaning build artifacts...$(NC)"
	@rm -rf backend/dist backend/build
	@rm -rf frontend/dist frontend/build
	@rm -rf shared/dist shared/build
	@rm -rf coverage
	@echo "$(GREEN)✅ Clean complete$(NC)"

reset:
	@echo "$(RED)⚠️  Resetting entire project...$(NC)"
	@make clean
	@rm -rf node_modules
	@rm -rf backend/node_modules
	@rm -rf frontend/node_modules
	@rm -rf shared/node_modules
	@docker-compose down -v
	@echo "$(GREEN)✅ Reset complete. Run 'make setup' to start fresh.$(NC)"

# Quick commands
start: dev
stop: docker-down
restart: docker-down dev
logs: docker-logs
