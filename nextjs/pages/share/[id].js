import {getClassesFromId} from '../../components/helpers.js';

import { useTerm } from '../../components/contexts/terms.js';

import { getTerms } from '../../components/api/api.js';

import {useState, useEffect} from 'react';
import {useRouter} from 'next/router';

import {TermAndClasses} from '../../components/CanvasAndSelector.js';

/**
 * Intermediary function used by react-router to render DisplayState without setting the state of the form.
 * @param {func} props.handleChange onChange function to update state
 * @param {obj} props.terms all terms to select from and their truthy/falsy state
 * @param {func} props.getTermState to get the currently selected term
 */
function RenderTable(props) {

    // Get the dynamic portion of the URL
    const router = useRouter();

    const { id } = router.query;

    const termCtx = useTerm();

    // Set our initial state. Window cannot be accessed here.
    const [dimensions, setDimensions] = useState({height: 1000, width: 1000});

    // Handle our window dimensions
    useEffect(() => {
        const handleResize = () => {
            setDimensions({
                height: window.innerHeight,
                width: window.innerWidth});
        }
        window.addEventListener('resize', handleResize);

        // Update our window size state now. This is ok to do since useEffect is client side.
        handleResize();
        // On leave remove resize monitor
        return () => window.removeEventListener('resize', handleResize)
        }, []);

    // Get the terms as a useEffect only on initial load
    useEffect(()=>
        {
        let resp = getTerms();
        resp.then(res => {    
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

    // If link slug hasnt been found yet, loading data (so no errors)
    if (router.isFallback){
        return <div>Loading...</div>
    }

    return (
        <div id='share-link-main'>
            <h3>ID: {id}</h3>
            <TermAndClasses
                width={dimensions.width}
                height={dimensions.height}
                classesToDisplay={props.all_classes}
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