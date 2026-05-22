# L&A — Documentation · MkDocs Material

[![Deploy MkDocs](https://github.com/TON_GITHUB_USER/LaA-docs/actions/workflows/deploy.yml/badge.svg)](https://github.com/TON_GITHUB_USER/LaA-docs/actions/workflows/deploy.yml)

Documentation technique et fonctionnelle du projet L&A Wealth Management.

## 🚀 Test local

```bash
# 1. Installer les dépendances
pip install -r requirements.txt

# 2. Lancer le serveur de développement
mkdocs serve

# → http://127.0.0.1:8000
```

## 📦 Structure

```
.
├── docs/
│   ├── index.md                   # Accueil
│   └── prd/
│       ├── personas/              # 5 fiches personas
│       ├── user-stories/          # US MoSCoW
│       ├── quickstarts/           # Guides installation
│       └── conversation/          # Chat UI LUCA × ASTRA
├── .github/
│   └── workflows/
│       └── deploy.yml             # CI → GitHub Pages
├── mkdocs.yml                     # Config MkDocs
└── requirements.txt
```

## 🌐 Déploiement GitHub Pages

Le déploiement est automatique sur chaque push sur `main`.

### Première mise en place

1. **Créer le repo** GitHub (public ou private)
2. **Pousser le code** sur `main`
3. **Activer GitHub Pages** : Settings → Pages → Source = `gh-pages` branch
4. La CI s'occupe du reste ✅

## ✏️ Personnalisation

Remplacer `TON_GITHUB_USER` dans `mkdocs.yml` et `README.md` par ton username GitHub.
