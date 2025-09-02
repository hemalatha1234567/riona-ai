#!/bin/bash

# ========================================
# RIONA AI AGENT - Complete Project Setup
# ========================================
# This script creates the entire project structure
# and all necessary configuration files

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   RIONA AI AGENT - PROJECT SETUP    ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════╝${NC}"
echo ""

# ========================================
# CREATE MAIN DIRECTORIES
# ========================================
echo -e "${YELLOW}📁 Creating main directories...${NC}"

directories=(
  "backend"
  "frontend"  
  "shared"
  "infrastructure"
  "docs"
)

for dir in "${directories[@]}"; do
  mkdir -p "$dir"
  echo -e "  ✓ Created $dir/"
done

# ========================================
# BACKEND STRUCTURE
# ========================================
echo -e "\n${YELLOW}🔵 Setting up Backend structure...${NC}"

# Domain Layer
backend_domain=(
  "backend/src/domain/entities/agent"
  "backend/src/domain/entities/content"
  "backend/src/domain/entities/campaign"
  "backend/src/domain/entities/analytics"
  "backend/src/domain/value-objects/ai"
  "backend/src/domain/value-objects/social"
  "backend/src/domain/value-objects/common"
  "backend/src/domain/repositories"
  "backend/src/domain/services"
  "backend/src/domain/events"
)

# Application Layer
backend_application=(
  "backend/src/application/commands/agent"
  "backend/src/application/commands/content"
  "backend/src/application/commands/post"
  "backend/src/application/commands/campaign"
  "backend/src/application/commands/instagram"
  "backend/src/application/queries"
  "backend/src/application/handlers/agent"
  "backend/src/application/handlers/content"
  "backend/src/application/handlers/post"
  "backend/src/application/handlers/campaign"
  "backend/src/application/services"
)

# Infrastructure Layer
backend_infrastructure=(
  "backend/src/infrastructure/ai/ollama"
  "backend/src/infrastructure/ai/templates"
  "backend/src/infrastructure/ai/training"
  "backend/src/infrastructure/social/instagram"
  "backend/src/infrastructure/social/media"
  "backend/src/infrastructure/persistence/mongodb/repositories"
  "backend/src/infrastructure/persistence/mongodb/schemas"
  "backend/src/infrastructure/persistence/redis"
  "backend/src/infrastructure/messaging/websocket"
  "backend/src/infrastructure/messaging/events"
  "backend/src/infrastructure/monitoring"
)

# Presentation Layer
backend_presentation=(
  "backend/src/presentation/http/controllers"
  "backend/src/presentation/http/middleware"
  "backend/src/presentation/http/routes/v3"
  "backend/src/presentation/http/validators"
  "backend/src/presentation/websocket/handlers"
  "backend/src/presentation/websocket/rooms"
  "backend/src/presentation/graphql/resolvers"
)

# Shared & Support
backend_support=(
  "backend/src/shared/kernel"
  "backend/src/shared/utils"
  "backend/src/shared/constants"
  "backend/src/container/modules"
  "backend/src/bootstrap"
  "backend/tests/unit/domain"
  "backend/tests/unit/application"
  "backend/tests/unit/infrastructure"
  "backend/tests/integration/ollama"
  "backend/tests/integration/instagram"
  "backend/tests/integration/database"
  "backend/tests/e2e/flows"
  "backend/tests/e2e/api"
  "backend/tests/fixtures"
  "backend/docs"
)

all_backend_dirs=("${backend_domain[@]}" "${backend_application[@]}" "${backend_infrastructure[@]}" "${backend_presentation[@]}" "${backend_support[@]}")

for dir in "${all_backend_dirs[@]}"; do
  mkdir -p "$dir"
done
echo -e "  ✓ Backend structure created"

# ========================================
# FRONTEND STRUCTURE
# ========================================
echo -e "\n${YELLOW}🟢 Setting up Frontend structure...${NC}"

# Features
frontend_features=(
  "frontend/src/features/dashboard/components"
  "frontend/src/features/dashboard/hooks"
  "frontend/src/features/dashboard/services"
  "frontend/src/features/dashboard/pages"
  "frontend/src/features/agent/components"
  "frontend/src/features/agent/hooks"
  "frontend/src/features/agent/services"
  "frontend/src/features/agent/stores"
  "frontend/src/features/agent/pages"
  "frontend/src/features/content/components"
  "frontend/src/features/content/hooks"
  "frontend/src/features/content/services"
  "frontend/src/features/content/pages"
  "frontend/src/features/posts/components"
  "frontend/src/features/posts/hooks"
  "frontend/src/features/posts/services"
  "frontend/src/features/posts/pages"
  "frontend/src/features/campaigns/components"
  "frontend/src/features/campaigns/hooks"
  "frontend/src/features/campaigns/services"
  "frontend/src/features/campaigns/pages"
  "frontend/src/features/analytics/components"
  "frontend/src/features/analytics/hooks"
  "frontend/src/features/analytics/services"
  "frontend/src/features/analytics/pages"
  "frontend/src/features/settings/components"
  "frontend/src/features/settings/pages"
)

# Shared & Core
frontend_support=(
  "frontend/src/shared/components/Layout"
  "frontend/src/shared/components/UI"
  "frontend/src/shared/components/Forms"
  "frontend/src/shared/hooks"
  "frontend/src/shared/utils"
  "frontend/src/shared/types"
  "frontend/src/core/api"
  "frontend/src/core/auth"
  "frontend/src/core/router"
  "frontend/src/core/config"
  "frontend/tests/unit"
  "frontend/tests/integration"
  "frontend/tests/e2e"
  "frontend/public/assets/images"
  "frontend/public/assets/icons"
)

all_frontend_dirs=("${frontend_features[@]}" "${frontend_support[@]}")

for dir in "${all_frontend_dirs[@]}"; do
  mkdir -p "$dir"
done
echo -e "  ✓ Frontend structure created"

# ========================================
# SHARED & INFRASTRUCTURE
# ========================================
echo -e "\n${YELLOW}📦 Setting up Shared & Infrastructure...${NC}"

shared_dirs=(
  "shared/types"
  "shared/constants"
  "shared/validation"
  "infrastructure/docker"
  "infrastructure/k8s/deployments"
  "infrastructure/k8s/services"
  "infrastructure/k8s/ingress"
  "infrastructure/terraform/aws"
  "infrastructure/scripts"
  "infrastructure/nginx"
)

for dir in "${shared_dirs[@]}"; do
  mkdir -p "$dir"
done
echo -e "  ✓ Shared & Infrastructure created"

echo ""
echo -e "${GREEN}✅ Project structure created successfully!${NC}"