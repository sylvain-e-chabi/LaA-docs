#!/usr/bin/env bash
# ══════════════════════════════════════════════════════════════════════
# L&A — Landing page startup · MkDocs Material overrides
# Usage : cd /c/smc/LeA/LaA-docs && bash setup-la-landing.sh
# ══════════════════════════════════════════════════════════════════════
set -euo pipefail

echo ""
echo "══════════════════════════════════════════════"
echo "  L&A — Landing page · Light clean startup"
echo "══════════════════════════════════════════════"
echo ""

mkdir -p overrides/partials
mkdir -p docs/assets/css
mkdir -p docs/assets/fonts

# ══════════════════════════════════════════════
# 1. mkdocs.yml — reconfiguration complète
# ══════════════════════════════════════════════
cat > mkdocs.yml << 'EOF'
site_name: L&A — Wealth Management
site_description: Conseiller patrimonial piloté par l'IA — LUCA & ASTRA
site_author: sylvain-e-chabi
site_url: https://sylvain-e-chabi.github.io/LaA-docs/

repo_name: sylvain-e-chabi/LaA-docs
repo_url: https://github.com/sylvain-e-chabi/LaA-docs
edit_uri: ""

theme:
  name: material
  language: fr
  custom_dir: overrides
  logo: assets/images/logo.svg
  favicon: assets/images/logo.svg
  palette:
    scheme: default
    primary: custom
    accent: custom
  features:
    - navigation.instant
    - navigation.sections
    - navigation.expand
    - navigation.top
    - navigation.footer
    - search.highlight
    - search.suggest
    - content.code.copy
    - content.code.annotate
    - toc.follow
  font:
    text: Inter
    code: JetBrains Mono

extra_css:
  - assets/css/landing.css
  - assets/css/prd.css

extra:
  social:
    - icon: fontawesome/brands/github
      link: https://github.com/sylvain-e-chabi/LaA-docs

plugins:
  - search:
      lang: fr
  - minify:
      minify_html: true

markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format
  - pymdownx.tabbed:
      alternate_style: true
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
  - attr_list
  - md_in_html
  - tables
  - toc:
      permalink: true

nav:
  - Accueil: index.md
  - Produit:
    - Vue d'ensemble: product/overview.md
    - Fonctionnalités: product/features.md
    - Agent LUCA: product/luca.md
    - Agent ASTRA: product/astra.md
    - Roadmap: product/roadmap.md
  - Conception:
    - Personas: prd/personas/index.md
    - User Stories: prd/user-stories/index.md
    - Architecture: prd/architecture.md
    - Conversation L&A: prd/conversation/index.md
  - Dev:
    - Quickstart FullStack: prd/quickstarts/fullstack.md
    - Quickstart Client: prd/quickstarts/client.md
    - Threat model: prd/personas/hack.md
EOF

echo "✅ mkdocs.yml"

# ══════════════════════════════════════════════
# 2. overrides/main.html — layout global avec sidebar custom
# ══════════════════════════════════════════════
cat > overrides/main.html << 'EOF'
{% extends "base.html" %}

{% block styles %}
  {{ super() }}
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
{% endblock %}
EOF

# ══════════════════════════════════════════════
# 3. overrides/home.html — page d'accueil full custom
# ══════════════════════════════════════════════
cat > overrides/home.html << 'EOF'
{% extends "base.html" %}

{% block styles %}
  {{ super() }}
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
{% endblock %}

{% block tabs %}{% endblock %}
{% block header %}{% endblock %}

{% block content %}
<div class="la-shell">

  <!-- ── SIDEBAR ── -->
  <aside class="la-sidebar">
    <div class="la-sidebar-logo">
      <div class="la-logo-mark">
        <svg width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect width="32" height="32" rx="9" fill="#111"/>
          <text x="16" y="22" font-family="Georgia,serif" font-size="13" font-weight="700" text-anchor="middle" fill="url(#lg)">L&amp;A</text>
          <defs>
            <linearGradient id="lg" x1="0" y1="0" x2="32" y2="32" gradientUnits="userSpaceOnUse">
              <stop offset="0%" stop-color="#22d3ee"/>
              <stop offset="100%" stop-color="#a78bfa"/>
            </linearGradient>
          </defs>
        </svg>
        <div class="la-logo-text">
          <span class="la-logo-name">L&A</span>
          <span class="la-logo-sub">Wealth Management</span>
        </div>
      </div>
    </div>

    <nav class="la-nav">
      <div class="la-nav-section">Produit</div>
      <a href="#overview" class="la-nav-item active">
        <span class="la-nav-dot"></span>Vue d'ensemble
      </a>
      <a href="#features" class="la-nav-item">
        <span class="la-nav-dot"></span>Fonctionnalités
      </a>
      <a href="#agents" class="la-nav-item luca">
        <span class="la-nav-dot luca"></span>Agent LUCA
      </a>
      <a href="#agents" class="la-nav-item astra">
        <span class="la-nav-dot astra"></span>Agent ASTRA
      </a>
      <a href="#roadmap" class="la-nav-item">
        <span class="la-nav-dot"></span>Roadmap
      </a>

      <div class="la-nav-section">Conception</div>
      <a href="prd/personas/" class="la-nav-item">
        <span class="la-nav-dot"></span>Personas
      </a>
      <a href="prd/user-stories/" class="la-nav-item">
        <span class="la-nav-dot"></span>User Stories
      </a>
      <a href="prd/architecture/" class="la-nav-item">
        <span class="la-nav-dot"></span>Architecture
      </a>
      <a href="prd/conversation/" class="la-nav-item">
        <span class="la-nav-dot"></span>Conversation L&A
      </a>

      <div class="la-nav-section">Dev</div>
      <a href="prd/quickstarts/fullstack/" class="la-nav-item">
        <span class="la-nav-dot"></span>Quickstart
      </a>
      <a href="prd/personas/hack/" class="la-nav-item">
        <span class="la-nav-dot"></span>Threat model
      </a>
    </nav>

    <div class="la-sidebar-footer">
      <a href="https://github.com/sylvain-e-chabi/LaA-docs" target="_blank" class="la-gh-badge">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0 0 24 12c0-6.63-5.37-12-12-12z"/></svg>
        sylvain-e-chabi
      </a>
    </div>
  </aside>

  <!-- ── MAIN CONTENT ── -->
  <main class="la-main">

    <!-- HERO -->
    <section class="la-hero" id="overview">
      <div class="la-hero-inner">
        <div class="la-badge">✦ Projet en cours · Mai 2026</div>
        <h1 class="la-hero-title">
          Votre conseiller patrimonial.<br>
          <span class="la-hero-accent">Piloté par l'IA.</span>
        </h1>
        <p class="la-hero-sub">
          L&A orchestre deux agents IA — LUCA et ASTRA — pour piloter votre portefeuille,
          optimiser votre fiscalité et vous guider vers vos objectifs patrimoniaux.
          Par la voix ou par texte, en français.
        </p>
        <div class="la-hero-ctas">
          <a href="prd/conversation/" class="la-btn-primary">Voir la démo →</a>
          <a href="prd/" class="la-btn-secondary">Lire le PRD</a>
        </div>
        <div class="la-hero-stats">
          <div class="la-stat">
            <span class="la-stat-n">2</span>
            <span class="la-stat-l">Agents IA</span>
          </div>
          <div class="la-stat-sep"></div>
          <div class="la-stat">
            <span class="la-stat-n">5 000 €</span>
            <span class="la-stat-l">Objectif net déc. 2027</span>
          </div>
          <div class="la-stat-sep"></div>
          <div class="la-stat">
            <span class="la-stat-n">3</span>
            <span class="la-stat-l">Véhicules fiscaux</span>
          </div>
          <div class="la-stat-sep"></div>
          <div class="la-stat">
            <span class="la-stat-n">100 %</span>
            <span class="la-stat-l">Vocal + texte</span>
          </div>
        </div>
      </div>
    </section>

    <!-- AGENTS -->
    <section class="la-section" id="agents">
      <div class="la-section-label">Les deux agents</div>
      <h2 class="la-section-title">Deux intelligences, une seule voix</h2>
      <p class="la-section-sub">LUCA ancre chaque réponse dans la réalité des données. ASTRA projette, recommande et stratégie.</p>
      <div class="la-agents-grid">
        <div class="la-agent-card luca">
          <div class="la-agent-header">
            <div class="la-agent-avatar luca">L</div>
            <div>
              <div class="la-agent-pill luca">LUCA · Data & Passé</div>
              <h3 class="la-agent-name">Votre mémoire financière</h3>
            </div>
          </div>
          <p class="la-agent-desc">
            P&L temps réel, dividendes reçus, PRU par ligne, TWR.
            LUCA répond exclusivement sur des faits issus de données vérifiées.
            Jamais d'opinion, jamais de projection.
          </p>
          <div class="la-agent-tags">
            <span class="la-tag luca">Valorisation</span>
            <span class="la-tag luca">P&L absolu</span>
            <span class="la-tag luca">Dividendes</span>
            <span class="la-tag luca">PRU</span>
          </div>
        </div>
        <div class="la-agent-card astra">
          <div class="la-agent-header">
            <div class="la-agent-avatar astra">A</div>
            <div>
              <div class="la-agent-pill astra">ASTRA · Stratégie & Futur</div>
              <h3 class="la-agent-name">Votre stratège patrimonial</h3>
            </div>
          </div>
          <p class="la-agent-desc">
            Recommandations d'achat priorisées, projections triade C/R/O,
            calcul PFU sur plus-values uniquement, ordre mensuel structuré.
          </p>
          <div class="la-agent-tags">
            <span class="la-tag astra">Recommandations</span>
            <span class="la-tag astra">Projections</span>
            <span class="la-tag astra">Fiscal PFU</span>
            <span class="la-tag astra">Allocation</span>
          </div>
        </div>
      </div>
    </section>

    <!-- FEATURES -->
    <section class="la-section la-section-alt" id="features">
      <div class="la-section-label">Fonctionnalités</div>
      <h2 class="la-section-title">Tout ce dont un investisseur retail a besoin</h2>
      <div class="la-features-grid">
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#f0fdfc; color:#0F6E56">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 2a3 3 0 0 0-3 3v4a3 3 0 0 0 6 0V5a3 3 0 0 0-3-3z"/><path d="M19 10a7 7 0 0 1-14 0"/><line x1="12" y1="19" x2="12" y2="22"/></svg>
          </div>
          <h3>Interface vocale</h3>
          <p>Posez vos questions à la voix en français, mains libres. Réponses via Amazon Polly — Léa neural.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#f5f0fe; color:#534AB7">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
          </div>
          <h3>PWA mobile-first</h3>
          <p>Installable sur Android comme une app native. Consultation hors-ligne du dernier état connu.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#faf0fe; color:#7c3aed">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg>
          </div>
          <h3>Multi-comptes consolidés</h3>
          <p>CTO Revolut, PEA Saxo Banque, AV Linxea Spirit 2 — vision unifiée en temps réel.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#eaf3de; color:#3B6D11">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
          </div>
          <h3>Moteur fiscal PFU</h3>
          <p>PFU 30% calculé sur plus-values uniquement. Décomposition 4 lignes systématique. Jamais sur la valeur brute.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#fef9e7; color:#854F0B">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M18 20V10"/><path d="M12 20V4"/><path d="M6 20v-6"/></svg>
          </div>
          <h3>Projections triade C/R/O</h3>
          <p>Conservative, réaliste, optimiste — à 3 ans, systématiquement. Toujours avec l'horizon explicite.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#fff0f0; color:#A32D2D">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/></svg>
          </div>
          <h3>Alertes dividendes</h3>
          <p>Ex-dates, montants versés, streaks aristocrats. Ne ratez plus aucun détachement de coupon.</p>
        </div>
      </div>
    </section>

    <!-- COMMENT C'A ÉTÉ PENSÉ -->
    <section class="la-section" id="approach">
      <div class="la-section-label">La démarche</div>
      <h2 class="la-section-title">Pensé par un investisseur, pour des investisseurs</h2>
      <div class="la-approach-grid">
        <div class="la-approach-card">
          <div class="la-approach-num">01</div>
          <h3>Partir des vraies douleurs</h3>
          <p>Calcul PFU erroné, consolidation manuelle 2–3h/semaine, pas de vision P&L multi-comptes. L&A est né de ces frustrations concrètes.</p>
        </div>
        <div class="la-approach-card">
          <div class="la-approach-num">02</div>
          <h3>Deux agents, deux périmètres stricts</h3>
          <p>LUCA ne recommande jamais. ASTRA ne cite jamais de données sans source. La séparation des responsabilités est architecturale, pas optionnelle.</p>
        </div>
        <div class="la-approach-card">
          <div class="la-approach-num">03</div>
          <h3>Mobile vocal avant tout</h3>
          <p>L'investisseur retail consulte dans les transports, le soir, en quelques minutes. L'interface vocale n'est pas une option — c'est le mode principal.</p>
        </div>
        <div class="la-approach-card">
          <div class="la-approach-num">04</div>
          <h3>Fiscalité française au cœur</h3>
          <p>PFU, PEA, Assurance-Vie, PRU — le moteur fiscal est documenté, auditable et systématique. Pas de boîte noire.</p>
        </div>
      </div>
    </section>

    <!-- ROADMAP -->
    <section class="la-section la-section-alt" id="roadmap">
      <div class="la-section-label">Roadmap</div>
      <h2 class="la-section-title">De la documentation à la production</h2>
      <div class="la-roadmap">
        <div class="la-rm-item done">
          <div class="la-rm-dot done"></div>
          <div class="la-rm-line"></div>
          <div class="la-rm-content">
            <div class="la-rm-date">Mai 2026</div>
            <div class="la-rm-title">PRD & documentation</div>
            <div class="la-rm-desc">MkDocs Material · GitHub Pages · 5 personas · Threat model</div>
            <span class="la-rm-badge done">Livré ✓</span>
          </div>
        </div>
        <div class="la-rm-item current">
          <div class="la-rm-dot current"></div>
          <div class="la-rm-line"></div>
          <div class="la-rm-content">
            <div class="la-rm-date">Juil. 2026</div>
            <div class="la-rm-title">MCP Server Saxo Bank</div>
            <div class="la-rm-desc">Connecteur broker · données temps réel · POC Bedrock</div>
            <span class="la-rm-badge current">En cours</span>
          </div>
        </div>
        <div class="la-rm-item">
          <div class="la-rm-dot"></div>
          <div class="la-rm-line"></div>
          <div class="la-rm-content">
            <div class="la-rm-date">Jan. 2027</div>
            <div class="la-rm-title">Agents LUCA & ASTRA (v1)</div>
            <div class="la-rm-desc">Bedrock · voix Polly · FiscalEngine Lambda</div>
            <span class="la-rm-badge">Planifié</span>
          </div>
        </div>
        <div class="la-rm-item">
          <div class="la-rm-dot"></div>
          <div class="la-rm-line"></div>
          <div class="la-rm-content">
            <div class="la-rm-date">Juin 2027</div>
            <div class="la-rm-title">PWA Android · beta</div>
            <div class="la-rm-desc">Interface mobile · vocal · multi-comptes consolidés</div>
            <span class="la-rm-badge">Planifié</span>
          </div>
        </div>
        <div class="la-rm-item">
          <div class="la-rm-dot"></div>
          <div class="la-rm-line last"></div>
          <div class="la-rm-content">
            <div class="la-rm-date">Déc. 2027</div>
            <div class="la-rm-title">Objectif 5 000 € net</div>
            <div class="la-rm-desc">Milestone patrimonial · distribution dividendes ~36 € net/mois</div>
            <span class="la-rm-badge">Objectif</span>
          </div>
        </div>
      </div>
    </section>

    <!-- FOOTER -->
    <footer class="la-footer">
      <div class="la-footer-inner">
        <div class="la-footer-brand">
          <span class="la-footer-logo">L&A</span>
          <span class="la-footer-tagline">Wealth Management · Piloté par l'IA</span>
        </div>
        <div class="la-footer-links">
          <a href="prd/">PRD</a>
          <a href="prd/personas/">Personas</a>
          <a href="prd/quickstarts/fullstack/">Quickstart</a>
          <a href="https://github.com/sylvain-e-chabi/LaA-docs" target="_blank">GitHub</a>
        </div>
        <div class="la-footer-note">Mai 2026 · sylvain-e-chabi</div>
      </div>
    </footer>

  </main>
</div>

<script>
  const items = document.querySelectorAll('.la-nav-item');
  const sections = document.querySelectorAll('section[id]');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        items.forEach(i => i.classList.remove('active'));
        const match = document.querySelector(`.la-nav-item[href="#${e.target.id}"]`);
        if (match) match.classList.add('active');
      }
    });
  }, { threshold: 0.4 });
  sections.forEach(s => observer.observe(s));
</script>
{% endblock %}
EOF

echo "✅ overrides/home.html"

# ══════════════════════════════════════════════
# 4. CSS LANDING — landing.css
# ══════════════════════════════════════════════
cat > docs/assets/css/landing.css << 'EOF'
/* ══════════════════════════════════════════════
   L&A Landing Page — Light Clean Startup
   ══════════════════════════════════════════════ */

/* ── Fonts & reset ── */
:root {
  --la-white:    #ffffff;
  --la-off:      #f9f8f6;
  --la-border:   #e8e7e4;
  --la-ink:      #111111;
  --la-ink2:     #444444;
  --la-ink3:     #888888;
  --la-cyan:     #0891b2;
  --la-cyan-bg:  #ecfeff;
  --la-cyan-bd:  #a5f3fc;
  --la-violet:   #7c3aed;
  --la-violet-bg:#f5f3ff;
  --la-violet-bd:#ddd6fe;
  --la-sidebar-w: 220px;
}

/* ── Shell layout ── */
.la-shell {
  display: flex;
  min-height: 100vh;
  background: var(--la-off);
  font-family: 'Inter', system-ui, sans-serif;
}

.md-content,
.md-content__inner {
  margin: 0 !important;
  padding: 0 !important;
  max-width: none !important;
}

/* ── SIDEBAR ── */
.la-sidebar {
  width: var(--la-sidebar-w);
  background: var(--la-white);
  border-right: 1px solid var(--la-border);
  position: sticky;
  top: 0;
  height: 100vh;
  display: flex;
  flex-direction: column;
  flex-shrink: 0;
  overflow-y: auto;
}

.la-sidebar-logo {
  padding: 20px 16px 16px;
  border-bottom: 1px solid var(--la-border);
}

.la-logo-mark {
  display: flex;
  align-items: center;
  gap: 10px;
}

.la-logo-text {
  display: flex;
  flex-direction: column;
}

.la-logo-name {
  font-size: 15px;
  font-weight: 700;
  color: var(--la-ink);
  letter-spacing: -.01em;
  line-height: 1.2;
}

.la-logo-sub {
  font-size: 10px;
  color: var(--la-ink3);
  line-height: 1.4;
}

.la-nav {
  padding: 12px 10px;
  flex: 1;
}

.la-nav-section {
  font-size: 10px;
  font-weight: 600;
  color: var(--la-ink3);
  letter-spacing: .07em;
  text-transform: uppercase;
  padding: 12px 6px 6px;
}

.la-nav-item {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 7px 8px;
  border-radius: 7px;
  font-size: 13px;
  color: var(--la-ink2);
  text-decoration: none;
  margin-bottom: 1px;
  transition: background .12s, color .12s;
}

.la-nav-item:hover {
  background: var(--la-off);
  color: var(--la-ink);
}

.la-nav-item.active {
  background: #f0f9ff;
  color: var(--la-cyan);
  font-weight: 500;
}

.la-nav-dot {
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: #ddd;
  flex-shrink: 0;
  transition: background .12s;
}
.la-nav-item.active .la-nav-dot { background: var(--la-cyan); }
.la-nav-dot.luca  { background: #06b6d4; }
.la-nav-dot.astra { background: var(--la-violet); }

.la-sidebar-footer {
  padding: 12px 10px;
  border-top: 1px solid var(--la-border);
}

.la-gh-badge {
  display: flex;
  align-items: center;
  gap: 6px;
  padding: 7px 10px;
  border-radius: 8px;
  background: var(--la-off);
  font-size: 12px;
  color: var(--la-ink2);
  text-decoration: none;
  border: 1px solid var(--la-border);
  transition: border-color .12s;
}
.la-gh-badge:hover { border-color: #bbb; }

/* ── MAIN ── */
.la-main {
  flex: 1;
  overflow-y: auto;
  min-width: 0;
}

/* ── HERO ── */
.la-hero {
  background: var(--la-white);
  border-bottom: 1px solid var(--la-border);
  padding: 64px 56px 56px;
}

.la-hero-inner { max-width: 640px; }

.la-badge {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: #f0f9ff;
  color: var(--la-cyan);
  font-size: 12px;
  font-weight: 500;
  padding: 5px 12px;
  border-radius: 99px;
  margin-bottom: 20px;
  border: 1px solid var(--la-cyan-bd);
  letter-spacing: .01em;
}

.la-hero-title {
  font-size: 44px;
  font-weight: 800;
  color: var(--la-ink);
  line-height: 1.1;
  letter-spacing: -.03em;
  margin-bottom: 16px;
}

.la-hero-accent {
  color: var(--la-cyan);
}

.la-hero-sub {
  font-size: 16px;
  color: var(--la-ink2);
  line-height: 1.65;
  max-width: 520px;
  margin-bottom: 28px;
}

.la-hero-ctas {
  display: flex;
  gap: 10px;
  align-items: center;
  margin-bottom: 36px;
}

.la-btn-primary {
  display: inline-flex;
  align-items: center;
  background: var(--la-ink);
  color: #fff;
  font-size: 14px;
  font-weight: 500;
  padding: 10px 22px;
  border-radius: 9px;
  text-decoration: none;
  letter-spacing: -.01em;
  transition: background .15s, transform .1s;
}
.la-btn-primary:hover { background: #222; transform: translateY(-1px); }

.la-btn-secondary {
  display: inline-flex;
  align-items: center;
  background: transparent;
  color: var(--la-ink2);
  font-size: 14px;
  font-weight: 500;
  padding: 10px 18px;
  border-radius: 9px;
  text-decoration: none;
  border: 1px solid var(--la-border);
  transition: border-color .15s, color .15s;
}
.la-btn-secondary:hover { border-color: #bbb; color: var(--la-ink); }

.la-hero-stats {
  display: flex;
  gap: 0;
  align-items: center;
  padding-top: 28px;
  border-top: 1px solid var(--la-border);
}

.la-stat {
  display: flex;
  flex-direction: column;
  gap: 3px;
  padding: 0 28px 0 0;
}

.la-stat-n {
  font-size: 22px;
  font-weight: 700;
  color: var(--la-ink);
  letter-spacing: -.02em;
  line-height: 1;
}

.la-stat-l {
  font-size: 12px;
  color: var(--la-ink3);
}

.la-stat-sep {
  width: 1px;
  height: 32px;
  background: var(--la-border);
  margin: 0 28px 0 0;
  flex-shrink: 0;
}

/* ── SECTIONS ── */
.la-section {
  padding: 56px;
  background: var(--la-white);
  border-bottom: 1px solid var(--la-border);
}

.la-section-alt {
  background: var(--la-off);
}

.la-section-label {
  font-size: 11px;
  font-weight: 600;
  color: var(--la-cyan);
  letter-spacing: .08em;
  text-transform: uppercase;
  margin-bottom: 10px;
}

.la-section-title {
  font-size: 28px;
  font-weight: 700;
  color: var(--la-ink);
  letter-spacing: -.02em;
  margin-bottom: 8px;
  line-height: 1.2;
}

.la-section-sub {
  font-size: 15px;
  color: var(--la-ink2);
  line-height: 1.6;
  max-width: 520px;
  margin-bottom: 32px;
}

/* ── AGENTS ── */
.la-agents-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.la-agent-card {
  border-radius: 14px;
  padding: 24px;
  border: 1px solid;
}

.la-agent-card.luca {
  background: var(--la-cyan-bg);
  border-color: var(--la-cyan-bd);
}

.la-agent-card.astra {
  background: var(--la-violet-bg);
  border-color: var(--la-violet-bd);
}

.la-agent-header {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  margin-bottom: 14px;
}

.la-agent-avatar {
  width: 40px;
  height: 40px;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  font-weight: 700;
  flex-shrink: 0;
}

.la-agent-avatar.luca  { background: #06b6d4; color: #fff; }
.la-agent-avatar.astra { background: var(--la-violet); color: #fff; }

.la-agent-pill {
  font-size: 11px;
  font-weight: 600;
  letter-spacing: .04em;
  text-transform: uppercase;
  margin-bottom: 4px;
}
.la-agent-pill.luca  { color: #0e7490; }
.la-agent-pill.astra { color: var(--la-violet); }

.la-agent-name {
  font-size: 15px;
  font-weight: 600;
  color: var(--la-ink);
  margin: 0;
  line-height: 1.3;
}

.la-agent-desc {
  font-size: 13px;
  color: var(--la-ink2);
  line-height: 1.6;
  margin-bottom: 16px;
}

.la-agent-tags {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}

.la-tag {
  font-size: 11px;
  font-weight: 500;
  padding: 3px 10px;
  border-radius: 99px;
}
.la-tag.luca  { background: #cffafe; color: #0e7490; }
.la-tag.astra { background: #ede9fe; color: #6d28d9; }

/* ── FEATURES ── */
.la-features-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 14px;
}

.la-feat-card {
  background: var(--la-white);
  border: 1px solid var(--la-border);
  border-radius: 12px;
  padding: 20px;
  transition: border-color .15s, transform .15s;
}

.la-feat-card:hover {
  border-color: #ccc;
  transform: translateY(-2px);
}

.la-feat-icon {
  width: 36px;
  height: 36px;
  border-radius: 9px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 12px;
}

.la-feat-card h3 {
  font-size: 14px;
  font-weight: 600;
  color: var(--la-ink);
  margin-bottom: 6px;
  line-height: 1.3;
}

.la-feat-card p {
  font-size: 12px;
  color: var(--la-ink3);
  line-height: 1.55;
}

/* ── APPROACH ── */
.la-approach-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 16px;
}

.la-approach-card {
  background: var(--la-white);
  border: 1px solid var(--la-border);
  border-radius: 12px;
  padding: 24px;
}

.la-approach-num {
  font-size: 28px;
  font-weight: 800;
  color: var(--la-border);
  letter-spacing: -.02em;
  line-height: 1;
  margin-bottom: 12px;
}

.la-approach-card h3 {
  font-size: 15px;
  font-weight: 600;
  color: var(--la-ink);
  margin-bottom: 8px;
}

.la-approach-card p {
  font-size: 13px;
  color: var(--la-ink2);
  line-height: 1.6;
}

/* ── ROADMAP ── */
.la-roadmap {
  display: flex;
  flex-direction: column;
  gap: 0;
  max-width: 600px;
}

.la-rm-item {
  display: flex;
  gap: 16px;
  align-items: flex-start;
}

.la-rm-dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: var(--la-border);
  border: 2px solid var(--la-border);
  flex-shrink: 0;
  margin-top: 4px;
  z-index: 1;
}
.la-rm-dot.done    { background: #0891b2; border-color: #0891b2; }
.la-rm-dot.current { background: #fff; border-color: var(--la-violet); box-shadow: 0 0 0 3px #ede9fe; }

.la-rm-line {
  width: 1px;
  background: var(--la-border);
  flex-shrink: 0;
  margin-left: 5px;
  min-height: 56px;
}
.la-rm-line.last { background: transparent; }

.la-rm-content {
  padding-bottom: 28px;
  flex: 1;
}

.la-rm-date {
  font-size: 11px;
  color: var(--la-ink3);
  font-weight: 500;
  margin-bottom: 3px;
}

.la-rm-title {
  font-size: 14px;
  font-weight: 600;
  color: var(--la-ink);
  margin-bottom: 3px;
}

.la-rm-desc {
  font-size: 12px;
  color: var(--la-ink3);
  line-height: 1.5;
  margin-bottom: 8px;
}

.la-rm-badge {
  display: inline-block;
  font-size: 11px;
  font-weight: 500;
  padding: 2px 10px;
  border-radius: 99px;
  background: #f4f4f4;
  color: #888;
}
.la-rm-badge.done    { background: #dcfce7; color: #166534; }
.la-rm-badge.current { background: #f5f3ff; color: #6d28d9; }

/* ── FOOTER ── */
.la-footer {
  background: var(--la-white);
  border-top: 1px solid var(--la-border);
  padding: 32px 56px;
}

.la-footer-inner {
  display: flex;
  align-items: center;
  gap: 32px;
  flex-wrap: wrap;
}

.la-footer-brand {
  display: flex;
  align-items: center;
  gap: 10px;
  flex: 1;
}

.la-footer-logo {
  font-size: 16px;
  font-weight: 700;
  color: var(--la-ink);
}

.la-footer-tagline {
  font-size: 12px;
  color: var(--la-ink3);
}

.la-footer-links {
  display: flex;
  gap: 20px;
}

.la-footer-links a {
  font-size: 13px;
  color: var(--la-ink3);
  text-decoration: none;
  transition: color .12s;
}
.la-footer-links a:hover { color: var(--la-ink); }

.la-footer-note {
  font-size: 12px;
  color: var(--la-ink3);
}

/* ── Responsive ── */
@media (max-width: 900px) {
  .la-sidebar { display: none; }
  .la-hero { padding: 40px 24px 32px; }
  .la-section { padding: 40px 24px; }
  .la-hero-title { font-size: 32px; }
  .la-agents-grid,
  .la-features-grid,
  .la-approach-grid { grid-template-columns: 1fr; }
  .la-footer { padding: 24px; }
}
EOF

echo "✅ landing.css"

# ══════════════════════════════════════════════
# 5. index.md — déclenche home.html
# ══════════════════════════════════════════════
cat > docs/index.md << 'EOF'
---
template: home.html
title: L&A — Wealth Management
hide:
  - navigation
  - toc
  - footer
---
EOF

echo "✅ docs/index.md"

# ══════════════════════════════════════════════
# 6. Pages produit manquantes
# ══════════════════════════════════════════════
mkdir -p docs/product

cat > docs/product/overview.md << 'EOF'
---
title: Vue d'ensemble
---
# Vue d'ensemble

L&A est une PWA de conseil patrimonial orchestrant deux agents IA — LUCA et ASTRA — via AWS Bedrock et un MCP Server Saxo Bank.

→ Voir la [page d'accueil](../index.md) pour la présentation complète.
EOF

cat > docs/product/features.md << 'EOF'
---
title: Fonctionnalités
---
# Fonctionnalités

Interface vocale · PWA Android · Multi-comptes · Moteur fiscal PFU · Projections triade C/R/O · Alertes dividendes.
EOF

cat > docs/product/luca.md << 'EOF'
---
title: Agent LUCA
---
# Agent LUCA

→ Voir la [fiche complète](../prd/personas/luca.md)
EOF

cat > docs/product/astra.md << 'EOF'
---
title: Agent ASTRA
---
# Agent ASTRA

→ Voir la [fiche complète](../prd/personas/astra.md)
EOF

cat > docs/product/roadmap.md << 'EOF'
---
title: Roadmap
---
# Roadmap

| Date | Jalon | Statut |
|---|---|---|
| Mai 2026 | PRD & GitHub Pages | ✅ Livré |
| Juil. 2026 | MCP Server Saxo Bank | 🔄 En cours |
| Jan. 2027 | Agents Bedrock v1 | 📅 Planifié |
| Juin 2027 | PWA Android beta | 📅 Planifié |
| Déc. 2027 | Objectif 5 000 € net | 🎯 Objectif |
EOF

cat > docs/prd/architecture.md << 'EOF'
---
title: Architecture
---
# Architecture

```mermaid
graph TD
    A[PWA Android] -->|HTTPS| B[API Gateway AWS]
    B --> C[Bedrock Agent · Claude Sonnet 4]
    C -->|MCP| D[MCP Server Saxo Bank]
    D -->|OpenAPI| E[Saxo Bank]
    C --> F[FiscalEngine Lambda]
    F --> G[Secrets Manager · KMS]
```

Stack complet : React PWA · AWS Bedrock · MCP Server Python · Saxo OpenAPI · Terraform · GitHub Actions.
EOF

echo "✅ Pages produit + architecture"

# ══════════════════════════════════════════════
# COMMIT & PUSH
# ══════════════════════════════════════════════
git add .
git commit -m "feat(landing): startup landing page — sidebar fixe, hero, agents, features, roadmap"
git push origin main

echo ""
echo "════════════════════════════════════════════════════════"
echo "  🎉 Landing page déployée"
echo "════════════════════════════════════════════════════════"
echo ""
echo "  👀 Local  : python -m mkdocs serve → http://127.0.0.1:8000"
echo "  🌐 Live   : https://sylvain-e-chabi.github.io/LaA-docs/"
echo "              (disponible dans ~30s après le push)"
echo ""
