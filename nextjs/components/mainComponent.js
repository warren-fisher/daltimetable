import React from 'react';
import { useEffect, useState } from 'react';
import { DisplayState } from '../components/DisplayState.js';
import { SearchState } from '../components/SearchState.js';
import { DAYS, storeClassesAsId, getClassesFromId } from '../components/helpers.js';
import { TermSelect } from '../components/other_components';

import {Link} from 'next/link';

import {masterQuery, getTerms, getSearch,
        getCRN, getMultipleCRN} from '../components/api/api.js';
import { TermWrapper } from '../components/contexts/terms.js';

/**
 * Main react component that governs state of the form, as well as navigation of the app.
 */
class Home extends React.Component {
    constructor(props) {
        super(props);

        // Bind functions passed down
        this.handleChange = this.handleChange.bind(this);
        this.getTermState = this.getTermState.bind(this);
        this.getApiState = this.getApiState.bind(this);
        this.handleUpdate = this.handleUpdate.bind(this);

        this.state = {
            classes: [],
            checkboxes: DAYS.reduce((options, option) => ({
                [option]: false,
                ...options,
            }),
                {}),
            classesSelected: {},
            size: { width: 1, height: 1 },
            terms: {}
        }
    }

    /**
     * Calculate and update the viewport size
     */
    updateDimensions() {
        let new_width = window.innerWidth;
        let new_height = window.innerHeight;

        this.setState({ size: { width: new_width, height: new_height } })
    }

    /**
     * Add event listener for window resize. Also gets the terms with their associated codes
     * using the API
     */
    componentDidMount() {
        this.updateDimensions();
        window.addEventListener("resize", this.updateDimensions.bind(this));

        // Setting up some initial state based on the terms received from the API

        const termCtx = this.props.termCtx;

        //TODO: mega OPTIMIZE

        let terms = {};
        let resp = getTerms();
        resp.then(res => {
            console.log("result", res);

            let tempAllTerms = {}
            let first = true;

            for (let term_code in res) {
                let name = res[term_code];
                tempAllTerms[name] = term_code;

                //TODO: set outside loop
                termCtx.setAllTerms(tempAllTerms);

                this.setState({classesSelected: {
                    ...this.state.classesSelected,
                    [term_code]: {}
                }})

                if (first) {
                    termCtx.setTerm(name);
                    console.log(name);
                    first = false;
                }

                terms[name] = term_code;
            }
            this.setState({terms: terms});
        }).catch(() => (console.log("fail")));
    }

    /**
     * Remove event listener for window resize
     */
    componentWillUnmount() {
        window.removeEventListener("resize", this.updateDimensions.bind(this));
    }

    /**
     * Update the state of classes based on the search query.
     *
     * @param {json} result
     */
    apiResponseState(result) {
        let cls = []
        if (result === null) {
            console.log("no results");
        }
        let keys = Object.keys(result);
        for (const name of keys) {
            cls.push(result[name]);
        }
        this.setState({ classes: cls });
    }

    /**
     * TODO fix for when changing terms the classes selected are broken
     * Master event listener for all changes to the form.
     *
     * @param {event} e
     */
    handleChange(e) {
        const target = e.target;
        const name = target.name;
        const val = target.value;
        const terms = this.props.termCtx.allTerms;
        const innerText = target.innerText;

        // If this is a selection box for a day you want
        if (DAYS.includes(name)) {
            const day = name;
            this.setState({
                checkboxes: {
                    ...this.state.checkboxes,
                    [day]: !this.state.checkboxes[day]
                }
            }, this.handleUpdate);
            // If this a selection box for the term you want
            // TODO: can probably optimize this
        }
        // If this is a selection box for a class, because classes have their name as their
        // term code added as two digits in front of their CRN, thus the name is a number
        // The setState calls here do not need a handleUpdate callback because they did not change
        // the search parameters.

        //TODO: classes selected broken
        //TODO: name not working
        else if (!isNaN(name)) {
            const term_code = Number(name.slice(0, 2));
            // const term_name = this.getTermNameFromCode(term_code);
            const crn = name.slice(2,);

            console.log("log checkbox action", target, name, crn, term_code);
            // return;
            if (this.state.classesSelected[term_code] != undefined &&
                !this.state.classesSelected[term_code][crn]) {
                let resp = getCRN(crn, term_code);
                resp.then(result => {
                    this.setState({
                        classesSelected: {
                            ...this.state.classesSelected,
                            [term_code]: {
                                ...this.state.classesSelected[term_code],
                                [crn]: result
                            }
                        }
                    })
                }).catch(() => { console.log('fail') })
            } else {
                this.setState({
                    classesSelected: {
                        ...this.state.classesSelected,
                        [term_code]: {
                            ...this.state.classesSelected[term_code],
                            [crn]: !this.state.classesSelected[term_code][crn]
                        }
                    }
                })
            }
            // Catches all other generic query updates (like text in the search box)
        } else {
            this.setState({ [name]: val }, this.handleUpdate);
        }
    }

    /**
     * Callback function to update search after the search state is updated.
     * If not used then it would search with outdated information.
     */
    handleUpdate() {
        console.log("update state", this.getApiState());
        let [search, start, end, days, crn, dept, term_code] = this.getApiState();
        let resp = masterQuery(search, crn, dept, days, start, end, term_code);
        resp.then(result => {
            this.apiResponseState(result);
        }).catch(() => { console.log('fail') })
    }

    //TODO: fix
    /**
     * Get the name of a term that has this term_code.
     *
     * @param {int} term_code used as unique identifier for that term
     */
    getTermNameFromCode(term_code) {
        for (let term_name in this.state.terms) {
            if (this.state.terms[term_name] === term_code) {
                return term_name;
            }
        }
    }

    /**
     * Helper function to determine if an input is null or not.
     * If null returns an exclamation point for input into the master query.
     * Else returns the input.
     *
     * @param {any} v
     */
    isNull(v) {
        if (v == null || v == '' || v == undefined || (isNaN(v) && typeof v != 'string')) {
            return '!'
        }
        return v
    }

    /**
     * Get isNull state of every parameter in the search query.
     * todo:: not working
     * TODO:: time_end, time_start, string_seach have hyphens in state
     * TODO: were CRN, DEPT ever used????
     */
    getApiState() {
        let search = this.isNull(this.state.string_search);
        let start = this.isNull(this.state.time_start);
        let end = this.isNull(this.state.time_end);
        let days = this.isNull(this.getDaysState());
        let crn = this.isNull(this.state.crn);
        let dept = this.isNull(this.state.dept);
        let term_code = this.isNull(this.getTermState());
        return [search, start, end, days, crn, dept, term_code];
    }

    /**
     * Return the term code of the term selected, or null if no term is selected.
     * 
     * TODO: this gets called soooooo many times on reload
     */
    getTermState() {


        console.log("hefdasldfdasf", this.props.termCtx);
        let termCtx = this.props.termCtx;

        // Happens at the start when the API response to the getting terms has not been received
        if (termCtx.term === undefined) {
            return null;
        }
        return termCtx.allTerms[termCtx.term];
    }

    /**
     * Return a string formatted with the letters MTWRF based on which days are selected
     * for the search query.
     */
    getDaysState() {
        const conv = {
            "Mo": "M",
            "Tu": "T",
            "We": "W",
            "Th": "R",
            "Fr": "F"
        }
        let s = "";
        for (let day of DAYS) {
            let val = this.state.checkboxes[day];
            if (val) {
                s += conv[day.slice(0, 2)];
            }
        }
        return s;
    }

    render() {
        return (
            <>
                <div id='main'>
                    <SearchState
                        handleChange={this.handleChange}
                        classes={this.state.classes}
                        classesSelected={this.state.classesSelected}
                        checkboxes={this.state.checkboxes}
                        size={this.state.size}
                        terms={this.state.terms}
                        getTermState={this.getTermState}
                        handleTermUpdate={this.handleUpdate}
                    />
                </div>
            </>
        )
    }
}

export default Home;