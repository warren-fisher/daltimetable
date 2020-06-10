import React from 'react';
import './index.css';

/**
 * Functional component representing each day to select for query purposes.
 *
 * @param {str} props.day This days name
 * @param {bool} props.checked Whether or not this day is selected
 * @param {func} props.handleChange onChange function to update state
 */
export function CheckboxDay(props) {
    return (
        <div className='day-checkbox'>
            <input type='checkbox' name={props.day} onChange={props.handleChange} checked={props.checked} />
            <label htmlFor={props.day}>{props.day}</label>
        </div>
    );
}
/**
 * Functional component representing each class to select for query purposes.
 *
 * @param {obj} props.data data about the class
 * @param {bool} props.checked whether or not this day is selected
 * @param {func} props.handleChange onChange function to update state
 */
export function ClassInfo(props) {
    const d = props.data;
    return (
        <div className="class_" id={d.crn}>
            <input type='checkbox' name={d.crn} onChange={props.handleChange} checked={props.checked} />
        CRN={d.crn} dept={d.department} name={d.name} start={d.start_time} end={d.end_time} days={d.dates}
        </div>
    );
}