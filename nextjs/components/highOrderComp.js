import {useTerm} from './contexts/terms.js';

import Home from './mainComponent.js';

function HighOrder() {
    const termCtx = useTerm();
    return (
        <Home termCtx={termCtx}/>
    );
}

export default HighOrder;