import React from "react"
import PropTypes from "prop-types"
class MinesweeperBoard extends React.Component {

  render () {
    let minesweeper_board = this.props.minesweeper_board;
    let minesweeper_data = this.props.minesweeper_data;
    let items = [];
    for(let i=0;i<minesweeper_data.height;++i){
      let items_from_row = [(<th>{i+1}</th>)];
      for(let j=0;j<minesweeper_data.width;++j){
        items_from_row.push(<th> {minesweeper_board[i][j] == "empty" ? "🟩" : "💣"} </th>);
      }
      items.push(<tr>
        {items_from_row}  
      </tr>);
    }
    let firstRow = Array.from(Array(minesweeper_data.width)).map((val,i) => (<th>{i+1}</th>));
    return (
      <React.Fragment>
        <table >
          <thead>
            <tr>
              <th>#</th>
              {firstRow}
            </tr>
          </thead>
          <tbody>
           {items}
          </tbody>
        </table>
      </React.Fragment>
    );
  }
}

export default MinesweeperBoard
