---
title: Quickstart — GenAI FullStack
description: Installation complète · Docker · Penpot · VS Code · Git
---
# ⚙️ Quickstart — GenAI FullStack

**Durée estimée : 45 min** · Windows 11 · 8 Go RAM minimum

---

## 1. Docker Desktop

<div class="qs-steps">
<div class="qs-step"><div class="qs-step-content">
<strong>Télécharger Docker Desktop</strong>
<p><a href="https://www.docker.com/products/docker-desktop/" target="_blank">docker.com/products/docker-desktop</a> → installeur Windows</p>
</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Installer avec WSL2 backend</strong>
<p>Cocher "Use WSL2 instead of Hyper-V" · Redémarrer si demandé</p>
</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Vérifier</strong>

```bash
docker --version
docker compose version
```

</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Allouer les ressources</strong>
<p>Settings → Resources → Memory : 4 Go minimum · CPU : 2 cœurs (pour Penpot)</p>
</div></div>
</div>

---

## 2. Penpot (self-hosted via Docker)

<div class="qs-steps">
<div class="qs-step"><div class="qs-step-content">
<strong>Cloner la config officielle</strong>

```bash
git clone https://github.com/penpot/penpot.git
cd penpot/docker/images
```

</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Démarrer Penpot</strong>

```bash
docker compose -p penpot -f docker-compose.yaml up -d
```

</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Créer le compte admin</strong>

```bash
docker exec -ti penpot-penpot-backend-1 \
  /app/run.sh manage-teams create-profile \
  --email admin@la-wealth.local \
  --name "L&A Admin" \
  --password "ChangeMe123!"
```

</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Accéder à Penpot</strong>
<p><code>http://localhost:3449</code> · Se connecter avec le compte admin</p>
</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Importer le design system L&A</strong>
<p>Fichier → Importer → <code>design/la-design-system.penpot</code></p>
</div></div>
</div>

---

## 3. VS Code + Extensions

<div class="qs-steps">
<div class="qs-step"><div class="qs-step-content">
<strong>Télécharger VS Code</strong>
<p><a href="https://code.visualstudio.com/" target="_blank">code.visualstudio.com</a> → stable · Windows</p>
</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Installer les extensions</strong>

```bash
code --install-extension ms-python.python
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ms-azuretools.vscode-docker
code --install-extension hashicorp.terraform
code --install-extension ms-vscode.aws-toolkit
code --install-extension pkief.material-icon-theme
code --install-extension usernamehw.errorlens
```

</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Ouvrir le workspace</strong>
<p><code>File → Open Folder → /c/smc/LeA/LaA-docs</code></p>
<p>Le fichier <code>.vscode/settings.json</code> est déjà dans le repo.</p>
</div></div>
</div>

---

## 4. Git + GitHub CLI

<div class="qs-steps">
<div class="qs-step"><div class="qs-step-content">
<strong>Installer Git for Windows</strong>
<p><a href="https://git-scm.com/download/win" target="_blank">git-scm.com/download/win</a> · cocher "Git Bash" + "Git Credential Manager"</p>
</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Installer GitHub CLI</strong>
<p><a href="https://cli.github.com/" target="_blank">cli.github.com</a> → Windows installer</p>
</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Authentifier</strong>

```bash
gh auth login
# GitHub.com → HTTPS → Login with a web browser
```

</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Configurer Git global</strong>

```bash
git config --global user.name "Ton Nom"
git config --global user.email "ton@email.com"
git config --global core.autocrlf input
```

</div></div>
<div class="qs-step"><div class="qs-step-content">
<strong>Cloner le repo</strong>

```bash
cd /c/smc/LeA
gh repo clone TON_GITHUB_USER/LaA-docs
cd LaA-docs
```

</div></div>
</div>

!!! success "Environnement prêt ✅"
    Docker Desktop · Penpot `localhost:3449` · VS Code configuré · GitHub CLI connecté

    Test local : `mkdocs serve` → [http://127.0.0.1:8000](http://127.0.0.1:8000)
