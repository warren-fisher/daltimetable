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
            <input type='checkbox' name={props.day} onChange={props.handleChange} checked={props.checked} />
            <label htmlFor={props.day}>{props.day}</label>
        </div>
    );
}
/**
 * Functional component representing each class to select for query purposes.
 *
 * @param {obj} props.data data about the class
 * @param {str} props.name what to name the class
 * @param {bool} props.checked whether or not this class is selected
 * @param {func} props.handleChange onChange function to update state
 */
export function ClassInfo(props) {
    const d = props.data;
    return (
        <div className="class_" id={d.crn}>
            <input type='checkbox' name={props.name} onChange={props.handleChange} checked={props.checked} />
        CRN={d.crn} dept={d.department} name={d.name} start={d.start_time} end={d.end_time} days={d.dates}
        </div>
    );
}


/**
 * Class component representing a toggle switch with many options to select what term to choose.
 *
 * @param {obj} props.terms all terms to select from and their truthy/falsy state
 * @param {func} props.handleChange onChange function to update state
 */
export class TermSelect extends React.Component {

    constructor(props) {
        super(props);
    }

    componentDidUpdate(prevProps) {

        console.log("update succesful");
        // Do this so that component re-renders on update
        if (this.props.terms !== prevProps.terms) {
            this.setState({change: true});
        }
    }

    render() {
        if (this.props.terms === undefined) {
            return null;
        } else {
            const terms = Object.keys(this.props.terms);
            return (<div id="term-selector">
                {terms.map((term) =>
                    <div name={term} onClick={this.props.handleChange}
                        className={this.props.terms[term] ? 'term mark-selected' : 'term mark-deselected'}>
                        <p>{term}</p>
                    </div>
                )}
            </div>);
        }
    }
}
