const apiURL = "https://api.warrenfisher.net";


/**
     * A master query that can query the database based on many different inputs.
     * If a input is an exclamation point it is ignored in the query based on the API.
     *
     * @param {string} search
     * @param {number} crn
     * @param {string} dept
     * @param {string} days
     * @param {string} start
     * @param {string} end
     * @param {number} term_code
     */
export async function masterQuery(search, crn, dept, days, start, end, term_code) {
    const response = await fetch(`${apiURL}/api/get/master/${search}/${crn}/${dept}/${days}/${start}/${end}/${term_code}`, {
        method: 'GET',
    });
    return await response.json();
}

export async function getTerms() {
    const response = await fetch(`${apiURL}/api/get/terms`, {
        method: 'GET',
    });
    return await response.json();
}

/**
 * Query the database based on a start and end time.
 * Refer to api/sql.py for acceptable string formats.
 * !not used
 *
 * @param {string} start
 * @param {string} end
 */
export async function getTime(start, end) {
    const response = await fetch(`${apiURL}/api/time/${start}/${end}`, {
        method: 'GET',
    });
    return await response.json();
}

/**
 * Query the database based on a string query.
 * !not used
 *
 * @param {string} search
 */
export async function getSearch(search) {
    const response = await fetch(`${apiURL}/api/search/${search}`, {
        method: 'GET',
    });
    return await response.json();
}

/**
 * Query the database based on the Course Registration Number.
 *
 * @param {number} crn
 * @param {number} term_code
 */
export async function getCRN(crn, term_code) {
    const response = await fetch(`${apiURL}/api/crn/${crn}/${term_code}`, {
        method: 'GET',
    });
    return await response.json();
}

/**
 * Query the database for multiple CRNs from one term.
 *
 * @param {string} crns each crn is concactonated together into one string
 * @param {number} term_code of the term selected
 */
export async function getMultipleCRN(crns, term_code) {
    const response = await fetch(`${apiURL}/api/get/crns/${term_code}/${crns}`, {
        method: 'GET',
    });
    return await response.json();
}

/**
 * Query the database for all classes over all terms
 *
 * @returns
 */
export async function getAllClasses() {
    const response = await fetch(`${apiURL}/api/get/allclasses`, {method:'GET'});
    return await response.json();
}