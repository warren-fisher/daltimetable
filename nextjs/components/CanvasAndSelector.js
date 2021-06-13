
import {getTerms} from './api/api.js';

import {TermSelect} from '../components/TermSelect.js';
import {DisplayState} from '../components/DisplayState.js';

import {useState, useEffect} from 'react';

import {useTerm} from '../components/contexts/terms.js';

/**
 * Intermediary function used by react-router to render DisplayState without setting the state of the form.
 * TODO: probably dont even need this function, also it doesnt work right now due to changes (multiple terms)
 *
 *  TODO: server side render some of this? (term select part?)
 *
 * @param {num} props.width Horizontal width of the users screen
 * @param {num} props.height Vertical height of the users screen
 * @param {obj} props.classesToDisplay the classes to show
 */
export function TermAndClasses(props) {

    const {term, setTerm, allTerms, setAllTerms} = useTerm();

    const handleChange = (e) => {
        const target = e.target;
        if (target.checked) {
            setTerm(target.value);
        }
    }

    let classesThisTerm = {};

    //TODO: whats this do
    //TODO: make better?
    if (term != '' && props.classesToDisplay != {}) {
        const term_code = allTerms[term]
        classesThisTerm = props.classesToDisplay[term_code];
        // Use ternary to make sure not undefined (can happen if user has no classes this term)
        classesThisTerm = (classesThisTerm == undefined ? {} : classesThisTerm);
    }

    console.log("this term", classesThisTerm);

    return (
        <>
            <TermSelect handleChange={handleChange} term={term} terms={allTerms} />

            <DisplayState
                classes={classesThisTerm}
                width={props.width}
                height={props.height} />
        </>
    );
}



