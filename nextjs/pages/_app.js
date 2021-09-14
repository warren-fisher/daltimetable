import '../styles/globals.css'
import '../styles/index.css'
import Navigate from '../components/navigate.js';

import {UserWrapper, useUser} from '../components/contexts/user.js';
import { TermWrapper } from '../components/contexts/terms';

import Head from 'next/head';



function MyApp({ Component, pageProps }) {
    return (
        <>
        <Head>
            <title>Dalhousie Schedule Picker</title>
        </Head>
        <UserWrapper>
            <Navigate>
                <TermWrapper>
                    <Component {...pageProps} />
                </TermWrapper>
            </Navigate>
        </UserWrapper>
        </>
    );
};

export default MyApp;

