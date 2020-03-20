import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

class ClassInfo extends React.Component {
  renderClass(d) {
    return <div class="class_" id={d.crn}>CRN={d.crn} dept={d.department} name={d.name} start={d.start_time} end={d.end_time}</div>
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

  apiResponseState(result) {
    let cls = []
    if (result === null) {
      console.log("no results");
    }
    let keys = Object.keys(result)
    for (const name of keys) {
      cls.push(result[name]);
    }
    this.setState({classes: cls})
  }

  stringSearch(val) {
    if (val !== "") {
      let resp = this.getSearch(val);
      resp.then(result => {
        this.apiResponseState(result);
      }).catch(() => {console.log("fail")})
    }
  }

  timeSearch() {
    // const start = this.state.time-start;
    // const end = this.state.time-end;
    const start = 1;
    const end = 12;

    let resp = this.getTime(start, end);
    resp.then(result => {
      this.apiResponseState(result);
    }).catch(() => {console.log("fail")})
  }

  handleChange(e) {
    const target = e.target;
    const name = target.name;
    const val = target.value;
    this.setState({[name]: val});

    console.log(name, val);
    console.log(this.state);

    if (name=="string-search") {
      let str_cls = this.stringSearch(val);
    } else if (name=='time-start' || name=='time-end') {
      this.timeSearch();
    }
  }

  async getTime(start, end) {
    const response = await fetch(`http://localhost:5000/api/time/${start}/${end}`, {
      method: 'GET',
    });
    return await response.json();
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
        <input type='text' id="string-search" name="string-search" placeholder='Search...' onChange={this.handleChange} value={this.state.value}/>

        <label for="time">Search by class within time slot</label>
        <div id="time">
          <input type='text' id='time-start' name='time-start' placeholder='start time' onChange={this.handleChange} value={this.state.value}/>
          <input type='text' id='time-end' name='time-end' placeholder='end time' onChange={this.handleChange} value={this.state.value}/>
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