import {getClassesFromId} from '../../components/helpers.js';

import { useTerm } from '../../components/contexts/terms.js';

import { getTerms } from '../../components/api/api.js';

import {useState, useEffect} from 'react';
import {useRouter} from 'next/router';

import {TermAndClasses} from '../../components/CanvasAndSelector.js';

/**
 * Intermediary function used by react-router to render DisplayState without setting the state of the form.
 * TODO: probably dont even need this function, also it doesnt work right now due to changes (multiple terms)
 *
 * @param {num} props.width Horizontal width of the users screen
 * @param {num} props.height Vertical height of the users screen
 * @param {func} props.handleChange onChange function to update state
 * @param {obj} props.terms all terms to select from and their truthy/falsy state
 * @param {func} props.getTermState to get the currently selected term
 */
function RenderTable(props) {

    // Get the dynamic portion of the URL
    // TODO: Its acting weird
    const router = useRouter();

    // If link slug hasnt been found yet, loading data (so no errors)
    if (router.isFallback){
        return <div>Loading...</div>
    }

    console.log("props=", props)

    const { id } = router.query;

    const [classes, setClasses] = useState({});

    const termCtx = useTerm();

    // TODO: both these useEffect's can be abstracted away from similar stuff in mainComponent.js

    // Get the terms as a useEffect only on initial load
    useEffect(()=>
        {
        let resp = getTerms();
        resp.then(res => {
            console.log("result", res);
    
            let firstTerm = undefined;
            let terms = {};
    
            for (let term_code in res) 
            {
                let name = res[term_code];
                terms[name] = term_code;
    
                if (firstTerm === undefined) 
                {
                    firstTerm = name;
                }
            }
    
            termCtx.setAllTerms(terms);
            // changing the termCtx name will be monitored as a useEffect in CanvasAndSelector.js and will update search state
            // this is why we do it last
            termCtx.setTerm(firstTerm);
        }).catch(() => (console.log("fail")));
        }, []);


    // Get the classes from the ID
    useEffect(() => {
        async function getClass() {
            // This logic is similar to that in SearchState, probably can push it into the DisplayState component?
            // by putting the term selector in there
            let all_classes = await getClassesFromId(id);
            console.log('hello', all_classes);

            setClasses(all_classes);
        }
        getClass();
    }, []);

    return (
        // TODO: proper height, width
        <div id='share-link-main'>
            <h3>ID: {id}</h3>
            <TermAndClasses
                width={1000}
                height={1000}
                classesToDisplay={classes}
                // Don't need to update the searched for classes or anything on termUpdate
                handleTermUpdate={()=>{}}
            />
        </div>
    );
}

// Statically get the slug id
export async function getStaticProps({params}) {

    let id = params.id;

    const all_classes = await getClassesFromId(params.id);

    return {
        props: {id, all_classes}
    }
}

// Statically guess which path the user might access
export async function getStaticPaths() {
    return {paths: [], fallback: true};
}

export default RenderTable;