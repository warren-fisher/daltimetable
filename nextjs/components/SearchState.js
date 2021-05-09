import React from 'react';
import { CheckboxDay, ClassInfo, TermSelect } from './other_components.js';
import { DisplayState } from './DisplayState.js'
import { DAYS, storeClassesAsId, getClassesFromId } from './helpers.js'

import { TermAndClasses } from './CanvasAndSelector.js';

import { useTerm } from './contexts/terms.js';

/**
 * Function component to represent the form. State is governed by the higher order component 'Home'.
 *
 * @param {arr} props.classes all classes to display due to the users search
 * @param {obj} props.classesSelected all classes the user has selected
 * @param {func} props.handleChange onChange function to update state
 * @param {obj} props.termsSelected all terms to select from and their truthy/falsy state
 * @param {obj} props.checkboxes state of each checkbox in the form (so that it can be a 'controlled' form)
 * @param {obj} props.size of the users screen
 * @param {obj} props.terms the term codes to use in ClassInfo name scheme
 * @param {func} props.getTermState to get the currently selected term
 */
export function SearchState(props) {

    const { term, setTerm, allTerms, setAllTerms } = useTerm();

    const data = props.classes;

    // This was used for hex data
    let selectedClasses = {};
    for (let term in props.classesSelected) {
        let selectedCRNs = [];
        for (let cls_ in props.classesSelected[term]) {
            if (props.classesSelected[term][cls_] !== false) {
                selectedCRNs.push(cls_);
            }
        }
        selectedClasses = {...selectedClasses,
                        [term]: selectedCRNs};
    }

    // TODO pay attention to array vs obj
    let classesToDisplay = {};
    let term_selected = props.getTermState();
    if (term_selected === null) {
        classesToDisplay = {};
    } else {
        classesToDisplay = props.classesSelected[term_selected];
    }

    // TODO: fixme
    const base36_code = storeClassesAsId(selectedClasses);
    console.log('base36', base36_code);

    return (
        <div id='main'>
            <div>
            <h2>How to use this app</h2>
            <p>0. Select the term you want to create a schedule for. This button is below the form and above the schedule image.</p>
            <p>1. Enter your search parameters in this form</p>
            <p>2. The search will automatically happen once parameters are entered. If you scroll below the empty schedule there will be a long list of classes</p>
            <p>3. The more specific your search is the better, since less classes will appear! Only classes which meet all search parameters are shown.</p>
            <p>4. Click on the checkbox to the left of a class to add it to your schedule</p>
            <p>5. The schedule image will change and display your newly chosen class in the appropriate spot</p>
            <p>6. Once you have selected all the classes you can click the "copy link to share with your friends button"</p>
            <p>7. This link will store your schedule in the URL (no account neccesary). Save the link and visit it when needed.</p>

            </div>

            <form>
                <label htmlFor="string-search">Search by class for name</label>
                <input type='text' id="string-search" name="string-search" placeholder='Search...' onChange={props.handleChange} value={props.value} />

                <label htmlFor="time">Search by class within time slot</label>
                <div id="time">
                    <input type='text' id='time-start' name='time-start' placeholder='start time' onChange={props.handleChange} value={props.value} />
                    <input type='text' id='time-end' name='time-end' placeholder='end time' onChange={props.handleChange} value={props.value} />
                </div>

                <div id="days">
                    {DAYS.map((day) => {
                        let checked = props.checkboxes[day];
                        return <CheckboxDay day={day} checked={checked} handleChange={props.handleChange} />
                    }
                    )}
                </div>
            </form>
            <div>
                Unique ID :
                <strong> {base36_code} </strong>
                <button onClick={() => { navigator.clipboard.writeText(`${document.URL}share/${base36_code}`) }}>Copy link to share with your friends</button>
            </div>

            <TermAndClasses
                width={props.size.width}
                height={props.size.height}
                classesToDisplay={props.classesSelected}
                />

            {/* <TermSelect handleChange={props.handleChange} terms={props.termsSelected} />

            <DisplayState
                classes={classesToDisplay}
                width={props.size.width}
                height={props.size.height} /> */}

            <div className="classes">
                {data.map((cls) => {
                    let term_str = `${cls.term} ${cls.year}`;
                    let term_code = props.terms[term_str];

                    if (String(term_code).length == 1) {
                        term_code = "0" + String(term_code);
                    }

                    {/* String concatonation */}
                    let name = term_code + cls.crn;

                    return <ClassInfo name={name} data={cls} handleChange={props.handleChange}
                        checked={classesToDisplay[cls.crn]} />
                })}
            </div>
        </div>
    )
}