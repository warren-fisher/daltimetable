import {getAllClasses} from '../../../components/api/api.js';

import fs from "fs";
import path from "path";

const TokensFilePath = path.join(process.cwd(), "tokens.json");

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

    async function readTokenFromFile(term_id, crn) 
    {
        const token = `${term_id}-${crn}`;
    
        const tokensFile = await fs.promises.readFile(TokensFilePath);
        const tokenObj = JSON.parse(tokensFile.toString());
    
        return tokenObj[token];
    }    

    const classInfo = await readTokenFromFile(term, crn);

    return {
        props: {
            classInfo
        }
    }
}

// Statically determine all possible class paths
export async function getStaticPaths() {

    const all_data = await getAllClasses();

    function saveTokensToFile(tokens)
    {
        const tokenObj = {};
        for (let token in tokens) 
        {
            tokenObj[token] = tokens[token];
        }
        return fs.promises.writeFile(TokensFilePath, JSON.stringify(tokenObj));
    }

    await saveTokensToFile(all_data);

    let paths = [];

    for (let cls in all_data) {
        let [term, crnCode] = cls.split('-');

        paths.push({ params: { semester: term, crn: crnCode}})
    }

    return { paths: paths, fallback: true };
}