const messages = [
  "Ah, " + username + "... Late to class *and* to the game. Classic.",
  "Welcome, " + username + ". We weren't sure if you'd show up, but here you are—barely.",
  username + ", finally logged in. Did you copy your password from ChatGPT too?",
  "Hey " + username + "! Sit wherever. Not like you’ll be paying attention anyway.",
  "Wow, " + username + " joined the game! Let’s all pretend that means something.",
  username + ", your attendance has been marked. We’re just as surprised as you are.",
  "Greetings, " + username + ". Your GPA is safe—this game doesn’t count.",
  "Welcome back, " + username + ". We thought you dropped out.",
  username + ", we saved your seat right next to The Slacker. Good luck with that.",
  "Oh look, it’s " + username + ". Here to procrastinate *responsibly*, I see.",
  "Hi " + username + ". You’ve got that 'I didn’t read the instructions' look. Perfect.",
  "Welcome, " + username + ". If you’re here to win, you're definitely in the wrong class.",
  username + ", you're just in time to turn in your homework—two weeks late.",
  "Brace yourself, " + username + ". The AI Whisperer already hates you.",
  "Welcome, " + username + ". The game adapts to your skill level—so it's in tutorial mode forever."
]

const welcomeMessage = document.getElementById('welcome-message')
const randomIndex = Math.floor(Math.random() * messages.length)
welcomeMessage.textContent = messages[randomIndex]

const clickSound = document.getElementById("click-sound")
const play = document.getElementById("play")
const home = document.getElementById('home')
const guide = document.getElementById('guide')
const record = document.getElementById('record')
const profile = document.getElementById('profile')

const playSound = (location) => {
  clickSound.currentTime = 0
  clickSound.play()
  setTimeout(() => {
    window.location.href = location
  }, 300)
}

play.addEventListener('click', () => playSound('enemy.php'))
home.addEventListener('click', () => playSound('home.php'))
guide.addEventListener('click', () => playSound('guide.php'))
record.addEventListener('click', () => playSound('record.php'))
profile.addEventListener('click', () => playSound('profile.php'))
