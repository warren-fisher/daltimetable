import React from 'react';

import { TermWrapper } from '../components/contexts/terms.js';

import Home from '../components/mainComponent.js';

import HighOrder from '../components/highOrderComp.js';

function Main() {
    return (
        <TermWrapper>
            <HighOrder/>
        </TermWrapper>
    )
}

export default Main;