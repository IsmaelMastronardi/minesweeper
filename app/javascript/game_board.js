document.addEventListener('turbo:load', () => {
  const squares = document.querySelectorAll('.boardSquare');
  const resetBtn = document.getElementById('reset_btn');
  const showBtn = document.getElementById('show_btn');
  const game_over_display = document.getElementById('game_over');
  let gameLost = false;
  if (!game_over_display) return;
  const changeDisplayedValue = (el) => {
    if(el.dataset.bomb === 'true'){
      el.innerHTML = '<span>💣</span>';
    }
    else {
      el.innerHTML = `<span>${el.dataset.attachedBombs}</span>`;
    }
  }
  
  const showGameOver = (el) => {
    if(el.dataset.bomb === 'true'){
      game_over_display.innerText = 'You Lost.'
      game_over_display.classList.remove('hidden');
      game_over_display.classList.add('alert-danger');
    }
  }
  
  squares.forEach(square => {
    square.addEventListener('click', function() {
      if (gameLost) return;
      const isRevealed = this.dataset.revealed === 'true';
      if (!isRevealed) {
        this.dataset.revealed = 'true';
        changeDisplayedValue(this);
        showGameOver(this);
      }
    });
  });
  
  resetBtn.addEventListener('click', function(){
    squares.forEach(square => {
      square.dataset.revealed = 'false'
      square.innerHTML = '<span>⬜</span>'
    })
    const game_over_display = document.getElementById('game_over');
    game_over_display.classList.add('hidden');
    game_over_display.classList.remove('alert-danger');
  });
  
  showBtn.addEventListener('click', function(){
    squares.forEach(square => {
      square.dataset.revealed = 'true'
      changeDisplayedValue(square)
    })
  });
});
