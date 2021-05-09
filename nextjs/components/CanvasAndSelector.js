
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

    // const [term, setTerm] = useState('');
    // const [allTerms, setAllTerms] = useState({});

    const handleChange = (e) => {
        const target = e.target;
        if (target.checked) {
            setTerm(target.value);
        }
    }

    useEffect(() => {
        async function getData() {
            let res = await getTerms();
            let tempAllTerms = {}
            let first = true;

            for (let term_code in res) {
                let name = res[term_code];
                tempAllTerms[name] = term_code;

                setAllTerms(tempAllTerms);

                if (first) {
                    setTerm(name);
                    console.log(name);
                    first = false;
                }
            }
        }
        getData();
    }, []);

    let classesThisTerm = {};

    if (term != '' && props.classesToDisplay != {}) {
        const term_code = allTerms[term]
        classesThisTerm = props.classesToDisplay[term_code];
        // Use ternary to make sure not undefined (can happen if user has no classes this term)
        classesThisTerm = (classesThisTerm == undefined ? {} : classesThisTerm);
    }

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



