// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.querySelectorAll('.boardSquare').forEach(square => {
  square.addEventListener('click', function() {
    console.log('aaa')
    const isRevealed = this.dataset.revealed === 'true';

    if (!isRevealed) {
      this.dataset.revealed = 'true';
      console.log(this.dataset.bomb)
      if(this.dataset.bomb === 'true'){
        this.innerHTML = '<span>💣</span>';
      }
      else {
        this.innerHTML = `<span>${this.dataset.attachedBombs}</span>`;
      }

    }
  });
});