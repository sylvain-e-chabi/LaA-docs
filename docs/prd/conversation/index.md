---
title: Conversation L&A
description: Exemple de dialogue LUCA × ASTRA · Chat UI illustré
---
# Exemple de conversation L&A

Échange typique de Sylvain en mai 2026 — LUCA sur les données réelles, ASTRA sur la stratégie.

---

<div class="chat-demo">

<div class="chat-demo-header">
  <div class="status-dot"></div>
  <span class="app-name">L&A · Léa</span>
  <span style="color:#4a5470;font-size:.75rem;margin-left:auto">LUCA + ASTRA · en ligne</span>
</div>

<div class="chat-row user">
  <div class="chat-avatar user">S</div>
  <div>
    <div class="chat-label user">Sylvain</div>
    <div class="chat-bubble user">Combien vaut mon portefeuille aujourd'hui et combien ai-je vraiment gagné depuis le début ?</div>
  </div>
</div>

<div class="chat-row luca">
  <div class="chat-avatar luca">L</div>
  <div>
    <div class="chat-label luca">LUCA — Data & Passé</div>
    <div class="chat-bubble luca">
      Voici ton portefeuille au 22 mai 2026 :
      <table>
        <thead><tr><th>Métrique</th><th>Valeur</th></tr></thead>
        <tbody>
          <tr><td>Valeur totale</td><td><strong>12 285 USD</strong></td></tr>
          <tr><td>Capital investi</td><td>8 750 USD</td></tr>
          <tr><td>P&L absolu</td><td><span class="val-pos">+3 535 USD (+40,4%)</span></td></tr>
          <tr><td>Dividendes reçus YTD</td><td>+47 USD</td></tr>
          <tr><td>Meilleure position</td><td>NVDA <span class="val-pos">+127%</span></td></tr>
          <tr><td>Position en perte</td><td>AIL <span class="val-neg">−8,2%</span></td></tr>
        </tbody>
      </table>
      <br><em style="font-size:.72rem;color:#4a5470">Source : Saxo API · mis à jour il y a 2 min</em>
    </div>
  </div>
</div>

<div class="chat-row user">
  <div class="chat-avatar user">S</div>
  <div>
    <div class="chat-label user">Sylvain</div>
    <div class="chat-bubble user">Si je vends tout aujourd'hui, combien je touche net d'impôts ?</div>
  </div>
</div>

<div class="chat-row astra">
  <div class="chat-avatar astra">A</div>
  <div>
    <div class="chat-label astra">ASTRA — Stratégie & Futur</div>
    <div class="chat-bubble astra">
      Simulation cession totale — <strong>PFU sur plus-values uniquement</strong> :
      <table>
        <thead><tr><th>Ligne</th><th>Montant</th></tr></thead>
        <tbody>
          <tr><td>① Capital investi</td><td>8 750 USD</td></tr>
          <tr><td>② Versements futurs</td><td class="val-neu">— (vente totale)</td></tr>
          <tr><td>③ Plus-values latentes</td><td><span class="val-pos">+3 535 USD</span></td></tr>
          <tr><td><strong>Total brut</strong></td><td><strong>12 285 USD</strong></td></tr>
          <tr><td>PFU 30% × PV uniquement</td><td><span class="val-neg">−1 061 USD</span></td></tr>
          <tr><td><strong>Net perçu</strong></td><td><span class="val-pos"><strong>11 224 USD</strong></span></td></tr>
        </tbody>
      </table>
      <br>⚠️ Je déconseille de vendre. Projection réaliste déc. 2027 : <strong>~6 200 USD net</strong> — soit +38% vs vendre maintenant.
    </div>
  </div>
</div>

<div class="chat-row user">
  <div class="chat-avatar user">S</div>
  <div>
    <div class="chat-label user">Sylvain</div>
    <div class="chat-bubble user">Ok je ne vends pas. Qu'est-ce que j'achète ce mois-ci avec mes 500 € ?</div>
  </div>
</div>

<div class="chat-row astra">
  <div class="chat-avatar astra">A</div>
  <div>
    <div class="chat-label astra">ASTRA — Stratégie & Futur</div>
    <div class="chat-bubble astra">
      Ordre d'achat mai 2026 — <strong>500 €</strong> :
      <table>
        <thead><tr><th>Prio</th><th>Action</th><th>Montant</th><th>Rationale</th></tr></thead>
        <tbody>
          <tr><td>1️⃣</td><td><strong>Realty Income +3 parts</strong></td><td>~192 €</td><td>5,1% yield · mensuel</td></tr>
          <tr><td>2️⃣</td><td><strong>Allianz arrondi 1 part</strong></td><td>~249 €</td><td>3,2% · éligible PEA</td></tr>
          <tr><td>3️⃣</td><td>Cash buffer</td><td>~59 €</td><td>Réserve juin</td></tr>
        </tbody>
      </table>
      <br>⏰ Exécution : mardi ou mercredi · 16h30–17h30 Paris · limit order Allianz · market order Realty Income
    </div>
  </div>
</div>

</div>

---

!!! note "Règle d'affichage des agents"
    **LUCA** <span style="color:#00e5ff">●</span> — questions **factuelles / passé / données réelles**
    **ASTRA** <span style="color:#8b5cf6">●</span> — questions **stratégie / futur / recommandation**

    Le handoff entre agents est transparent pour l'utilisateur.
