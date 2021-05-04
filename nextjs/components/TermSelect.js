

import {getTerms} from './api/api.js';
import {useTerm} from './contexts/terms.js';

/**
 * Class component representing a toggle switch with many options to select what term to choose.
 *
 * @param {obj} props.terms all terms to select from and their truthy/falsy state
 * @param {func} props.handleChange onChange function to update state
 */
export function TermSelect(props) {

    // TODO: termHandle change not working

    const terms = props.terms;

    return (<div id="term-selector">
        {Object.keys(terms).map((term) =>
            <div name={term} onClick={props.handleChange}
                className={terms[term] ? 'term mark-selected' : 'term mark-deselected'}>
                <p>{term}</p>
            </div>
        )}
    </div>);
}

