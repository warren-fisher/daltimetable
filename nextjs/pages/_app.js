import '../styles/globals.css'
import '../styles/index.css'
import Navigate from '../components/navigate.js';

import {UserWrapper, useUser} from '../components/contexts/user.js';


function MyApp({ Component, pageProps }) {
    return (
        <UserWrapper>
            <Navigate>
                <Component {...pageProps} />
            </Navigate>
        </UserWrapper>
    );
};

export default MyApp;

