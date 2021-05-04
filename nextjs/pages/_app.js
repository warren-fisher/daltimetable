import '../styles/globals.css'
import '../styles/index.css'
import Navigate from '../components/navigate.js';

import {ContextWrapper} from '../components/userContext.js';


function MyApp({ Component, pageProps }) {
    return (
        <ContextWrapper>
            <Navigate>
                <Component {...pageProps} />
            </Navigate>
        </ContextWrapper>
    );
};

export default MyApp;

