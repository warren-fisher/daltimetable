import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';


function Square(props) {
    return (
        <button
        className="square"
        onClick={() => props.onClick()}>
            {props.value}
        </button>
        );
    }

class Board extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            squares: Array(9).fill(null),
            xNext: true,
        }
    }

    handleClick(i) {
        const squares = this.state.squares.slice();
        let xNext = this.state.xNext
        if (xNext === true) {
            squares[i] = 'X';
        } else {
            squares[i] = 'O';
        }
        this.setState({squares: squares,
            xNext: !xNext,
        })
    }

    renderSquare(i) {
      return <Square value={this.state.squares[i]}
                onClick={() => this.handleClick(i)} />;
    }
  
    render() {
      const winner = calculateWinner(this.state.squares);
      let status;

      if (winner) {
          status = 'The winner is: ' + winner;
      } else {
          status = 'Next player: ' + (this.state.xNext ? 'X' : 'O');
      }

      return (
        <div>
          <div className="status">{status}</div>
          <div className="board-row">
            {this.renderSquare(0)}
            {this.renderSquare(1)}
            {this.renderSquare(2)}
          </div>
          <div className="board-row">
            {this.renderSquare(3)}
            {this.renderSquare(4)}
            {this.renderSquare(5)}
          </div>
          <div className="board-row">
            {this.renderSquare(6)}
            {this.renderSquare(7)}
            {this.renderSquare(8)}
          </div>
        </div>
      );
    }
  }
  
class Game extends React.Component {
  render() {
    return (
      <div className="game">
        <button type="submit" onClick={() => apiAction()}>Search</button>
        <div className="game-board">
          <Board />
        </div>
        <div className="game-info">
          <div>{/* status */}</div>
          <ol>{/* TODO */}</ol>
        </div>
      </div>
    );
  }
}

ReactDOM.render(
    <Game />,
    document.getElementById('root')
);


async function apiAction() {
  const response = await fetch('http://localhost:5000/api/test/2000', {
    method: 'GET',
  });
  const myjson = await response.json();
  console.log(myjson);
}

function calculateWinner(squares) {
    const lines = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
      ];
    
    for (let i = 0; i < lines.length; i++) {
        const [a, b, c] = lines[i];

        if (squares[a] && squares[a] === squares[b] && squares[a] === squares[c]) {
            return squares[a];
        }
    }
    return null;
}
  