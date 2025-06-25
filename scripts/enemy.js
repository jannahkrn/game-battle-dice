const enemies = document.querySelectorAll('input[name="enemy"]')
const enemyName = document.getElementById('enemy-name')
const enemyDesc = document.getElementById('enemy-desc')
const battleBtn = document.getElementById('battle-btn')
const clickSound = document.getElementById('click-sound')
const battleSound = document.getElementById('battle-sound')
const home = document.getElementById('home')
const guide = document.getElementById('guide')
const record = document.getElementById('record')
const profile = document.getElementById('profile')

enemies.forEach(enemy => {
  enemy.addEventListener('change', () => {
    const isUnlocked = enemy.dataset.unlocked
    enemyName.textContent = enemy.dataset.name
    if (isUnlocked) {
      enemyDesc.innerHTML = enemy.dataset.desc
    } else {
      enemyDesc.innerHTML = "-"
    }
    battleBtn.disabled = !isUnlocked;
  })
  enemy.addEventListener('click', () => playSound())
})

const playSound = (location) => {
  clickSound.currentTime = 0
  clickSound.play()
  if (location) {
    setTimeout(() => {
      window.location.href = location
    }, 300)
  }
}

home.addEventListener('click', () => playSound('home.php'))
guide.addEventListener('click', () => playSound('guide.php'))
record.addEventListener('click', () => playSound('record.php'))
profile.addEventListener('click', () => playSound('profile.php'))
battleBtn.addEventListener('click', () => {
  battleSound.currentTime = 0
  battleSound.play()
  setTimeout(() => {
    document.getElementById("enemy-form").submit()
  }, 300)
})

const enemyRadios = document.querySelectorAll('input[name="enemy"]');
const enemyLabels = document.querySelectorAll('.enemy-list label');

enemyRadios.forEach((radio, index) => {
  radio.addEventListener('change', () => {

    enemyLabels.forEach(label => label.classList.remove('selected-enemy'));


    enemyLabels[index].classList.add('selected-enemy');
  });
});
