import '../styles/globals.css'
import '../styles/index.css'
import Navigate from '../components/navigate.js';

import {UserWrapper, useUser} from '../components/contexts/user.js';
import { TermWrapper } from '../components/contexts/terms';


function MyApp({ Component, pageProps }) {
    return (
        <UserWrapper>
            <Navigate>
                <TermWrapper>
                    <Component {...pageProps} />
                </TermWrapper>
            </Navigate>
        </UserWrapper>
    );
};

export default MyApp;

