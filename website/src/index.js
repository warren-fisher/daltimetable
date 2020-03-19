import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

class ClassInfo extends React.Component {
  renderClass(d) {
    return <div class="class_" id={d.crn}>CRN={d.crn} dept={d.department} name={d.name}</div>
  }

  render() {
    const data = this.props.results;
    return (
      data.map((d) => {
        return this.renderClass(d);
      })
    )
  }
}

class SearchState extends React.Component {
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
      let resp = this.getSearch(val);
      resp.then(result => {
        if (result === null) {
          return
        }
        let cls = []
        let keys = Object.keys(result)
        for (const name of keys) {
          cls.push(result[name]);
        }
        this.setState({classes: cls})
      }).catch(() => {console.log("fail")})
    }
  }

  async getSearch(search) {
    const response = await fetch(`http://localhost:5000/api/search/${search}`, {
      method: 'GET',
    });
    return await response.json();
  }

  render() {
    const data = this.state.classes
    return (
      <div id='main'>
      <form>
        <label for="string-search">Search by class for name</label>
        <input type='text' id="string-search" name="string-search" placeholder='Search...' onChange={this.handleChange}/>

        <label for="time">Search by class within time slot</label>
        <div id="time">
          <input type='text' id='time-start' name='time-start' placeholder='start time'/>
          <input type='text' id='time-end' name='time-end' placeholder='end time'/>
        </div>
      </form>
      <div class="all-classes">
        <ClassInfo results={data}/>
      </div>
      </div>
    )
  }
}

ReactDOM.render(
    <SearchState />,
    document.getElementById('root')
);


// async function apiAction(crn) {
//   const response = await fetch(`http://localhost:5000/api/crn/${crn}`, {
//     method: 'GET',
//   });
//   return await response.json();
// }