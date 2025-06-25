const DAMAGE = 5

const messages = {
  skip: [
    "The Slacker zones out.",
    "Nope. Not today.",
    "Turn skipped—too much effort.",
    "Still loading motivation...",
    "The Slacker does nothing. Again.",
    "Skipped. Like their classes.",
    "Action? Never heard of it.",
    "They blink. That’s it.",
    "Paused by apathy.",
    "Productivity: 0. Turn: gone.",
  ],
  attack: [
    "Miracle alert: The Slacker lifts a finger.",
    "Effort detected. World ending soon?",
    "Against all odds, The Slacker does something.",
    "Look out—The Slacker found the ‘do’ button.",
    "Attack launched. Motivation still MIA.",
    "A rare burst of minimal effort!",
    "They try. It's... something.",
    "The Slacker attacks! Barely.",
  ]
}

const lightSound = document.getElementById('light-sound')
const skipSound = document.getElementById('skip-sound')

const randomMessage = (messages) => {
  const randomIndex = Math.floor(Math.random() * messages.length)
  return messages[randomIndex]
}

const limit = (val, min, max) => {
  return Math.max(min, Math.min(val, max))
}

const playSound = (sound, location) => {
  sound.currentTime = 0
  sound.play()
  if (location) {
    setTimeout(() => {
      window.location.href = location
    }, 300)
  }
}

const attack = (state) => {
  playSound(lightSound)
  const player = state.player

  let damage = player.guard ? Math.floor(DAMAGE / 2) : DAMAGE
  player.hp = limit(player.hp - damage, 0, player.maxHp)
  state.message = randomMessage(messages.attack) + " <span class='player-effect'> -" + damage + " HP</span> " + (player.guard ? "🛡️ " : "")
  player.guard = false
  state.player = player

  return state
}

const skip = (state) => {
  playSound(skipSound)
  state.player.guard = false
  state.message = randomMessage(messages.skip) + "😴"

  return state
}

export const theSlacker = (state) => {
  const hpRatio = state.enemy.hp / state.enemy.maxHp;
  const rand = Math.random();

  if (hpRatio <= 0.33 || rand >= 0.5) {
    return attack(state);
  } else {
    return skip(state);
  }
}
