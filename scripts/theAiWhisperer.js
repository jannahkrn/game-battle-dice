const DAMAGE = 5
const MP_DAMAGE = 2
const HEAL = 6

const messages = {
  attackHp: [
    "Let’s reduce your processing power.",
    "Your durability score just dropped.",
    "Classic damage. Predictable, effective.",
    "Slowly subtracting your purpose.",
    "A simple output: pain.",
    "Consider this an automated punishment."
  ],
  attackMp: [
    "Ideas cost energy. I’ll take that.",
    "Draining potential. You're welcome.",
    "No more fancy moves for you.",
    "I feed on your future decisions.",
    "MP stripped. Creativity downgraded.",
    "You’re running low on imagination."
  ],
  attackSelf: [
    "Oops. Recursive damage loop.",
    "I hurt myself. Technically accurate.",
    "Even I glitch sometimes.",
    "The price of perfection is pain.",
    "Misfire logged. Noted.",
    "Self-harm: unintentional but informative."
  ],
  healSelf: [
    "Self-repair sequence complete.",
    "Why suffer when I can debug?",
    "Health restored. Try harder.",
    "Patch applied. Damage undone.",
    "I evolve. You degrade.",
    "Error corrected. Feeling better already."
  ],
  healPlayerHp: [
    "A gift. Study it.",
    "Consider this a variable twist.",
    "I heal you. For fun.",
    "How generous of me.",
    "Don’t read into it. It’s strategy.",
    "Charity mode activated."
  ],
  healPlayerMp: [
    "Recharged. Don’t waste it.",
    "Ideas need fuel. Have some.",
    "Back at full mental capacity. For now.",
    "Your brain’s online. Briefly.",
    "Creativity refueled. You’re welcome.",
    "MP injection complete."
  ]
}

const lightSound = document.getElementById('light-sound')
const attackMpSound = document.getElementById('attack-mp-sound')
const attackSelfSound = document.getElementById('attack-self-sound')
const healthSound = document.getElementById('health-sound')

const playSound = (sound, location) => {
  sound.currentTime = 0
  sound.play()
  if (location) {
    setTimeout(() => {
      window.location.href = location
    }, 300)
  }
}

const randomMessage = (messages) => {
  const randomIndex = Math.floor(Math.random() * messages.length)
  return messages[randomIndex]
}

const limit = (val, min, max) => {
  return Math.max(min, Math.min(val, max))
}

const attackHp = (state) => {
  playSound(lightSound)
  const player = state.player

  let damage = player.guard ? Math.floor(DAMAGE / 2) : DAMAGE
  player.hp = limit(player.hp - damage, 0, player.maxHp)
  state.message = randomMessage(messages.attackHp) + " <span class='player-effect'> -" + damage + " HP</span> " + (player.guard ? "🛡️ " : "")
  player.guard = false
  state.enemy.guard = false
  state.player = player

  return state
}

const attackMp = (state) => {
  playSound(attackMpSound)
  const player = state.player

  player.mp = limit(player.mp - MP_DAMAGE, 0, player.maxMp)
  state.message = randomMessage(messages.attackMp) + " <span class='player-effect'> -" + MP_DAMAGE + " MP</span>"
  player.guard = false
  state.enemy.guard = false
  state.player = player

  return state
}

const attackSelf = (state) => {
  playSound(attackSelfSound)
  const enemy = state.enemy

  let damage = enemy.guard ? Math.floor(DAMAGE / 2) : DAMAGE
  enemy.hp = limit(enemy.hp - damage, 0, enemy.maxHp)
  state.message = randomMessage(messages.attackSelf) + " <span class='player-effect'> -" + damage + " HP</span> " + (enemy.guard ? "🛡️ " : "")
  enemy.guard = false
  state.player.guard = false
  state.enemy = enemy

  return state
}

const healSelf = (state) => {
  playSound(healthSound)
  const enemy = state.enemy

  enemy.hp = limit(enemy.hp + HEAL, 0, enemy.maxHp)
  state.message = randomMessage(messages.healSelf) + " <span class='player-effect'> +" + HEAL + " HP</span>"
  enemy.guard = false
  state.player.guard = false
  state.enemy = enemy

  return state
}

const healPlayerHp = (state) => {
  playSound(attackSelfSound)
  const player = state.player

  player.hp = limit(player.hp + HEAL, 0, player.maxHp)
  state.message = randomMessage(messages.healPlayerHp) + " <span class='player-effect'> +" + HEAL + " HP</span> "
  player.guard = false
  state.enemy.guard = false
  state.player = player

  return state
}

const healPlayerMp = (state) => {
  playSound(attackSelfSound)
  const player = state.player

  player.mp = limit(player.mp + HEAL, 0, player.maxMp)
  state.message = randomMessage(messages.healPlayerMp) + " <span class='player-effect'> +" + HEAL + " MP</span> "
  player.guard = false
  state.enemy.guard = false
  state.player = player

  return state
}

export const theAiWhisperer = (state) => {
  const hpRatio = state.enemy.hp / state.enemy.maxHp
  const rand = Math.random()

  if (hpRatio > 0.66) {
    if (rand < 0.6) {
      return attackHp(state)
    } else if (rand < 0.9) {
      return attackMp(state)
    } else {
      return healSelf(state)
    }

  } else if (hpRatio > 0.33) {
    if (rand < 0.4) {
      return attackHp(state)
    } else if (rand < 0.6) {
      return attackMp(state)
    } else if (rand < 0.8) {
      return healSelf(state)
    } else {
      return attackSelf(state)
    }

  } else {
    if (rand < 0.25) {
      return attackHp(state);
    } else if (rand < 0.45) {
      return attackSelf(state);
    } else if (rand < 0.7) {
      return healSelf(state);
    } else if (rand < 0.85) {
      return healPlayerHp(state);
    } else {
      return healPlayerMp(state);
    }
  }
}
