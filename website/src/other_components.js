import React from 'react';
import './index.css';

export function CheckboxDay(props) {
    return (
        <div className='day-checkbox'>
            <input type='checkbox' name={props.day} onChange={props.handleChange} checked={props.checked}/>
            <label htmlFor={props.day}>{props.day}</label>
        </div>
    );
}

export function ClassInfo(props) {
    const d = props.data;
    return (
    <div className="class_" id={d.crn}>
        <input type='checkbox' name={d.crn} onChange={props.handleChange} checked={props.checked}/>
        CRN={d.crn} dept={d.department} name={d.name} start={d.start_time} end={d.end_time} days={d.dates}
    </div>
    );
}

export class DisplayState extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        const classes = [];
        console.log(this.props.classes)
        for (let crn in this.props.classes) {
            if (!!this.props.classes[crn]) {
                classes.push(this.props.classes[crn]);
            }
        }
        return (<div>
        {classes.map((cls) => {
            return cls['crn'];
        })}
        </div>);
    }
}