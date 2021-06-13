import React from 'react';

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
            <input type='checkbox' id={props.day} name={props.day} onChange={props.handleChange} checked={props.checked} />
            <label htmlFor={props.day}>{props.day}</label>
        </div>
    );
}
/**
 * Functional component representing each class to select for query purposes.
 *
 * @param {obj} props.data data about the class
 * @param {str} props.name what to name the class (term code concat with crn) eg "05" + 14831
 * @param {bool} props.checked whether or not this class is selected
 * @param {func} props.handleChange onChange function to update state
 */
export function ClassInfo(props) {
    const d = props.data;
    //TODO: fix
    //TODO: crn not unique id for div
    //TODO: do name calculation in here
    return (
        <div className="class_" id={"div-" +props.name}>
            <label htmlFor={props.name}></label>
            <input type='checkbox' id={props.name} name={props.name} onChange={props.handleChange} checked={props.checked} />
            CRN={d.crn} dept={d.department} name={d.name} start={d.start_time} end={d.end_time} days={d.dates}
        </div>
    );
}
