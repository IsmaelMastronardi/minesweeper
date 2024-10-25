// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const squares = document.querySelectorAll('.boardSquare')
squares.forEach(square => {
  const game_over_display = document.getElementById('game_over')
  let gameLost = false;
  square.addEventListener('click', function() {
    if (gameLost) return;
    const isRevealed = this.dataset.revealed === 'true';
    if (!isRevealed) {
      this.dataset.revealed = 'true';
      if(this.dataset.bomb === 'true'){
        this.innerHTML = '<span>💣</span>';
        game_over_display.innerText = 'You Lost.'
        game_over_display.classList.remove('hidden');
        game_over_display.classList.add('alert-danger')
      }
      else {
        this.innerHTML = `<span>${this.dataset.attachedBombs}</span>`;
      }
    }
  });
});

const reset = document.getElementById('reset_btn')

reset.addEventListener('click', function(){
  console.log('dsa')
  squares.forEach(square => {
    square.dataset.revealed = 'false'
    square.innerHTML = '<span>⬜</span>'
  })
  const game_over_display = document.getElementById('game_over');
  game_over_display.classList.add('hidden');
  game_over_display.classList.remove('alert-danger');
});
