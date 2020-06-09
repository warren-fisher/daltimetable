

export const DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

/**
 * Extract the CRNs from the hexstring
 *
 * @param {arr} CRNs from classes chosen
 * @return {str} formatted as a hexstring for links
 */
export function storeClassesAsId(classes) {
    let str = '';
    for (let cls_ of classes) {
        cls_ = Number(cls_);
        let hex = (cls_).toString(16);
        str += hex;
    }
    return str;
}

/**
 * Extract the CRNs from the hexstring
 *
 * @param {hex} id from the link
 * @return {array} of CRNs
 */
export function getClassesFromId(id) {
    let classes = [];
    let length = id.length;

    if (length % 4 != 0) {
        return [];
    }

    const splitString = index => x => x.slice(4 * (index - 1), 4 * index);

    console.log(length / 4);
    for (let i = 1; i <= (length / 4); i++) {
        let hex = splitString(i)(id);
        let num = parseInt(hex, 16);
        classes.push(num);
    }
    return classes;
}