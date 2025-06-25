const LIGHT_DAMAGE = 3
const HEAVY_DAMAGE = 10
const HEAL = 8
const HEAVY_COST = 5
const HEAL_COST = 4

const lightSound = document.getElementById('light-sound')
const guardSound = document.getElementById('guard-sound')
const diceSound = document.getElementById('dice-sound')
const heavySound = document.getElementById('heavy-sound')
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

const limit = (val, min, max) => {
  return Math.max(min, Math.min(val, max))
}

export const light = (state) => {
  playSound(lightSound)
  let damage = state.enemy.guard ? Math.floor(LIGHT_DAMAGE / 2) : LIGHT_DAMAGE

  state.enemy.hp = limit(state.enemy.hp - damage, 0, state.enemy.maxHp)
  state.message = "light attack " + "<span class='enemy-effect'> -" + damage + " HP</span> " + "⚔️" + (state.enemy.guard ? "🛡️ " : "")
  return state
}

export const defense = (state) => {
  playSound(guardSound)
  state.player.guard = true
  state.message = "Player is guarding"

  return state
}

export const regen = (state) => {
  playSound(diceSound)
  const rand = Math.floor(Math.random() * 6) + 1
  state.player.mp = limit(state.player.mp += rand, 0, state.player.maxMp)
  state.message = "Player regen " + rand + " MP 🎲"

  return state
}

export const heavy = (state) => {
  playSound(heavySound)
  let damage = state.enemy.guard ? Math.floor(HEAVY_DAMAGE / 2) : HEAVY_DAMAGE

  state.player.mp -= HEAVY_COST
  state.enemy.hp = limit(state.enemy.hp -= damage, 0, state.enemy.maxHp)
  state.message = "heavy attack " + "<span class='enemy-effect'> -" + damage + " HP</span> " + "⚔️" + (state.enemy.guard ? "🛡️ " : "")

  return state
}

export const heal = (state) => {
  playSound(healthSound)
  console.log("its here!!")
  state.player.mp -= HEAL_COST
  state.player.hp = limit(state.player.hp += HEAL, 0, state.player.maxHp)
  state.message = "Player restore " + HEAL + " HP ➕"

  return state
}
