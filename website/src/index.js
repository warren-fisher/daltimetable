import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import {CheckboxDay, DisplayState, ClassInfo} from './other_components.js';

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
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
      {}),
      classesSelected: {}
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
    console.log(name);

    if (DAYS.includes(name)) {
      const day = name;
      this.setState({checkboxes: {...this.state.checkboxes,
        [day]: !this.state.checkboxes[day]}}, this.handleUpdate);
    } else if (!isNaN(name)) {
      this.setState({classesSelected: {...this.state.classesSelected,
      [name]: !this.state.classesSelected[name]
      }})
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

        <div id="days">
        {DAYS.map((day) => {
          let checked = this.state.checkboxes[day];
          return <CheckboxDay day={day} checked={checked} handleChange={this.handleChange}/>
          }
          )}
        </div>
      </form>

      <DisplayState />
      <div className="classes">
      {data.map((cls) => {
        return <ClassInfo data={cls} handleChange={this.handleChange}
          checked={this.state.classesSelected[cls.crn]}/>
      })}
      </div>
      </div>
    )
  }
}

ReactDOM.render(
    <SearchState />,
    document.getElementById('root')
);