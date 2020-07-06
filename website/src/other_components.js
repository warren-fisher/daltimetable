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

/**
 * Functional component representing a toggle switch with three options
 *
 * @param {obj} props.terms all terms to select from and their truthy/falsy state
 * @param {func} props.handleChange onChange function to update state
 */
export function TermSelector(props) {
    console.log(props.terms, 'hi');
    if (props.terms === undefined) {
        return null;
    } else {
        const terms = Object.keys(props.terms);
        return (<div id="term-selector">
            {terms.map((term) =>
                <div name={term} onClick={props.handleChange}
                className={props.terms[term] ? 'term mark-selected' : 'term mark-deselected'}>
                {/* <input type='checkbox' name={term} onChange={props.handleChange}
                    checked={props.terms[term]} /> */}
                <p>{term}</p>
                </div>
            )}
        </div>);
    }
}