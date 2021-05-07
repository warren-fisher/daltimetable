import { getCRN, getAllClasses} from '../../../components/api/api.js';

const Class = (props) => {

    if (props.classInfo === undefined) {
        return (
            <div>
                <p>Loading...</p>
            </div>
        )
    }

    const {class_code, crn, dates,
            department, end_time, name,
            start_time, term, year} = props.classInfo;

    return (
        <div>
            <p>
                Code = {class_code}
            </p>
            <p>
                CRN = {crn}
            </p>
            <p>

            </p>
        </div>
    )
}

export default Class;

// Statically get all properties for each path
export async function getStaticProps({ params }) {
    let term = params.semester;
    let crn = params.crn;

    const classInfo = await getCRN(crn, term);

    return {
        props: {
            classInfo
        }
    }
}

// Statically determine all possible class paths
export async function getStaticPaths() {

    const all_data = await getAllClasses();

    let paths = [];

    for (let cls in all_data) {
        let [term, crnCode] = cls.split('-');

        paths.push({ params: { semester: term, crn: crnCode}})
    }

    return { paths: paths, fallback: true };
}