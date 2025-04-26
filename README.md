# AI Workstation Setup

This project sets up an agentic AI workstation on Windows 11 (HP Victus) with n8n workflow automation.

## System Requirements
- Windows 11
- HP Victus hardware
- Python 3.11+
- Node.js 18+
- npm 9+
- Git
- VS Code or preferred IDE

## Setup Components

1. **Development Environment**
   - Python virtual environment
   - Git configuration
   - VS Code extensions
   - Development tools

2. **AI Tools and Frameworks**
   - Local LLM setup (Ollama)
   - Python AI libraries
   - Development frameworks

3. **n8n Workflow Automation**
   - Local n8n instance
   - SQLite database
   - Basic security configuration

4. **Workspace Configuration**
   - Project structure
   - Environment variables
   - Development workflows

## Getting Started

1. Install prerequisites:
   - Python 3.11 or later
   - Node.js 18 or later
   - Git
   - VS Code

2. Run setup scripts:
   ```bash
   # Setup Python environment
   setup.bat

   # Setup n8n
   setup_n8n.bat
   ```

3. Start n8n:
   ```bash
   n8n\start_n8n.bat
   ```
   Access n8n at: http://localhost:5678

## Next Steps

1. Configure n8n security settings
2. Set up initial workflows
3. Integrate with AI tools

## Security Notes

- Change the default JWT secret in n8n/config.json
- Use environment variables for sensitive data
- Regularly backup n8n.db 