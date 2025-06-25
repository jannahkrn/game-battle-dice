document.addEventListener('DOMContentLoaded', () => {
  const registerLink = document.querySelector('.register');
  const colors = ['#9b59b6', '#e74c3c', '#f1c40f', '#1abc9c', '#3498db', '#2ecc71'];
  let colorIndex = 0;

  setInterval(() => {
    registerLink.style.color = colors[colorIndex];
    registerLink.style.textShadow = `0 0 10px ${colors[colorIndex]}`;
    colorIndex = (colorIndex + 1) % colors.length;
  }, 500);
});
