import { useEffect } from 'react';
import {getTerms} from './api/api.js';
import {useTerm} from './contexts/terms.js';

/**
 * Class component representing a toggle switch with many options to select what term to choose.
 *
 * @param {func} props.handleChange onChange function to update state
 */
export function TermSelect(props) {
    const {term, setTerm, allTerms, setAllTerms} = useTerm();

    // TODO: term select very slow
    // TODO: term select seemed to work better before

    let index = 1;
    return (

        <div id="term-selector">
            {Object.keys(allTerms).map((thisTerm) =>
                <div key={index++} className="term">
                <input type="radio" className="term-radio" checked={term == thisTerm} value={thisTerm} id={thisTerm} onChange={props.handleChange}/>
                <label htmlFor={thisTerm}>{thisTerm}</label>
                </div>
            )}
        </div>
    );


}

