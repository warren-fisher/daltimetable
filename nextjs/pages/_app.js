import '../styles/globals.css'
import '../styles/index.css'
import Navigate from '../components/navigate.js';

function MyApp({ Component, pageProps }) {
    return (
        <Navigate>
            <Component {...pageProps} />
        </Navigate>
    );
}

export default MyApp
