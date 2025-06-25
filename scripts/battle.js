import { light, defense, regen, heavy, heal } from './playerAction.js'
import { theSlacker } from './theSlacker.js'
import { theOverthinker } from './theOverthinker.js'
import { theBurnout } from './theBurnout.js'
import { theAiWhisperer } from './theAiWhisperer.js'

const player = state.player
const enemy = state.enemy

const startSound = document.getElementById('start-sound')
const clickSound = document.getElementById('click-sound')
const home = document.getElementById('home')
const guide = document.getElementById('guide')
const record = document.getElementById('record')
const profile = document.getElementById('profile')

const playerName = document.getElementById('player-name')
const playerImg = document.getElementById('player-img')
const playerHealth = document.getElementById('player-hp')
const playerHpFill = document.getElementById('player-hp-fill')
const playerMagic = document.getElementById('player-mp')
const playerMpFill = document.getElementById('player-mp-fill')

const enemyName = document.getElementById('enemy-name')
const enemyImg = document.getElementById('enemy-img')
const enemyHealth = document.getElementById('enemy-hp')
const enemyHpFill = document.getElementById('enemy-hp-fill')

const control = document.getElementById('control')
const attack = document.getElementById('attack')
const guard = document.getElementById('guard')
const dice = document.getElementById('dice')
const skill = document.getElementById('skill')
const battleLog = document.getElementById('battle-log')

const playerTurn = (action) => {
  if (!state.turn || state.end) return

  switch (action) {
    case "light":
      state = light(state)
      break
    case "guard":
      state = defense(state)
      break
    case "regen":
      state = regen(state)
      break
    case "heavy":
      state = heavy(state)
      showControl()
      break
    case "heal":
      state = heal(state)
      showControl()
      break
  }
  logMessage(state.message)
  state.turns++
  state.turn = !state.turn
  updateDisplay()
  checkGameEnd()
  if (!state.end) setTimeout(enemyTurn, 2000)
}

const enemyTurn = () => {
  if (state.turn || state.end) return // not enemy's turn or game ended
  switch (enemy.name) {
    case "The slacker":
      state = theSlacker(state)
      break
    case "The overthinker":
      state = theOverthinker(state)
      break
    case "The burnout":
      state = theBurnout(state)
      break
    case "The AI whisperer":
      state = theAiWhisperer(state)
      break
  }
  logMessage(state.message)
  state.turn = !state.turn
  updateDisplay()
  checkGameEnd()
}

const logMessage = (message) => {
  const p = document.createElement("p")
  p.innerHTML = message
  p.className = state.turn ? "player-message" : "enemy-message"
  battleLog.prepend(p)
}

const updateDisplay = () => {
  guard.disabled = player.guard

  playerName.textContent = player.name
  playerImg.src = player.img
  playerImg.height = 200
  playerHealth.textContent = "HP: " + player.hp + "/" + player.maxHp
  const playerHpPercent = (player.hp / player.maxHp) * 100
  playerHpFill.style.width = playerHpPercent + "%"
  playerMagic.textContent = "MP: " + player.mp + "/" + player.maxMp
  const playerMpPercent = (player.mp / player.maxMp) * 100
  playerMpFill.style.width = playerMpPercent + "%"

  enemyName.textContent = enemy.name
  enemyImg.src = enemy.img
  enemyHealth.textContent = "HP: " + enemy.hp + "/" + enemy.maxHp
  const enemyHpPercent = (enemy.hp / enemy.maxHp) * 100
  enemyHpFill.style.width = enemyHpPercent + "%"

}

const checkGameEnd = () => {
  if (player.hp <= 0) {
    state.end = true
    state.victory = false
  } else if (enemy.hp <= 0) {
    state.end = true
    state.victory = true
  }

  if (state.end) {
    document.getElementById("result").value = state.victory ? "win" : "lose"
    document.getElementById("turns").value = state.turns
    setTimeout(() => document.getElementById("battle-form").submit(), 2000)
  }
}

const showSkill = () => {
  control.textContent = ""

  const heavy = document.createElement("button")
  heavy.innerHTML = "Heavy Attack <span class='mp-cost'>5</span>"
  heavy.disabled = (player.mp < player.heavyCost)
  heavy.addEventListener('click', () => playerTurn('heavy'))

  const heal = document.createElement("button")
  heal.innerHTML = "Heal <span class='mp-cost'>4</span>"
  heal.disabled = (player.mp < player.healCost)
  heal.addEventListener('click', () => playerTurn('heal'))

  const back = document.createElement("button")
  back.textContent = "back"
  back.addEventListener('click', showControl)

  control.append(heavy, heal, back)
}

const showControl = () => {
  control.textContent = ""
  control.append(attack, guard, dice, skill)
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

updateDisplay()
playSound(startSound)
attack.addEventListener('click', () => playerTurn('light'))
guard.addEventListener('click', () => playerTurn('guard'))
dice.addEventListener('click', () => playerTurn('regen'))
skill.addEventListener('click', showSkill)
home.addEventListener('click', () => playSound(clickSound, 'home.php'))
guide.addEventListener('click', () => playSound(clickSound, 'guide.php'))
record.addEventListener('click', () => playSound(clickSound, 'record.php'))
profile.addEventListener('click', () => playSound(clickSound, 'profile.php'))
