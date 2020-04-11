import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

function Checkbox(props) {
    return (
        <div className='day-checkbox'>
            <input type='checkbox' name={props.day} onChange={props.handleChange} checked={props.checked}/>
            <label htmlFor={props.day}>{props.day}</label>
        </div>
    );
}

class ClassInfo extends React.Component {
  renderClass(d) {
    return <div className="class_" id={d.crn}>CRN={d.crn} dept={d.department} name={d.name} start={d.start_time} end={d.end_time}</div>
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

class DisplayState extends React.Component {
  render() {
    return <div></div>
  }
}

class SearchState extends React.Component {
  constructor(props) {
    super(props);
    this.handleChange = this.handleChange.bind(this);
    this.state = {
      classes: [],
      checkboxes: DAYS.reduce((options, option) => ({
        [option]: false,
        ...options,
      }),
      {})
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
    this.setState({classes: cls});
  }

  handleChange(e) {
    const target = e.target;
    const name = target.name;
    const val = target.value;

    if (DAYS.includes(name)) {
      const day = name;
      this.setState({checkboxes: {...this.state.checkboxes,
        [day]: !this.state.checkboxes[day]}}, this.handleUpdate);
    } else {
      this.setState({[name]: val}, this.handleUpdate);
    }
  }

  handleUpdate() {
    let [search, start, end, days, crn, dept] = this.getApiState();
    let resp = this.masterQuery(search, crn, dept, days, start, end);
    resp.then(result => {
      this.apiResponseState(result);
    }).catch(() => {console.log('fail')})
  }

  getApiState(){
    let search = this.isNull(this.state.string_search);
    let start = this.isNull(this.state.time_start);
    let end = this.isNull(this.state.time_end);
    let days = this.isNull(this.getDaysState());
    let crn = this.isNull(this.state.crn);
    let dept = this.isNull(this.state.dept);
    console.log(days);
    return [search, start, end, days, crn, dept];
  }

  getDaysState(){
    const conv = {
      "Mo": "M",
      "Tu": "T",
      "We": "W",
      "Th": "R",
      "Fr": "F"
    }
    let s = "";
    for (let day of DAYS) {
      let val = this.state.checkboxes[day];
      if (val) {
        s += conv[day.slice(0, 2)];
      }
    }
    return s;
  }

  isNull(v) {
    if (v == null || v == '' || v == undefined || (isNaN(v) && typeof v != 'string')) {
      return '!'
    }
    return v
  }

  async masterQuery(search, crn, dept, days, start, end) {
    const response = await fetch(`http://localhost:5000/api/get/master/${search}/${crn}/${dept}/${days}/${start}/${end}`, {
      method: 'GET',
    });
    return await response.json();
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
    const data = this.state.classes;
    return (
      <div id='main'>
      <form>
        <label htmlFor="string-search">Search by class for name</label>
        <input type='text' id="string-search" name="string_search" placeholder='Search...' onChange={this.handleChange} value={this.state.value}/>

        <label htmlFor="time">Search by class within time slot</label>
        <div id="time">
          <input type='text' id='time-start' name='time_start' placeholder='start time' onChange={this.handleChange} value={this.state.value}/>
          <input type='text' id='time-end' name='time_end' placeholder='end time' onChange={this.handleChange} value={this.state.value}/>
        </div>

        <DisplayState />

        <div id="days">
        {DAYS.map((day) => {
          let checked = this.state.checkboxes[day];
          return <Checkbox day={day} checked={checked} handleChange={this.handleChange}/>
          }
          )}
        </div>
      </form>
      <div className="classes">
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