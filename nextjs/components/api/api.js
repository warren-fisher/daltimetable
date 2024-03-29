const apiURL = "http://localhost:5000";

/**
     * A master query that can query the database based on many different inputs.
     * If a input is an exclamation point it is ignored in the query based on the API.
     *
     * @param {string} search
     * @param {string} days
     * @param {string} start
     * @param {string} end
     * @param {number} term_code
     */
export async function masterQuery(search, days, start, end, term_code) {
    const response = await fetch(`${apiURL}/api/get/master/search=${search}&days=${days}&start=${start}&end=${end}&term=${term_code}`, {
        method: 'GET',
    });
    return await response.json();
}

/**
 * Get the currently available terms.
 */
export async function getTerms() {
    const response = await fetch(`${apiURL}/api/get/terms`, {
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
    const response = await fetch(`${apiURL}/api/get/crn/${crn}/${term_code}`, {
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
 */
export async function getAllClasses() {
    const response = await fetch(`${apiURL}/api/get/allclasses`, {method:'GET'});
    return await response.json();
}