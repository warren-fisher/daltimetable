import { createContext, useContext, useState } from 'react';

import React from 'react';

const TermContext = createContext();

export function TermWrapper({ children }) {

    const [term, setTerm] = useState('');
    const [allTerms, setAllTerms] = useState({});

    React.useEffect(() => {
        const t = term;
        console.log("curr term", term);
    }, [term])


    return (
        <TermContext.Provider value={{term, setTerm, allTerms, setAllTerms}}>
            {children} 
        </TermContext.Provider>
    );
}

export const useTerm = () => useContext(TermContext);