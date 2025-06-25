const DAMAGE = 8

const messages = {
  attack: [
    "Shockingly, the world didn’t end. Yet.",
    "This probably doesn’t meet the standard, but here goes.",
    "Maybe this time I won’t hate myself for trying.",
    "There. I did something.",
    "It’s not perfect, but it’s out there. Which is terrifying.",
    "Well, I’ve made a decision. That’s one for the decade.",
    "I spoke. Time to relive it nightly forever.",
  ],
  guard: [
    "I don’t have imposter syndrome. I have evidence.",
    "Said nothing. Achieved peace and anxiety.",
    "Another chance passes. I watch it go.",
    "Let’s not ruin the silence with my ideas.",
    "Better unpublished than humiliated.",
    "It’s safer here in silence, even if it hurts.",
    "The idea was almost good enough. Almost.",
    "Nothing was said. A bold strategy.",
    "Why risk being wrong when I can stay invisible?",
  ]

}

const lightSound = document.getElementById('light-sound')
const guardSound = document.getElementById('guard-sound')

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

const attack = (state) => {
  playSound(lightSound)
  const player = state.player

  let damage = player.guard ? Math.floor(DAMAGE / 2) : DAMAGE
  player.hp = limit(player.hp - damage, 0, player.maxHp)
  state.message = randomMessage(messages.attack) + " <span class='player-effect'> -" + damage + " HP</span> " + (player.guard ? "🛡️ " : "")
  player.guard = false
  state.enemy.guard = false
  state.player = player

  return state
}

const guard = (state) => {
  playSound(guardSound)
  state.enemy.guard = true
  state.message = randomMessage(messages.guard) + "🛡️"
  state.player.guard = false
  return state
}

export const theOverthinker = (state) => {
  const hpRatio = state.enemy.hp / state.enemy.maxHp;
  const rand = Math.random();
  let guardChance

  if (hpRatio > 0.66) {
    guardChance = 0.8
  } else if (hpRatio > 0.33) {
    guardChance = 0.6
  } else {
    guardChance = 0.3
  }

  if (rand < guardChance) {
    return guard(state)
  } else {
    return attack(state)
  }
}
