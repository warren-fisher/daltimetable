import { useEffect } from 'react';
import {getTerms} from './api/api.js';
import {useTerm} from './contexts/terms.js';

/**
 * Class component representing a toggle switch with many options to select what term to choose.
 *
 * @param {obj} props.terms all terms to select from
 * @param {string} props.term the selected term
 * @param {func} props.handleChange onChange function to update state
 */
export function TermSelect(props) {

    // TODO: termHandle change not working

    const terms = props.terms;
    let index = 1;
    return (

        <div id="term-selector">
            {Object.keys(terms).map((term) =>
                <div key={index++} className="term-div">
                <input type="radio" className="term" checked={term == props.term} value={term} id={term} onChange={props.handleChange}/>
                <label htmlFor={term}>{term}</label>
                </div>
            )}
        </div>
    );


}

