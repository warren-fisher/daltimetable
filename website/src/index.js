import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';

const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

class Checkbox extends React.Component {
  render() {
    const data = this.props;
    return <div class='day-checkbox'>
            <input type='checkbox' name={data.day} onChange={data.handleChange} checked={data.checked}/>
            <label for={data.day}>{data.day}</label>
    </div>
  }
}

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
      classes: [],
      checkboxes: DAYS.reduce((option) => ({
        [option]: false
      }))
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
    this.setState({[name]: val});

    let [search, start, end, days, crn, dept] = this.getApiState();

    if (name == 'string_search') {
      search = this.isNull(val);
    }

    if (name == 'time_start') {
      start = this.isNull(val);
    }

    if (name == 'time_end') {
      end = this.isNull(val);
    }

    console.log(search, start, end, days, crn, dept);

    let resp = this.masterQuery(search, crn, dept, days, start, end);
    resp.then(result => {
      this.apiResponseState(result);
    }).catch(() => {console.log('fail')})
  }

  getApiState(){
    let search = this.isNull(this.state.string_search);
    let start = this.isNull(this.state.time_start);
    let end = this.isNull(this.state.time_end);
    let days = this.isNull(this.state.days);
    let crn = this.isNull(this.state.crn);
    let dept = this.isNull(this.state.dept);
    this.getDaysState();
    return [search, start, end, days, crn, dept];
  }

  getDaysState(){
    console.log("hi")
    console.log(`${this.state.monday} ${this.state.friday}`)
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
    const checkboxes = this.state.checkboxes;
    return (
      <div id='main'>
      <form>
        <label for="string-search">Search by class for name</label>
        <input type='text' id="string-search" name="string_search" placeholder='Search...' onChange={this.handleChange} value={this.state.value}/>

        <label for="time">Search by class within time slot</label>
        <div id="time">
          <input type='text' id='time-start' name='time_start' placeholder='start time' onChange={this.handleChange} value={this.state.value}/>
          <input type='text' id='time-end' name='time_end' placeholder='end time' onChange={this.handleChange} value={this.state.value}/>
        </div>

        <div id="days">
        {DAYS.map((day) => {
          let checked = this.state.checkboxes[day];
          return <Checkbox day={day} checked={checked} handleChange={this.handleChange}/>
          }
          )}
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