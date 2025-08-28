# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration repository that provides a complete development environment setup with modern plugins, AI assistance, and shell configuration.

## Architecture

### Configuration Structure
- **Main config**: `init.lua` - Modern Lua-based Neovim configuration
- **Package management**: Uses lazy.nvim for fast, lazy-loaded plugin management
- **Theme system**: Catppuccin Macchiato theme

### Key Plugin Architecture
- **Core navigation**: Neo-tree (file explorer) + Telescope (fuzzy finder)
- **AI Integration**: Avante.nvim configured with Anthropic Claude API
- **Language support**: Treesitter + ALE for syntax highlighting and linting
- **Mini.nvim ecosystem**: Comprehensive suite of mini-plugins for various features
- **Git integration**: Fugitive + Mini.git for version control

### Configuration Approach
- **Lua-first configuration** for better performance and maintainability
- **Lazy loading** with lazy.nvim for faster startup times
- Space as leader key (`<Space>`)
- Consistent 2-space indentation across all file types
- Modern terminal features enabled (true colors, mouse support)
- AI-first development workflow with enhanced Avante.nvim integration

## Installation & Setup

### Initial Setup
```bash
# Clone repository
mkdir -p ~/work
git clone git@github.com:romaintb/vimconfig.git ~/work/vimconfig

# Create symlink for neovim
mkdir -p ~/.config
ln -s ~/work/vimconfig ~/.config/nvim
```

### API Keys Setup
Set the following environment variables for AI features:
```bash
export ANTHROPIC_API_KEY=your_anthropic_api_key
export AVANTE_GEMINI_API_KEY=your_gemini_api_key  # if using Gemini
```

## Common Development Commands

### Plugin Management (Lazy.nvim)
- `:Lazy` - Open lazy.nvim dashboard
- `:Lazy install` - Install missing plugins
- `:Lazy update` - Update plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy sync` - Install missing + update existing + clean unused
- `:Lazy profile` - View plugin loading performance

### File Navigation
- `<Space>tt` - Toggle Neo-tree file explorer
- `<Space>tf` - Reveal current file in Neo-tree
- `<Space>ff` - Telescope find files (fuzzy search)
- `<Space>fg` - Telescope live grep (search in files)

### AI-Assisted Development (Avante.nvim)
- `<Space>ac` - Open Avante chat
- `<Space>ae` - Avante edit selection
- `<Space>ax` - Avante explain code
- `<Space>at` - Avante generate tests
- `<Space>as` - Stop Avante operation

### Window & Tab Management
- `<Space>tc` - New tab
- `<Space>tn` / `<Space>tp` - Navigate tabs
- `Ctrl+h/j/k/l` - Navigate between splits
- `<Space>w` - Save file
- `<Space>q` - Quit
- `<Space>x` - Quit all

### Git Integration
- `<Space>gb` - Git blame current file

## Development Environment

### Language Support
Treesitter configured for: markdown, lua, vim, javascript, typescript, python, rust, json, yaml, html, css

### Code Quality
- ALE configured for JavaScript with ESLint
- Auto-fix on save enabled
- Mini.trailspace removes trailing whitespace
- Mini.diff shows git changes in sign column

## Key Features

### Modern Neovim Experience
- **Lua-native configuration** for better performance and extensibility
- **Lazy loading** with lazy.nvim for sub-50ms startup times
- True color support with modern terminal features
- Intelligent auto-pairs and syntax highlighting
- Mini-statusline with git integration
- Tabby.nvim for enhanced tab management

### Enhanced AI-First Workflow
- **Advanced Avante.nvim integration** with Claude 3.5 Sonnet
- Context-aware code explanation, editing, and test generation
- Image paste support and enhanced markdown rendering
- Multi-provider AI support (Anthropic, Google, Copilot)
- Intelligent conflict resolution and diff management

### Development Tools Integration
- **Lazy-loaded plugins** for optimal performance
- Telescope for fuzzy finding and live grep
- Neo-tree with filesystem, buffer, and git views
- ALE for real-time linting and fixing
- Comprehensive Git integration through multiple plugins
- Enhanced Treesitter integration for better syntax highlighting
