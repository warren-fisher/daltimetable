import React from 'react';
import { CheckboxDay, ClassInfo} from './other_components.js';
import { DisplayState } from './DisplayState.js'
import { DAYS, storeClassesAsId, getClassesFromId } from './helpers.js'

import { TermAndClasses } from './CanvasAndSelector.js';

import { useTerm, useAllTerm } from './contexts/terms.js';

/**
 * Function component to represent the form. State is governed by the higher order component 'Home'.
 *
 * @param {arr} props.classes all classes to display due to the users search
 * @param {obj} props.classesSelected all classes the user has selected
 * @param {func} props.handleChange onChange function to update state
 * @param {obj} props.checkboxes state of each checkbox in the form (so that it can be a 'controlled' form)
 * @param {obj} props.size of the users screen
 * @param {obj} props.terms the term codes to use in ClassInfo name scheme
 * @param {func} props.getTermState to get the currently selected term
 * @param {func} props.handleTermUpdate the callback to use once the term button is updated //todo: used for prop drilling
 */
export function SearchState(props) {
    const data = props.classes;

    //TODO: redundant with classesSelected
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

    // props.classesSelected = object of class objects per term, selectedClasses = object of arrays of class crn per term
    console.log("props.classesSelected=", props.classesSelected, "vs created selectedClasses=", selectedClasses);

    // TODO: fixme for higher base & optimize crn??
    const base36_code = storeClassesAsId(selectedClasses);
    console.log('base36', base36_code);

    return (
        <div id='main'>
            <div>
            <h2>How to use this app</h2>
            <p>0. Select the term you want to create a schedule for. This button is below the form and above the schedule image.</p>
            <p>1. Enter your search parameters in this form</p>
            <p>2. The classes for your search will update. If you scroll below the empty schedule there will be a list of classes</p>
            <p>3. The more specific your search is the better, since less classes will appear! Only classes which meet all search parameters are shown.</p>
            <p>4. Click on the checkbox to the left of a class to add it to your schedule</p>
            <p>5. The schedule image will change and display your newly chosen class in the appropriate spot</p>
            <p>6. You can add classes for multiple terms by clicking the button for Summer, Fall or Winter. This will save your current selection 
                for that term, and once you switch back to the old term no information will be lost. </p>
            <p>7. Once you have selected all the classes you can click the "copy link to share with your friends button"</p>
            <p>8. This link will store your schedule in the URL (no account neccesary). Save the link and visit it when needed.</p>

            </div>

            <form id="search_form">
                {/* TODO: what is props.value?? */}
                <label htmlFor="string_search">Search for a class by name</label>
                <input type='text' id="string_search" name="string_search" placeholder='Search...' onChange={props.handleChange} value={props.value} />

                <label htmlFor="time">Search for a class within the time interval.</label>
                <p>Input your times like: 23 for 23:00, 2359 for 23:59, or 7 for 07:00</p>
                <div id="time">
                    <input type='text' id='time_start' name='time_start' placeholder='start time' onChange={props.handleChange} value={props.value} />
                    <input type='text' id='time_end' name='time_end' placeholder='end time' onChange={props.handleChange} value={props.value} />
                </div>

                <div id="days">
                    <p>Select the day(s) you want classes on. It will only include classes that are on days you selected. 
                       For example, if you select only Friday it will not show any class with lectures on Wednesday and Friday. 
                       You must select Wednesday and Friday (and potentially more days) to see that. By default if no days are selected 
                       then it is treated as if you do not care which day a class is on. </p>
                    {DAYS.map((day) => {
                        let checked = props.checkboxes[day];
                        return <CheckboxDay key={day} day={day} checked={checked} handleChange={props.handleChange} />
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
                handleTermUpdate={props.handleTermUpdate}
                />

            <div className="classes">
                {data.map((cls) => {
                    let term_code = props.getTermState();

                    let checked = props.classesSelected[term_code][cls.crn];

                    if (String(term_code).length == 1) {
                        term_code = "0" + String(term_code);
                    }

                    {/* String concatonation */}
                    let name = term_code + cls.crn;
       
                    return <ClassInfo key={name} name={name} data={cls} handleChange={props.handleChange}
                        checked={checked} />
                })}
            </div>
        </div>
    )
}