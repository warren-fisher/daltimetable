import React from 'react';
import './index.css';
import { CheckboxDay, ClassInfo } from './other_components.js';
import { DisplayState } from './DisplayState.js'
import { DAYS, storeClassesAsId, getClassesFromId } from './helpers.js'


/**
 * Function component to represent the form. State is governed by the higher order component 'Home'.
 *
 * @param {arr} props.classes all classes to display due to the users search
 * @param {obj} props.classesSelected all classes the user has selected
 * @param {func} props.handleChange onChange function to update state
 * @param {obj} props.checkboxes state of each checkbox in the form (so that it can be a 'controlled' form)
 * @param {obj} props.size of the users screen
 */
export function SearchState(props) {
    const data = props.classes;

    let selectedCRNs = [];
    for (let cls_ in props.classesSelected) {
        if (props.classesSelected[cls_] !== false) {
            selectedCRNs.push(cls_);
        }
    }
    const hexCode = storeClassesAsId(selectedCRNs);

    return (
        <div id='main'>
            <form>
                <label htmlFor="string-search">Search by class for name</label>
                <input type='text' id="string-search" name="string_search" placeholder='Search...' onChange={props.handleChange} value={props.value} />

                <label htmlFor="time">Search by class within time slot</label>
                <div id="time">
                    <input type='text' id='time-start' name='time_start' placeholder='start time' onChange={props.handleChange} value={props.value} />
                    <input type='text' id='time-end' name='time_end' placeholder='end time' onChange={props.handleChange} value={props.value} />
                </div>

                <div id="days">
                    {DAYS.map((day) => {
                        let checked = props.checkboxes[day];
                        return <CheckboxDay day={day} checked={checked} handleChange={props.handleChange} />
                    }
                    )}
                </div>
            </form>
            <strong>{hexCode}</strong>
            <DisplayState
                classes={props.classesSelected}
                width={props.size.width}
                height={props.size.height} />

            <div className="classes">
                {data.map((cls) => {
                    return <ClassInfo data={cls} handleChange={props.handleChange}
                        checked={props.classesSelected[cls.crn]} />
                })}
            </div>
        </div>
    )
}