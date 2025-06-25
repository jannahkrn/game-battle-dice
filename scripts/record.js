const clickSound = document.getElementById("click-sound")
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

home.addEventListener('click', () => playSound('home.php'))
guide.addEventListener('click', () => playSound('guide.php'))
record.addEventListener('click', () => playSound('record.php'))
profile.addEventListener('click', () => playSound('profile.php'))
