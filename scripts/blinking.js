document.addEventListener('DOMContentLoaded', () => {
  const duration = 1000;
  const startTime = Date.now();

  function randomInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  function wrapLetters(element) {
    const text = element.textContent;
    element.textContent = '';
    for (let char of text) {
      const span = document.createElement('span');
      span.textContent = char;
      element.appendChild(span);
    }
  }

  function blinkLetter(letter) {
    if (Date.now() - startTime > duration) {
      letter.style.visibility = 'visible';
      return;
    }
    letter.style.visibility = (letter.style.visibility === 'hidden') ? 'visible' : 'hidden';
    setTimeout(() => blinkLetter(letter), randomInterval(100, 400));
  }

  const titles = document.querySelectorAll('.title');
  titles.forEach(title => {
    wrapLetters(title);
    const letters = title.querySelectorAll('span');
    letters.forEach(letter => {
      setTimeout(() => blinkLetter(letter), randomInterval(0, 400));
    });
  });
});
