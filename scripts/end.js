const messages = {
  victory: [
    "Victory! Somehow, you pulled it off.",
    "Well, that went better than expected.",
    "You win. No one’s more surprised than us.",
    "Success! Your questionable tactics paid off.",
    "You survived. And that counts for something.",
    "You win! Now try doing that in real life.",
    "Battle won. Ego inflated.",
    "Victory! Enjoy it before imposter syndrome kicks in.",
    "A stunning triumph… relatively speaking.",
    "You proved that trying is, occasionally, worth it.",
    "The enemy has been defeated. Confidence +1.",
    "Congrats! Your keyboard mashing was effective."
  ],
  defeat: [
    "Defeat. But you gave it a solid… effort?",
    "You lost. Blame the system, not yourself.",
    "That went poorly. Let’s never talk about it again.",
    "You tried. That’s what matters. Allegedly.",
    "Defeated. Maybe it’s time to read the tutorial.",
    "Failure is the first step… or something.",
    "Game over. Reality isn't much easier either.",
    "Better luck next existential crisis.",
    "You lost. The universe remains unimpressed.",
    "That was a mess. But at least it’s over.",
    "Don’t worry. Everyone fails. You just did it louder.",
    "You’ve been metaphorically graded: F."
  ]
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

const clickSound = document.getElementById('click-sound')
const victorySound = document.getElementById('victory-sound')
const defeatSound = document.getElementById('defeat-sound')
const endMessage = document.getElementById('end-message')
const continueBtn = document.getElementById('continue')

if (result == "win") {
  playSound(victorySound)
  const randomIndex = Math.floor(Math.random() * messages.victory.length)
  endMessage.textContent = messages.victory[randomIndex]
} else {
  playSound(defeatSound)
  const randomIndex = Math.floor(Math.random() * messages.defeat.length)
  endMessage.textContent = messages.defeat[randomIndex]
}

continueBtn.addEventListener('click', () => playSound(clickSound, 'enemy.php'))
