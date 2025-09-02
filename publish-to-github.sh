#!/bin/bash

# ========================================
# Riona AI - Publish to GitHub Script
# ========================================

echo "🚀 Publishing Riona AI to GitHub"
echo ""
echo "Please follow these steps:"
echo ""
echo "1. Create a new repository on GitHub:"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: riona-ai"
echo "   - Description: AI-Powered Instagram Automation Platform with Local LLM"
echo "   - Make it Public or Private as you prefer"
echo "   - Do NOT initialize with README, .gitignore or license"
echo ""
echo "2. After creating the repository, run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/riona-ai.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Optional: Setup GitHub Actions for CI/CD"
echo ""
echo "Your repository is ready at:"
echo "Current branch: $(git branch --show-current)"
echo "Total commits: $(git rev-list --count HEAD)"
echo "Files tracked: $(git ls-files | wc -l)"
echo ""
echo "Repository size: $(du -sh . | cut -f1)"
