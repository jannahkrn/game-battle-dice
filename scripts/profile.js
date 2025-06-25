
const home = document.getElementById('home')
const guide = document.getElementById('guide')
const record = document.getElementById('record')
const profile = document.getElementById('profile')
const deleteBtn = document.getElementById('delete')
const saveBtn = document.getElementById('saveBtn')
const thanks = document.getElementById('thanks')
const logout = document.getElementById('logout')
const editBtn = document.getElementById("editBtn");
const closeEdit = document.getElementById("closeEdit");
const openAvatarPopup = document.getElementById("openAvatarPopup");
const closeAvatar = document.getElementById("closeAvatar");
const avatarInput = document.getElementById("selectedAvatar");
const avatarPreview = document.getElementById("avatarPreview");
const editModal = document.getElementById("editModal");
const avatarPopup = document.getElementById("avatarPopup");
const clickSound = document.getElementById("clickSound");
const hoverSound = document.getElementById("hoverSound");

let soundEnabled = false;


window.addEventListener("click", () => {
  soundEnabled = true;
});


const playSound = (location) => {
  clickSound.currentTime = 0;
  clickSound.play();
  if (location) {
    setTimeout(() => {
      window.location.href = location;
    }, 300);
  }
};


home.addEventListener('click', () => playSound('home.php'))
guide.addEventListener('click', () => playSound('guide.php'))
record.addEventListener('click', () => playSound('record.php'))
profile.addEventListener('click', () => playSound('profile.php'))
thanks.addEventListener('click', () => playSound('thanks.php'))
logout.addEventListener('click', () => playSound('logout.php'))
deleteBtn.addEventListener('click', () => playSound())
editBtn.addEventListener('click', () => playSound())
saveBtn.addEventListener('click', () => {
  clickSound.currentTime = 0;
  clickSound.play();
})


editBtn.onclick = () => {
  editModal.style.display = "block";
};

closeEdit.onclick = () => {
  editModal.style.display = "none";
};

const content = document.querySelector("#editModal .modal-content");
content.style.animation = 'none';
content.offsetHeight;
content.style.animation = null;


openAvatarPopup.onclick = () => {
  avatarPopup.style.display = "block";
};

closeAvatar.onclick = () => {
  avatarPopup.style.display = "none";
};


const avatarOptions = document.querySelectorAll(".avatar-option")
avatarOptions.forEach(img => {
  img.addEventListener("click", () => {
    const file = img.getAttribute("data-file");
    const path = "characterpics/" + file;
    avatarInput.value = path;
    avatarPreview.src = path;
    avatarPopup.style.display = "none";

    clickSound.currentTime = 0;
    clickSound.play().catch(e => console.warn("Audio play blocked:", e));
  });

  img.addEventListener("mouseenter", () => {
    if (soundEnabled && hoverSound) {
      hoverSound.currentTime = 0;
      hoverSound.play().catch(e => console.log("Playback blocked:", e));
    }
  });
});


window.onclick = function (event) {
  if (event.target == editModal) {
    editModal.style.display = "none";
  }
  if (event.target == avatarPopup) {
    avatarPopup.style.display = "none";
  }
};

const togglePassword = (id) => {
  const passwordInput = document.getElementById(id);
  passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password';
}
