import Link from 'next/link';

function Navigate({children}) {
    return (
        <>
        <header>
            <h2>Dalhousie Timetable Remastered</h2>

            <h2><Link href="/">
                Pick your classes
            </Link></h2>

            <h2><Link href="/contribute">
                Contribute
            </Link></h2>
        </header>
        {children}
        <footer>
            <p>

            Tool created by Warren Fisher

            </p>

        </footer>
        </>
    );
}

export default Navigate;