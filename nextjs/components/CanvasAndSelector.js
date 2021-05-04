
import {TermSelect} from '../components/TermSelect.js';
import {DisplayState} from '../components/DisplayState.js';

/**
 * Intermediary function used by react-router to render DisplayState without setting the state of the form.
 * TODO: probably dont even need this function, also it doesnt work right now due to changes (multiple terms)
 *
 * @param {num} props.width Horizontal width of the users screen
 * @param {num} props.height Vertical height of the users screen
 * @param {func} props.handleChange onChange function to update state
 * @param {obj} props.terms all terms to select from and their truthy/falsy state
 * @param {obj} props.classesToDisplay the classes to show
 */
export function TermAndClasses(props) {

    return (
        <>
            <TermSelect handleChange={props.handleChange} terms={props.terms} />

            <DisplayState
                classes={props.classesToDisplay}
                width={props.width}
                height={props.height} />
        </>
    );
}



