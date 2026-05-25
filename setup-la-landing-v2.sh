#!/usr/bin/env bash
# ══════════════════════════════════════════════════════════════════════
# L&A — Landing v2 · Avatars + Radar Chart + Section Agents enrichie
# Usage : cd /c/smc/LeA/LaA-docs && bash setup-la-landing-v2.sh
# ══════════════════════════════════════════════════════════════════════
set -euo pipefail

echo ""
echo "══════════════════════════════════════════════"
echo "  L&A — Landing v2 · Avatars + Radar"
echo "══════════════════════════════════════════════"
echo ""

# ──────────────────────────────────────────────
# 1. STRUCTURE IMAGES
# ──────────────────────────────────────────────
mkdir -p docs/assets/images/avatars

echo ""
echo "📁 Chemins de dépôt des avatars :"
echo "   docs/assets/images/avatars/po-tech.png"
echo "   docs/assets/images/avatars/genai-fullstack.png"
echo "   docs/assets/images/avatars/sre-lead.png"
echo "   docs/assets/images/avatars/soc-analyst.png"
echo "   docs/assets/images/avatars/lz-ops.png"
echo "   docs/assets/images/avatars/agentic-luca.png"
echo "   docs/assets/images/avatars/agentic-astra.png"
echo ""
echo "→ Copie manuelle depuis Windows :"
echo "   cp /c/chemin/vers/PO-Tech.png         docs/assets/images/avatars/po-tech.png"
echo "   cp /c/chemin/vers/GenAI-FullStack.png docs/assets/images/avatars/genai-fullstack.png"
echo "   cp /c/chemin/vers/SRE-lead.png        docs/assets/images/avatars/sre-lead.png"
echo "   cp /c/chemin/vers/SOC-Analyst.png     docs/assets/images/avatars/soc-analyst.png"
echo "   cp /c/chemin/vers/LZ-Ops.png          docs/assets/images/avatars/lz-ops.png"
echo "   cp /c/chemin/vers/agentic-luca.png    docs/assets/images/avatars/agentic-luca.png"
echo "   cp /c/chemin/vers/agentic-astra.png   docs/assets/images/avatars/agentic-astra.png"
echo ""

# ──────────────────────────────────────────────
# 2. CSS COMPLÉMENTAIRE — radar + squad + agents v2
# ──────────────────────────────────────────────
cat >> docs/assets/css/landing.css << 'EOF'

/* ══════════════════════════════════════════════
   SECTION SQUAD — radar + cartes membres
   ══════════════════════════════════════════════ */

.la-squad-intro {
  display: grid;
  grid-template-columns: 1fr 420px;
  gap: 48px;
  align-items: start;
  margin-bottom: 48px;
}

.la-squad-text h2 { margin-bottom: 8px; }
.la-squad-text p  { font-size:14px; color:var(--la-ink2); line-height:1.65; margin-bottom:20px; }

/* Radar */
.la-radar-wrap {
  position: relative;
  background: #f4f3f0;
  border: 1px solid var(--la-border);
  border-radius: 14px;
  padding: 20px;
}
.la-radar-wrap canvas { display: block; width: 100%; height: auto; }
.la-radar-legend {
  display: flex; flex-wrap: wrap; gap: 8px 16px;
  margin-top: 14px; justify-content: center;
}
.la-radar-legend-item {
  display: flex; align-items: center; gap: 6px;
  font-size: 11px; color: var(--la-ink2); font-weight: 500;
}
.la-radar-legend-dot {
  width: 10px; height: 10px; border-radius: 50%; flex-shrink: 0;
}
/* Toggles du radar */
.la-radar-toggles {
  display: flex; flex-wrap: wrap; gap: 6px;
  margin-bottom: 14px;
}
.la-radar-toggle {
  display: inline-flex; align-items: center; gap: 6px;
  font-size: 11px; font-weight: 600; letter-spacing: .04em;
  padding: 4px 10px; border-radius: 99px; cursor: pointer;
  border: 1.5px solid; transition: opacity .15s;
  user-select: none;
}
.la-radar-toggle.off { opacity: .3; }

/* Squad grid membres */
.la-squad-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
  gap: 14px;
}
.la-squad-card {
  background: var(--la-white);
  border: 1px solid var(--la-border);
  border-radius: 12px;
  padding: 18px 14px;
  text-align: center;
  transition: border-color .15s, transform .15s;
  cursor: pointer;
}
.la-squad-card:hover { border-color: #bbb; transform: translateY(-2px); }
.la-squad-card img {
  width: 72px; height: 72px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--la-border);
  margin-bottom: 10px;
  display: block; margin-left: auto; margin-right: auto;
}
.la-squad-card-name { font-size: 13px; font-weight: 600; color: var(--la-ink); margin-bottom: 3px; }
.la-squad-card-role { font-size: 11px; color: var(--la-ink3); letter-spacing: .03em; }
.la-squad-card-dot  {
  width: 8px; height: 8px; border-radius: 50%;
  margin: 8px auto 0; display: block;
}

/* ══════════════════════════════════════════════
   SECTION AGENTS v2 — chapeau + dialog + fiches
   ══════════════════════════════════════════════ */

/* Chapeau rubrique */
.la-agents-hat {
  text-align: center;
  max-width: 600px;
  margin: 0 auto 48px;
}
.la-agents-hat .la-section-label { justify-content: center; text-align: center; display: block; }
.la-agents-hat h2 { margin-bottom: 10px; }
.la-agents-hat p  { font-size: 15px; color: var(--la-ink2); line-height: 1.65; }

/* Séparateur dialog */
.la-dialog-wrap {
  margin-bottom: 48px;
}
.la-dialog-header {
  display: flex; align-items: center; gap: 10px;
  margin-bottom: 16px;
}
.la-dialog-header-line {
  flex: 1; height: 1px; background: var(--la-border);
}
.la-dialog-header-label {
  font-size: 10px; font-weight: 600; color: var(--la-ink3);
  letter-spacing: .08em; text-transform: uppercase;
  white-space: nowrap;
}

/* Chat bubbles — version light */
.la-chat {
  background: #fdfdfc;
  border: 1px solid var(--la-border);
  border-radius: 16px;
  padding: 24px;
  max-width: 720px;
  margin: 0 auto;
}
.la-chat-bar {
  display: flex; align-items: center; gap: 8px;
  padding-bottom: 14px; border-bottom: 1px solid var(--la-border);
  margin-bottom: 20px;
}
.la-chat-bar-dot {
  width: 8px; height: 8px; border-radius: 50%;
  background: var(--la-cyan); flex-shrink: 0;
  animation: blink-light 2s infinite;
}
@keyframes blink-light { 0%,100%{opacity:1} 50%{opacity:.25} }
.la-chat-bar-name {
  font-size: 13px; font-weight: 700; letter-spacing: .04em;
  background: linear-gradient(90deg, var(--la-cyan), var(--la-violet));
  -webkit-background-clip: text; -webkit-text-fill-color: transparent;
}
.la-chat-bar-status { margin-left: auto; font-size: 11px; color: var(--la-ink3); }

.la-chat-row { display: flex; gap: 10px; margin-bottom: 16px; align-items: flex-start; }
.la-chat-row.la-user { flex-direction: row-reverse; }

.la-chat-av {
  width: 38px; height: 38px; border-radius: 50%;
  object-fit: cover; flex-shrink: 0;
  border: 2px solid var(--la-border);
}
.la-chat-av.la-av-luca  { border-color: #a5f3fc; }
.la-chat-av.la-av-astra { border-color: var(--la-violet-bd); }
.la-chat-av-initial {
  width: 38px; height: 38px; border-radius: 50%; flex-shrink: 0;
  display: flex; align-items: center; justify-content: center;
  font-size: 13px; font-weight: 700;
}
.la-chat-av-initial.user { background: #111; color: #fff; }

.la-chat-body { max-width: 74%; }
.la-chat-who  { font-size: 10px; font-weight: 700; letter-spacing: .06em; text-transform: uppercase; margin-bottom: 4px; }
.la-chat-who.luca  { color: var(--la-cyan); }
.la-chat-who.astra { color: var(--la-violet); }
.la-chat-who.user  { color: #555; text-align: right; }

.la-chat-bubble {
  padding: 10px 14px; border-radius: 12px;
  font-size: 13px; line-height: 1.6; color: var(--la-ink);
}
.la-chat-bubble.user  { background: #f4f3f0; border: 1px solid var(--la-border); border-top-right-radius: 3px; }
.la-chat-bubble.luca  { background: #ecfeff; border: 1px solid #a5f3fc; border-top-left-radius: 3px; }
.la-chat-bubble.astra { background: #f5f3ff; border: 1px solid var(--la-violet-bd); border-top-left-radius: 3px; }

.la-chat-bubble table { font-size: 12px; margin: 8px 0 0; width: 100%; border-collapse: collapse; }
.la-chat-bubble table th { background: rgba(0,0,0,.04); padding: 4px 8px; font-size: 11px; font-weight: 600; }
.la-chat-bubble table td { padding: 4px 8px; border-top: 1px solid rgba(0,0,0,.05); }
.chat-pos { color: #0d7040; font-weight: 700; }
.chat-neg { color: #be123c; font-weight: 700; }
.chat-neu { color: var(--la-ink3); }

/* Fiches agents individuelles */
.la-agents-cards {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 24px;
  margin-top: 32px;
}
.la-agent-full {
  background: var(--la-white);
  border: 1px solid var(--la-border);
  border-radius: 16px;
  overflow: hidden;
}
.la-agent-full-header {
  padding: 24px 24px 20px;
  border-bottom: 1px solid var(--la-border);
  display: flex; gap: 16px; align-items: flex-start;
}
.la-agent-full-header img {
  width: 80px; height: 80px;
  border-radius: 12px;
  object-fit: cover;
  border: 2px solid var(--la-border);
  flex-shrink: 0;
}
.la-agent-full.luca .la-agent-full-header { background: var(--la-cyan-bg); border-bottom-color: var(--la-cyan-bd); }
.la-agent-full.astra .la-agent-full-header { background: var(--la-violet-bg); border-bottom-color: var(--la-violet-bd); }
.la-agent-full.luca .la-agent-full-header img  { border-color: var(--la-cyan-bd); }
.la-agent-full.astra .la-agent-full-header img { border-color: var(--la-violet-bd); }

.la-agent-full-pill {
  font-size: 10px; font-weight: 700; letter-spacing: .07em;
  text-transform: uppercase; margin-bottom: 5px;
}
.la-agent-full.luca  .la-agent-full-pill { color: #0e7490; }
.la-agent-full.astra .la-agent-full-pill { color: var(--la-violet); }
.la-agent-full-name  { font-size: 18px; font-weight: 700; color: var(--la-ink); margin-bottom: 3px; }
.la-agent-full-sub   { font-size: 12px; color: var(--la-ink3); }

.la-agent-full-body  { padding: 20px 24px; }
.la-agent-full-desc  { font-size: 13px; color: var(--la-ink2); line-height: 1.6; margin-bottom: 16px; }

.la-agent-scope-title {
  font-size: 10px; font-weight: 700; letter-spacing: .07em;
  text-transform: uppercase; color: var(--la-ink3);
  margin-bottom: 10px;
}
.la-agent-scope-list { list-style: none; padding: 0; margin: 0 0 16px; }
.la-agent-scope-list li {
  font-size: 12px; color: var(--la-ink2);
  padding: 5px 0; border-bottom: 1px solid var(--la-border);
  display: flex; align-items: center; gap: 8px;
}
.la-agent-scope-list li::before {
  content: ''; width: 5px; height: 5px; border-radius: 50%;
  flex-shrink: 0;
}
.la-agent-full.luca  .la-agent-scope-list li::before { background: var(--la-cyan); }
.la-agent-full.astra .la-agent-scope-list li::before { background: var(--la-violet); }

.la-agent-rule {
  font-size: 12px; color: var(--la-ink2); line-height: 1.55;
  background: #f9f8f6; border-left: 3px solid;
  border-radius: 0 8px 8px 0; padding: 10px 14px; margin-top: 4px;
}
.la-agent-full.luca  .la-agent-rule { border-color: var(--la-cyan); }
.la-agent-full.astra .la-agent-rule { border-color: var(--la-violet); }
.la-agent-rule strong { color: var(--la-ink); }

@media (max-width: 900px) {
  .la-squad-intro    { grid-template-columns: 1fr; }
  .la-agents-cards   { grid-template-columns: 1fr; }
}
EOF

echo "✅ CSS v2 — radar + squad + agents enrichis"

# ──────────────────────────────────────────────
# 3. overrides/home.html — VERSION COMPLÈTE v2
# ──────────────────────────────────────────────
cat > overrides/home.html << 'HTMLEOF'
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
        <svg width="32" height="32" viewBox="0 0 32 32" fill="none">
          <rect width="32" height="32" rx="9" fill="#111"/>
          <text x="16" y="22" font-family="Georgia,serif" font-size="13" font-weight="700" text-anchor="middle" fill="url(#slg)">L&amp;A</text>
          <defs><linearGradient id="slg" x1="0" y1="0" x2="32" y2="32" gradientUnits="userSpaceOnUse"><stop offset="0%" stop-color="#22d3ee"/><stop offset="100%" stop-color="#a78bfa"/></linearGradient></defs>
        </svg>
        <div class="la-logo-text">
          <span class="la-logo-name">L&A</span>
          <span class="la-logo-sub">Wealth Management</span>
        </div>
      </div>
    </div>
    <nav class="la-nav">
      <div class="la-nav-section">Produit</div>
      <a href="#overview"  class="la-nav-item active"><span class="la-nav-dot"></span>Vue d'ensemble</a>
      <a href="#squad"     class="la-nav-item"><span class="la-nav-dot"></span>La squad</a>
      <a href="#agents"    class="la-nav-item luca"><span class="la-nav-dot luca"></span>Agent LUCA</a>
      <a href="#agents"    class="la-nav-item astra"><span class="la-nav-dot astra"></span>Agent ASTRA</a>
      <a href="#features"  class="la-nav-item"><span class="la-nav-dot"></span>Fonctionnalités</a>
      <a href="#approach"  class="la-nav-item"><span class="la-nav-dot"></span>La démarche</a>
      <a href="#roadmap"   class="la-nav-item"><span class="la-nav-dot"></span>Roadmap</a>
      <div class="la-nav-section">Conception</div>
      <a href="prd/personas/"          class="la-nav-item"><span class="la-nav-dot"></span>Personas</a>
      <a href="prd/user-stories/"      class="la-nav-item"><span class="la-nav-dot"></span>User Stories</a>
      <a href="prd/architecture/"      class="la-nav-item"><span class="la-nav-dot"></span>Architecture</a>
      <a href="prd/conversation/"      class="la-nav-item"><span class="la-nav-dot"></span>Conversation L&A</a>
      <div class="la-nav-section">Dev</div>
      <a href="prd/quickstarts/fullstack/" class="la-nav-item"><span class="la-nav-dot"></span>Quickstart</a>
      <a href="prd/personas/hack/"         class="la-nav-item"><span class="la-nav-dot"></span>Threat model</a>
    </nav>
    <div class="la-sidebar-footer">
      <a href="https://github.com/sylvain-e-chabi/LaA-docs" target="_blank" class="la-gh-badge">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0 0 24 12c0-6.63-5.37-12-12-12z"/></svg>
        sylvain-e-chabi
      </a>
    </div>
  </aside>

  <!-- ── MAIN ── -->
  <main class="la-main">

    <!-- HERO -->
    <section class="la-hero" id="overview">
      <div class="la-hero-inner">
        <div class="la-badge">✦ Projet en cours · Mai 2026</div>
        <h1 class="la-hero-title">Votre conseiller patrimonial.<br><span class="la-hero-accent">Piloté par l'IA.</span></h1>
        <p class="la-hero-sub">L&A orchestre deux agents IA — LUCA et ASTRA — pour piloter votre portefeuille, optimiser votre fiscalité et vous guider vers vos objectifs patrimoniaux. Par la voix ou par texte, en français.</p>
        <div class="la-hero-ctas">
          <a href="#agents" class="la-btn-primary">Découvrir les agents →</a>
          <a href="prd/" class="la-btn-secondary">Lire le PRD</a>
        </div>
        <div class="la-hero-stats">
          <div class="la-stat"><span class="la-stat-n">2</span><span class="la-stat-l">Agents IA</span></div>
          <div class="la-stat-sep"></div>
          <div class="la-stat"><span class="la-stat-n">5 000 €</span><span class="la-stat-l">Objectif net déc. 2027</span></div>
          <div class="la-stat-sep"></div>
          <div class="la-stat"><span class="la-stat-n">3</span><span class="la-stat-l">Véhicules fiscaux</span></div>
          <div class="la-stat-sep"></div>
          <div class="la-stat"><span class="la-stat-n">100 %</span><span class="la-stat-l">Vocal + texte</span></div>
        </div>
      </div>
    </section>

    <!-- SQUAD -->
    <section class="la-section la-section-alt" id="squad">
      <div class="la-section-label">La squad</div>
      <div class="la-squad-intro">
        <div class="la-squad-text">
          <h2 class="la-section-title">Qui construit L&A ?</h2>
          <p>Cinq rôles complémentaires, une mission commune : livrer un conseiller patrimonial IA fiable, sécurisé et auditable.</p>
          <div class="la-squad-grid" id="squadGrid">
            <div class="la-squad-card" style="--rc:#00e5ff">
              <img src="assets/images/avatars/lz-ops.png" alt="LZOps" onerror="this.style.display='none'">
              <div class="la-squad-card-name">LZOps</div>
              <div class="la-squad-card-role">LANDING ZONE OPS</div>
              <span class="la-squad-card-dot" style="background:#00e5ff"></span>
            </div>
            <div class="la-squad-card" style="--rc:#f59e0b">
              <img src="assets/images/avatars/soc-analyst.png" alt="SOC" onerror="this.style.display='none'">
              <div class="la-squad-card-name">SOC Analyst</div>
              <div class="la-squad-card-role">SECURITY OPS</div>
              <span class="la-squad-card-dot" style="background:#f59e0b"></span>
            </div>
            <div class="la-squad-card" style="--rc:#00ff88">
              <img src="assets/images/avatars/sre-lead.png" alt="SRE" onerror="this.style.display='none'">
              <div class="la-squad-card-name">SRE Lead</div>
              <div class="la-squad-card-role">SITE RELIABILITY</div>
              <span class="la-squad-card-dot" style="background:#00ff88"></span>
            </div>
            <div class="la-squad-card" style="--rc:#d946ef">
              <img src="assets/images/avatars/genai-fullstack.png" alt="GenAI" onerror="this.style.display='none'">
              <div class="la-squad-card-name">GenAI FullStack</div>
              <div class="la-squad-card-role">AI ENGINEERING</div>
              <span class="la-squad-card-dot" style="background:#d946ef"></span>
            </div>
            <div class="la-squad-card" style="--rc:#f43f5e">
              <img src="assets/images/avatars/po-tech.png" alt="PO" onerror="this.style.display='none'">
              <div class="la-squad-card-name">Product Owner</div>
              <div class="la-squad-card-role">PRODUCT & FINOPS</div>
              <span class="la-squad-card-dot" style="background:#f43f5e"></span>
            </div>
          </div>
        </div>

        <!-- RADAR -->
        <div class="la-radar-wrap">
          <div class="la-radar-toggles" id="radarToggles"></div>
          <canvas id="radarChart" width="420" height="420"></canvas>
          <div class="la-radar-legend" id="radarLegend"></div>
        </div>
      </div>
    </section>

    <!-- AGENTS — chapeau + dialogue + fiches -->
    <section class="la-section" id="agents">

      <!-- Chapeau rubrique -->
      <div class="la-agents-hat">
        <div class="la-section-label">Intelligence artificielle</div>
        <h2 class="la-section-title">Deux agents, une intelligence partagée</h2>
        <p>LUCA et ASTRA ne sont pas de simples chatbots. Ils partagent le même contexte de conversation, se passent la main de façon transparente et appliquent des règles strictes — données réelles d'un côté, stratégie vérifiée de l'autre.</p>
      </div>

      <!-- Exemple de dialogue -->
      <div class="la-dialog-wrap">
        <div class="la-dialog-header">
          <div class="la-dialog-header-line"></div>
          <div class="la-dialog-header-label">Exemple de conversation</div>
          <div class="la-dialog-header-line"></div>
        </div>

        <div class="la-chat">
          <div class="la-chat-bar">
            <div class="la-chat-bar-dot"></div>
            <span class="la-chat-bar-name">L&A · Léa</span>
            <span class="la-chat-bar-status">LUCA + ASTRA · en ligne</span>
          </div>

          <!-- User 1 -->
          <div class="la-chat-row la-user">
            <div class="la-chat-av-initial user">S</div>
            <div class="la-chat-body">
              <div class="la-chat-who user">Sylvain</div>
              <div class="la-chat-bubble user">Combien vaut mon portefeuille aujourd'hui et combien ai-je vraiment gagné depuis le début ?</div>
            </div>
          </div>

          <!-- LUCA -->
          <div class="la-chat-row">
            <img class="la-chat-av la-av-luca" src="assets/images/avatars/agentic-luca.png" alt="LUCA" onerror="this.outerHTML='<div class=\'la-chat-av-initial\' style=\'background:#ecfeff;color:#0e7490;border:2px solid #a5f3fc\'>L</div>'">
            <div class="la-chat-body">
              <div class="la-chat-who luca">LUCA — Data & Passé</div>
              <div class="la-chat-bubble luca">
                Voici ton portefeuille au 22 mai 2026 :
                <table>
                  <thead><tr><th>Métrique</th><th>Valeur</th></tr></thead>
                  <tbody>
                    <tr><td>Valeur totale</td><td><strong>12 285 USD</strong></td></tr>
                    <tr><td>Capital investi</td><td>8 750 USD</td></tr>
                    <tr><td>P&L absolu</td><td><span class="chat-pos">+3 535 USD (+40,4%)</span></td></tr>
                    <tr><td>Dividendes YTD</td><td>+47 USD</td></tr>
                    <tr><td>Meilleure position</td><td>NVDA <span class="chat-pos">+127%</span></td></tr>
                    <tr><td>Position en perte</td><td>AIL <span class="chat-neg">−8,2%</span></td></tr>
                  </tbody>
                </table>
                <br><em style="font-size:11px;color:#999">Source : Saxo API · mis à jour il y a 2 min</em>
              </div>
            </div>
          </div>

          <!-- User 2 -->
          <div class="la-chat-row la-user">
            <div class="la-chat-av-initial user">S</div>
            <div class="la-chat-body">
              <div class="la-chat-who user">Sylvain</div>
              <div class="la-chat-bubble user">Si je vends tout aujourd'hui, combien je touche net d'impôts ?</div>
            </div>
          </div>

          <!-- ASTRA -->
          <div class="la-chat-row">
            <img class="la-chat-av la-av-astra" src="assets/images/avatars/agentic-astra.png" alt="ASTRA" onerror="this.outerHTML='<div class=\'la-chat-av-initial\' style=\'background:#f5f3ff;color:#7c3aed;border:2px solid #ddd6fe\'>A</div>'">
            <div class="la-chat-body">
              <div class="la-chat-who astra">ASTRA — Stratégie & Futur</div>
              <div class="la-chat-bubble astra">
                Simulation — <strong>PFU sur plus-values uniquement</strong> :
                <table>
                  <thead><tr><th>Ligne</th><th>Montant</th></tr></thead>
                  <tbody>
                    <tr><td>① Capital investi</td><td>8 750 USD</td></tr>
                    <tr><td>③ Plus-values latentes</td><td><span class="chat-pos">+3 535 USD</span></td></tr>
                    <tr><td><strong>Total brut</strong></td><td><strong>12 285 USD</strong></td></tr>
                    <tr><td>PFU 30% × PV</td><td><span class="chat-neg">−1 061 USD</span></td></tr>
                    <tr><td><strong>Net perçu</strong></td><td><span class="chat-pos"><strong>11 224 USD</strong></span></td></tr>
                  </tbody>
                </table>
                <br>⚠️ Je déconseille. Projection réaliste déc. 2027 : <strong>~6 200 USD net</strong> — soit +38% vs vendre maintenant.
              </div>
            </div>
          </div>

          <!-- User 3 -->
          <div class="la-chat-row la-user">
            <div class="la-chat-av-initial user">S</div>
            <div class="la-chat-body">
              <div class="la-chat-who user">Sylvain</div>
              <div class="la-chat-bubble user">Ok. Qu'est-ce que j'achète ce mois-ci avec mes 500 € ?</div>
            </div>
          </div>

          <!-- ASTRA 2 -->
          <div class="la-chat-row">
            <img class="la-chat-av la-av-astra" src="assets/images/avatars/agentic-astra.png" alt="ASTRA" onerror="this.outerHTML='<div class=\'la-chat-av-initial\' style=\'background:#f5f3ff;color:#7c3aed;border:2px solid #ddd6fe\'>A</div>'">
            <div class="la-chat-body">
              <div class="la-chat-who astra">ASTRA — Stratégie & Futur</div>
              <div class="la-chat-bubble astra">
                Ordre d'achat mai 2026 — <strong>500 €</strong> :
                <table>
                  <thead><tr><th>Prio</th><th>Action</th><th>Montant</th><th>Yield</th></tr></thead>
                  <tbody>
                    <tr><td>1️⃣</td><td><strong>Realty Income +3</strong></td><td>~192 €</td><td>5,1%</td></tr>
                    <tr><td>2️⃣</td><td><strong>Allianz → 1 part</strong></td><td>~249 €</td><td>3,2%</td></tr>
                    <tr><td>3️⃣</td><td>Cash buffer</td><td>~59 €</td><td class="chat-neu">—</td></tr>
                  </tbody>
                </table>
                <br>⏰ Mardi ou mercredi · 16h30–17h30 Paris
              </div>
            </div>
          </div>

        </div>
      </div>

      <!-- Fiches agents individuelles -->
      <div class="la-agents-cards">

        <div class="la-agent-full luca">
          <div class="la-agent-full-header">
            <img src="assets/images/avatars/agentic-luca.png" alt="LUCA" onerror="this.style.display='none'">
            <div>
              <div class="la-agent-full-pill">Agent IA · Data & Passé</div>
              <div class="la-agent-full-name">LUCA</div>
              <div class="la-agent-full-sub">Bedrock · Cyan #00e5ff · Polly Léa neural</div>
            </div>
          </div>
          <div class="la-agent-full-body">
            <p class="la-agent-full-desc">LUCA ancre chaque réponse dans la réalité des données. Il interroge Saxo Bank en temps réel et ne formule jamais d'opinion — uniquement des faits vérifiés.</p>
            <div class="la-agent-scope-title">Périmètre de réponse</div>
            <ul class="la-agent-scope-list">
              <li>Valorisation temps réel du portefeuille</li>
              <li>P&L absolu par position</li>
              <li>Dividendes reçus — historique & YTD</li>
              <li>PRU (Prix de Revient Unitaire) par ligne</li>
              <li>TWR affiché Revolut</li>
              <li>Dates ex-dividende et montants versés</li>
            </ul>
            <div class="la-agent-rule">
              <strong>Règle d'activation :</strong> toute question factuelle sur le passé ou le présent — <em>"Combien vaut NVDA ?"</em>, <em>"Quel dividende ai-je reçu d'O en avril ?"</em>
            </div>
          </div>
        </div>

        <div class="la-agent-full astra">
          <div class="la-agent-full-header">
            <img src="assets/images/avatars/agentic-astra.png" alt="ASTRA" onerror="this.style.display='none'">
            <div>
              <div class="la-agent-full-pill">Agent IA · Stratégie & Futur</div>
              <div class="la-agent-full-name">ASTRA</div>
              <div class="la-agent-full-sub">Bedrock · Violet #8b5cf6 · FiscalEngine Lambda</div>
            </div>
          </div>
          <div class="la-agent-full-body">
            <p class="la-agent-full-desc">ASTRA projette, recommande et optimise. Elle applique systématiquement la décomposition fiscale 4 lignes et ne calcule jamais le PFU sur la valeur brute.</p>
            <div class="la-agent-scope-title">Périmètre de réponse</div>
            <ul class="la-agent-scope-list">
              <li>Recommandations d'achat priorisées</li>
              <li>Projections triade conservative / réaliste / optimiste</li>
              <li>Calcul PFU 30% sur plus-values uniquement</li>
              <li>Ordre d'achat mensuel structuré</li>
              <li>Stratégie dividendes vs croissance</li>
              <li>Migration PEA Saxo Banque</li>
            </ul>
            <div class="la-agent-rule">
              <strong>Règle absolue :</strong> <code>(Valeur Finale − Capital Investi) × 30%</code> — jamais appliqué sur la valeur brute totale.
            </div>
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
          <div class="la-feat-icon" style="background:#f0fdfc;color:#0F6E56">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 2a3 3 0 0 0-3 3v4a3 3 0 0 0 6 0V5a3 3 0 0 0-3-3z"/><path d="M19 10a7 7 0 0 1-14 0"/><line x1="12" y1="19" x2="12" y2="22"/></svg>
          </div>
          <h3>Interface vocale</h3>
          <p>Posez vos questions à la voix en français, mains libres. Réponses via Amazon Polly — Léa neural.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#f5f0fe;color:#534AB7">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="2" y="3" width="20" height="14" rx="2"/><line x1="8" y1="21" x2="16" y2="21"/><line x1="12" y1="17" x2="12" y2="21"/></svg>
          </div>
          <h3>PWA mobile-first</h3>
          <p>Installable sur Android comme une app native. Consultation hors-ligne du dernier état connu.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#faf0fe;color:#7c3aed">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg>
          </div>
          <h3>Multi-comptes consolidés</h3>
          <p>CTO Revolut, PEA Saxo Banque, AV Linxea Spirit 2 — vision unifiée en temps réel.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#eaf3de;color:#3B6D11">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
          </div>
          <h3>Moteur fiscal PFU</h3>
          <p>PFU 30% calculé sur plus-values uniquement. Décomposition 4 lignes systématique.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#fef9e7;color:#854F0B">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M18 20V10"/><path d="M12 20V4"/><path d="M6 20v-6"/></svg>
          </div>
          <h3>Projections triade C/R/O</h3>
          <p>Conservative, réaliste, optimiste — à 3 ans, systématiquement, horizon explicite.</p>
        </div>
        <div class="la-feat-card">
          <div class="la-feat-icon" style="background:#fff0f0;color:#A32D2D">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/></svg>
          </div>
          <h3>Alertes dividendes</h3>
          <p>Ex-dates, montants versés, streaks aristocrats. Ne ratez plus aucun détachement.</p>
        </div>
      </div>
    </section>

    <!-- APPROACH -->
    <section class="la-section" id="approach">
      <div class="la-section-label">La démarche</div>
      <h2 class="la-section-title">Pensé par un investisseur, pour des investisseurs</h2>
      <div class="la-approach-grid">
        <div class="la-approach-card"><div class="la-approach-num">01</div><h3>Partir des vraies douleurs</h3><p>Calcul PFU erroné, consolidation manuelle 2–3h/semaine, pas de vision P&L multi-comptes. L&A est né de ces frustrations concrètes.</p></div>
        <div class="la-approach-card"><div class="la-approach-num">02</div><h3>Deux agents, deux périmètres stricts</h3><p>LUCA ne recommande jamais. ASTRA ne cite jamais de données sans source. La séparation des responsabilités est architecturale.</p></div>
        <div class="la-approach-card"><div class="la-approach-num">03</div><h3>Mobile vocal avant tout</h3><p>L'investisseur retail consulte dans les transports, le soir, en quelques minutes. La voix est le mode principal, pas une option.</p></div>
        <div class="la-approach-card"><div class="la-approach-num">04</div><h3>Fiscalité française au cœur</h3><p>PFU, PEA, Assurance-Vie, PRU — le moteur fiscal est documenté, auditable et systématique. Pas de boîte noire.</p></div>
      </div>
    </section>

    <!-- ROADMAP -->
    <section class="la-section la-section-alt" id="roadmap">
      <div class="la-section-label">Roadmap</div>
      <h2 class="la-section-title">De la documentation à la production</h2>
      <div class="la-roadmap">
        <div class="la-rm-item done"><div class="la-rm-dot done"></div><div class="la-rm-line"></div><div class="la-rm-content"><div class="la-rm-date">Mai 2026</div><div class="la-rm-title">PRD & documentation</div><div class="la-rm-desc">MkDocs Material · GitHub Pages · 5 personas · Threat model</div><span class="la-rm-badge done">Livré ✓</span></div></div>
        <div class="la-rm-item current"><div class="la-rm-dot current"></div><div class="la-rm-line"></div><div class="la-rm-content"><div class="la-rm-date">Juil. 2026</div><div class="la-rm-title">MCP Server Saxo Bank</div><div class="la-rm-desc">Connecteur broker · données temps réel · POC Bedrock</div><span class="la-rm-badge current">En cours</span></div></div>
        <div class="la-rm-item"><div class="la-rm-dot"></div><div class="la-rm-line"></div><div class="la-rm-content"><div class="la-rm-date">Jan. 2027</div><div class="la-rm-title">Agents LUCA & ASTRA (v1)</div><div class="la-rm-desc">Bedrock · voix Polly · FiscalEngine Lambda</div><span class="la-rm-badge">Planifié</span></div></div>
        <div class="la-rm-item"><div class="la-rm-dot"></div><div class="la-rm-line"></div><div class="la-rm-content"><div class="la-rm-date">Juin 2027</div><div class="la-rm-title">PWA Android · beta</div><div class="la-rm-desc">Interface mobile · vocal · multi-comptes consolidés</div><span class="la-rm-badge">Planifié</span></div></div>
        <div class="la-rm-item"><div class="la-rm-dot"></div><div class="la-rm-line last"></div><div class="la-rm-content"><div class="la-rm-date">Déc. 2027</div><div class="la-rm-title">Objectif 5 000 € net</div><div class="la-rm-desc">Milestone patrimonial · distribution dividendes ~36 € net/mois</div><span class="la-rm-badge">Objectif</span></div></div>
      </div>
    </section>

    <!-- FOOTER -->
    <footer class="la-footer">
      <div class="la-footer-inner">
        <div class="la-footer-brand"><span class="la-footer-logo">L&A</span><span class="la-footer-tagline">Wealth Management · Piloté par l'IA</span></div>
        <div class="la-footer-links"><a href="prd/">PRD</a><a href="prd/personas/">Personas</a><a href="prd/quickstarts/fullstack/">Quickstart</a><a href="https://github.com/sylvain-e-chabi/LaA-docs" target="_blank">GitHub</a></div>
        <div class="la-footer-note">Mai 2026 · sylvain-e-chabi</div>
      </div>
    </footer>

  </main>
</div>

<script>
// ── Scroll spy sidebar ──
const navItems = document.querySelectorAll('.la-nav-item');
const sections = document.querySelectorAll('section[id]');
const obs = new IntersectionObserver(entries => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      navItems.forEach(i => i.classList.remove('active'));
      const m = document.querySelector(`.la-nav-item[href="#${e.target.id}"]`);
      if (m) m.classList.add('active');
    }
  });
}, { threshold: 0.3 });
sections.forEach(s => obs.observe(s));

// ── RADAR CHART — canvas natif, dynamique avec toggles ──
(function() {
  const ROLES = [
    { id:'lzops', label:'LZOps',        color:'#00bcd4' },
    { id:'soc',   label:'SOC Analyst',  color:'#f59e0b' },
    { id:'sre',   label:'SRE Lead',     color:'#22c55e' },
    { id:'genai', label:'GenAI',        color:'#d946ef' },
    { id:'po',    label:'PO-Tech',      color:'#f43f5e' },
  ];
  const LABELS = ["LZ Design","Network","IAM","Compliance","SIEM","Incident","CI/CD","Observ.","AI/ML","API","Backlog","Cost","Budget","Tags"];
  const DATA = {
    lzops: [5,5,4,4,3,2,3,3,2,3,1,3,2,4],
    soc:   [2,2,5,5,5,5,1,3,1,1,2,1,1,1],
    sre:   [3,4,3,2,3,4,5,5,3,3,2,3,4,3],
    genai: [2,2,2,2,1,2,5,4,5,5,3,2,2,2],
    po:    [1,1,2,2,1,1,2,2,3,4,5,5,5,5],
  };

  // État visible
  const visible = { lzops:true, soc:true, sre:true, genai:true, po:true };

  const canvas = document.getElementById('radarChart');
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  const W = 420, CX = 210, CY = 210, R = 155, N = LABELS.length;
  const angles = LABELS.map((_,i) => (i * 2 * Math.PI / N) - Math.PI/2);

  function pt(lvl, i) {
    const ratio = lvl / 5;
    return [CX + ratio*R*Math.cos(angles[i]), CY + ratio*R*Math.sin(angles[i])];
  }

  function draw() {
    ctx.clearRect(0,0,W,W);

    // Grille
    for (let l=1; l<=5; l++) {
      ctx.beginPath();
      angles.forEach((_,i) => { const [x,y]=pt(l,i); i===0?ctx.moveTo(x,y):ctx.lineTo(x,y); });
      ctx.closePath();
      ctx.strokeStyle = l===5 ? 'rgba(0,0,0,0.12)' : 'rgba(0,0,0,0.06)';
      ctx.lineWidth = 1; ctx.stroke();
    }
    // Axes
    angles.forEach((_,i) => {
      const [x,y]=pt(5,i);
      ctx.beginPath(); ctx.moveTo(CX,CY); ctx.lineTo(x,y);
      ctx.strokeStyle='rgba(0,0,0,0.08)'; ctx.lineWidth=1; ctx.stroke();
    });
    // Labels
    ctx.font = '10px Inter, sans-serif';
    ctx.fillStyle = 'rgba(0,0,0,0.45)';
    LABELS.forEach((label,i) => {
      const lr = R + 22;
      const lx = CX + lr*Math.cos(angles[i]);
      const ly = CY + lr*Math.sin(angles[i]);
      ctx.textAlign = lx < CX-5 ? 'right' : lx > CX+5 ? 'left' : 'center';
      ctx.fillText(label, lx, ly+4);
    });
    // Polygones
    ROLES.forEach(role => {
      if (!visible[role.id]) return;
      const data = DATA[role.id];
      ctx.beginPath();
      data.forEach((lvl,i) => { const [x,y]=pt(lvl,i); i===0?ctx.moveTo(x,y):ctx.lineTo(x,y); });
      ctx.closePath();
      ctx.fillStyle = role.color + '22';
      ctx.strokeStyle = role.color;
      ctx.lineWidth = 2; ctx.fill(); ctx.stroke();
      data.forEach((lvl,i) => {
        const [x,y]=pt(lvl,i);
        ctx.beginPath(); ctx.arc(x,y,3,0,Math.PI*2);
        ctx.fillStyle=role.color; ctx.fill();
      });
    });
  }

  // Toggles
  const togglesEl = document.getElementById('radarToggles');
  ROLES.forEach(role => {
    const btn = document.createElement('span');
    btn.className = 'la-radar-toggle';
    btn.style.borderColor = role.color;
    btn.style.color = role.color;
    btn.innerHTML = `<span style="width:8px;height:8px;border-radius:50%;background:${role.color};flex-shrink:0"></span>${role.label}`;
    btn.addEventListener('click', () => {
      visible[role.id] = !visible[role.id];
      btn.classList.toggle('off', !visible[role.id]);
      draw();
    });
    togglesEl.appendChild(btn);
  });

  draw();
})();
</script>
{% endblock %}
HTMLEOF

echo "✅ overrides/home.html v2 — squad + radar + agents enrichis"

# ──────────────────────────────────────────────
# COMMIT & PUSH
# ──────────────────────────────────────────────
git add .
git commit -m "feat(landing): v2 — squad radar chart, avatars, agents chapeau + dialogue + fiches"
git push origin main

echo ""
echo "════════════════════════════════════════════════════════"
echo "  🎉 Landing v2 déployée"
echo "════════════════════════════════════════════════════════"
echo ""
echo "  📁 PROCHAINE ÉTAPE — copier les images :"
echo ""
echo "     cp /chemin/PO-Tech.png          docs/assets/images/avatars/po-tech.png"
echo "     cp /chemin/GenAI-FullStack.png  docs/assets/images/avatars/genai-fullstack.png"
echo "     cp /chemin/SRE-lead.png         docs/assets/images/avatars/sre-lead.png"
echo "     cp /chemin/SOC-Analyst.png      docs/assets/images/avatars/soc-analyst.png"
echo "     cp /chemin/LZ-Ops.png           docs/assets/images/avatars/lz-ops.png"
echo "     cp /chemin/agentic-luca.png     docs/assets/images/avatars/agentic-luca.png"
echo "     cp /chemin/agentic-astra.png    docs/assets/images/avatars/agentic-astra.png"
echo ""
echo "     git add docs/assets/images/avatars/"
echo '     git commit -m "assets: add avatar images"'
echo "     git push"
echo ""
echo "  👀 Local : python -m mkdocs serve → http://127.0.0.1:8000"
echo "  🌐 Live  : https://sylvain-e-chabi.github.io/LaA-docs/"
echo ""
