import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

class Search extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(e) {
    let val = e.target.value;
    if (val !== "") {
      let resp = apiAction(val);
      resp.then(result => {
        console.log(result);
      }).catch(() => {console.log("fail")})
    }
  }

  render() {
    return (
      <input type='text' className='input' placeholder='Search...' onChange={this.handleChange}/>
    )
  }
}

ReactDOM.render(
    <Search />,
    document.getElementById('root')
);


async function apiAction(crn) {
  const response = await fetch(`http://localhost:5000/api/crn/${crn}`, {
    method: 'GET',
  });
  return await response.json();
}