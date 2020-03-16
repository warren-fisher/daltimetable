import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

class ClassInfo extends React.Component {
  render() {
    return (
      <li id={this.props.info.crn}>CRN={this.props.info.crn} dept={this.props.info.department} name={this.props.info.name}</li>
    )
  }
}

class Search extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      classes: []
    }
  }

  handleChange(e) {
    let val = e.target.value;
    if (val !== "") {
      let resp = apiAction(val);
      resp.then(result => {
        if (result === null) {
          return
        }
        let cls = this.state.classes.slice();
        cls.push(result);
        console.log(result);
        this.setState({classes: cls})
      }).catch(() => {console.log("fail")})
    }
  }

  renderClass(d) {
    return (
      <ClassInfo info={d}/>
    )
  }

  render() {
    const data = this.state.classes
    return (
      <div id='main'>
      <input type='text' className='input' placeholder='Search...' onChange={this.handleChange}/>
      <div class="class">
        <ul>
          {data.map((d) => {
            return this.renderClass(d);
              }
            )
          }
        </ul>
      </div>
      </div>
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