import React from 'react';

import Home from '../components/mainComponent.js';

import { useTerm } from '../components/contexts/terms.js';

function Main() {
    const termCtx = useTerm();
    return (
        <Home termCtx={termCtx}/>
    );
}

export default Main;