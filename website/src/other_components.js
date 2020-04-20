import React from 'react';
import ReactDOM from 'react-dom';
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

export function DisplayState(props) {
    const classes = [];
    console.log(props.classes)
    for (let crn in props.classes) {
        if (props.classes[crn] == true) {
            classes.push(crn);
        }
    }
    return (<div>
    {classes.map((crn) => {
        return crn;
    })}
    </div>);
}

export function CheckboxClass(props) {

}