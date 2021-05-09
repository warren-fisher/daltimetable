import { createContext, useContext, useState } from 'react';

const TermContext = createContext();

export function TermWrapper({ children }) {

    const [term, setTerm] = useState('');
    const [allTerms, setAllTerms] = useState({});

    return (
        <TermContext.Provider value={{term, setTerm, allTerms, setAllTerms}}>
            {children}
        </TermContext.Provider>
    );
}

export const useTerm = () => useContext(TermContext);