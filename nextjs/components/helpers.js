
export const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

/**
 * Extract the CRNs from the base36 string
 *
 * @param {obj} classes of structure [term]: {arr} of class CRNs
 * @return {str} formatted as a hexstring for links
 */
export function storeClassesAsId(classes) {
    let str = '';

    for (let term_id in classes) {
        let terms_classes = classes[term_id];
        // We will pad both of these to 2 digits
        let term_id_base36 = (term_id).toString(36);
        let num_class = terms_classes.length;
        if (num_class == 0) {
            continue;
        }
        let num_class_base36 = (num_class).toString(36);

        // Pad both of these to two digits because they can be in range 0~99, 1~12
        term_id_base36 = term_id_base36.length == 1 ? "0" + term_id_base36 : term_id_base36
        num_class_base36 = num_class_base36.length == 1 ? "0" + num_class_base36 : num_class_base36

        let id_base36 = term_id_base36 + num_class_base36
        for (let crn of terms_classes) {
            crn = Number(crn);
            let base_36 = (crn).toString(36);
            id_base36 += base_36;
        }
        str += id_base36;
    }
    return str;
}

/**
 * Extract the CRNs from the hexstring
 *
 * @param {hex} link_id from the link
 * @return {array} of CRNs
 */
export async function getClassesFromId(link_id) {
    let classes = {};

    while (true) {
        let term_id = parseInt(link_id.slice(0, 2), 36);
        let num_classes = parseInt(link_id.slice(2, 4), 36);

        classes[term_id] = ""

        // Const function to extract the ith class from the link id
        const splitString = index => x => x.slice(3 * (index) + 4, 3 * (index+1) + 4);

        for (let i = 0; i < num_classes; i++) {
            let classCRNbase36 = splitString(i)(link_id);
            let classCRN = parseInt(classCRNbase36, 36);
            classes[term_id] += classCRN;
        }

        let result = await getMultipleCRN(classes[term_id], term_id);
        classes[term_id] = result;

        // Test if all classes have been parsed, or if there are more classes in another term
        if (link_id.length == (4 + 3*num_classes)) {
            return classes;
        } else {
            link_id = link_id.slice((4+3*num_classes),);
        }
    }
}

/**
 * Query the database for multiple CRNs from one term.
 *
 * @param {string} crns each crn is concactonated together into one string
 * @param {number} term_code of the term selected
 */
async function getMultipleCRN(crns, term_code) {
    const response = await fetch(`https://api.warrenfisher.net/api/get/crns/${term_code}/${crns}`, {
        method: 'GET',
    });
    return await response.json();
}