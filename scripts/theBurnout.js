const DAMAGE = 6
const DRAIN_ATTACK = 4
const DRAIN_MP = 3

const messages = {
  attack: [
    "Running on fumes. Swinging on autopilot.",
    "No thoughts, just reflexes and regret.",
    "Don’t ask how. I don’t know either.",
    "Let’s pretend that looked intentional.",
    "Adrenaline kicked in. It’s on its own now.",
    "Brain checked out. Body did... something.",
    "That’s all I had. Don’t expect more.",
    "Acted. Emotion not included.",
    "Muscle memory’s the only memory left.",
    "Performance: 2/10. But at least it's done.",
  ],
  drain: [
    "If I’m going down, I’m taking you with me.",
    "We suffer together. That’s the deal.",
    "Pain’s a team effort, right?",
    "Feel that? That’s your energy bleeding too.",
    "I moved. You paid. Fair trade.",
    "Your health for my effort. Sounds toxic.",
    "Let’s both regret this later.",
    "I’m broken. You’re funding it.",
    "We’re burning out so well together.",
  ],
  skip: [
    "System overload. Rebooting... never.",
    "Skipped. Like sleep. Again.",
    "Nope. Not even pretending today.",
    "Can’t. Don’t ask. Don’t look.",
    "Functionality unavailable. Please try again later.",
    "Just let me rest for five—okay, forever.",
    "Nothing left to give. Not even sarcasm.",
    "Current status: horizontal in spirit.",
    "Skipped. Because burnout means it.",
  ],
}

const lightSound = document.getElementById('light-sound')
const drainSound = document.getElementById('drain-sound')
const skipSound = document.getElementById('skip-sound')

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

const drain = (state) => {
  playSound(drainSound)
  const player = state.player

  let damage = player.guard ? Math.floor(DRAIN_ATTACK / 2) : DRAIN_ATTACK
  player.hp = limit(player.hp - damage, 0, player.maxHp)
  player.mp = limit(player.mp - DRAIN_MP, 0, player.maxMp)
  state.message = randomMessage(messages.drain) + " <span class='player-effect'> -" + damage + " HP -" + DRAIN_MP + " MP</span> " + (player.guard ? "🛡️ " : "")
  player.guard = false
  state.enemy.guard = false
  state.player = player

  return state
}

const skip = (state) => {
  playSound(skipSound)
  state.player.guard = false
  state.message = randomMessage(messages.skip) + "😴"

  return state
}

export const theBurnout = (state) => {
  const hpRatio = state.enemy.hp / state.enemy.maxHp;
  const rand = Math.random();
  let drainChance, attackChance;

  if (hpRatio > 0.66) {
    attackChance = 0.45;
    drainChance = 0.3;
  } else if (hpRatio > 0.33) {
    attackChance = 0.55;
    drainChance = 0.3;
  } else {
    attackChance = 0.65;
    drainChance = 0.2;
  }

  if (rand < drainChance) {
    return drain(state);
  } else if (rand < drainChance + attackChance) {
    return attack(state);
  } else {
    return skip(state);
  }
}
