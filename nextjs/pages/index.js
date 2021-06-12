import React from 'react';

import { TermWrapper } from '../components/contexts/terms.js';

import { Home } from '../components/mainComponent.js';

/**
 * Main react component that governs state of the form, as well as navigation of the app.
 */
class Main extends React.Component {
    render() {
        return (
            <TermWrapper>
                <Home/>
            </TermWrapper>
        );
    }
}

export default Main;