class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;

    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on('click', "li" , (event) => {
      const $square = $(event.currentTarget);
      this.makeMove($square);
    });
  }

  makeMove($square) {
    const pos = $square.data("pos");
    try {
      this.game.playMove(pos)
    }
    catch(err) {
      alert("Invalid move.");
      return;
    }
    $square.text(`${this.game.currentPlayer}`);
    $square.unbind('mouseenter mouseleave')
    $square.css('background', 'white');
    $square.css('font-size', '150px');
    $square.css('display', 'flex');
    $square.css('justify-content', 'center');
    $square.css('align-items', 'center');
  }
  
  setupBoard() {
    let $ul = $('<ul></ul>');
    this.$el.append($ul)
    for (let i = 0; i < 9; i++) {
      let $li = $('<li></li>');
      $li.data("pos", [Math.floor(i / 3), (i % 3)]);
      $li.addClass('unclicked')
      $ul.append($li);
      console.log($li.data("pos"));
      
    }
    $ul.css('display', 'flex');
    $ul.css('flex-wrap', 'wrap');
    $ul.css('width', '606px');
    
    let $lis = $('li');
    $lis.css('background-color', 'grey');
    $lis.css('display', 'inline-block');
    $lis.css('width', '200px');
    $lis.css('height', '200px');
    $lis.css('border', '1px solid black');
    $lis.addClass('square');

    let $unclicked = $('.unclicked');
    $unclicked.hover(function () {
      $(this).css("background-color", "gold");
    }, function () {
      $(this).css("background-color", "grey");
      });
  }

}

module.exports = View;
