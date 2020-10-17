/*let board = [
  ['','',''],
  ['','',''],
  ['','','']
]*/

let cols = 3;
let rows = cols;

let board = [];

let players = ['X','O'];

let currentPlayer;
let available = [];

function setup() {
  createCanvas(400, 400);
  frameRate(30);
  createBoard();
  currentPlayer = floor(random(players.length));
  for (let j = 0; j<rows ; j++) {
    for (let i = 0; i<cols ; i++) {
      available.push([i,j]);
    }
  }
}

function createBoard() {
  for (let j = 0; j<cols ; j++) {
    for (let i = 0; i<rows ; i++) {
      if(typeof(board[j]) == 'undefined') {
        board[j] = [];
      }
      board[j][i] = '';
    }
  }
}

function eq3(a,b,c) {
  return (a==b && b==c && a!='');
}

function checkWinner() {
  let winner = null;
  
  // check horizontal
  for(let i = 0; i<cols; i++) {
    if(eq3(board[i][0],board[i][1],board[i][2])) {
      winner = board[i][0];
    }
  }
  // check vertical
  for(let i = 0; i<rows; i++) {
    if(eq3(board[0][i],board[1][i],board[2][i])) {
      winner = board[0][i];
    }
  }
  // check diagonal
  if(eq3(board[0][0],board[1][1],board[2][2])) {
      winner = board[0][0];
  }
  if(eq3(board[2][0],board[1][1],board[0][2])) {
      winner = board[2][0];
  }
  
  if(winner == null && available.length == 0) {
    return 'tie';
  } else {
    return winner;
  }
}

function nextTurn() {
  let index = floor(random(available.length));
  let spot = available.splice(index,1)[0];
  let i = spot[0];
  let j = spot[1];
  board[i][j] = players[currentPlayer];
  currentPlayer = (currentPlayer+1)%players.length;
  
}

function draw() {
  background(255);
  let w = width / cols;
  let h = height / rows;
  strokeWeight(4);
  
  //vertical lines
  for(let i = cols-1 ; i>0 ; i--) {
    line(w*i,0,w*i,height);
  }
  //horizontal lines
  for(let i = cols-1 ; i>0 ; i--) {
    line(0,h*i,width,h*i);
  }
  
  for (let j = 0; j<cols ; j++) {
    for (let i = 0; i<rows ; i++) {
      let x = w * i + w/2;
      let y = h * j + h/2;
      let spot = board[i][j];
      textSize(32);
      let r = w/4;
      if(spot == players[1]) {
        noFill();
        ellipse(x, y, r * 2);
      } else if(spot == players[0]) {
        line(x-r,y-r,x+r,y+r);
        line(x+r,y-r,x-r,y+r);
      }
    }
  }
  
  let result = checkWinner();
  if(result != null) {
    noLoop();
    let resultP = createP('');
    resultP.style('font-size','32pt');
    if(result == 'tie') {
      resultP.html('Tie!');
    } else {
      resultP.html(`${result} wins!`)
    }
  }else {
    nextTurn();
  }
}