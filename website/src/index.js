import React from 'react';
import { useEffect, useState } from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import { DisplayState } from './DisplayState.js';
import { SearchState } from './SearchState.js';
import { DAYS, storeClassesAsId, getClassesFromId} from './helpers.js'

import {
    BrowserRouter as Router,
    Switch,
    Route,
    useParams,
    Link
} from "react-router-dom";

/**
 * Main react component that governs state of the form, as well as navigation of the app.
 */
class Home extends React.Component {
    constructor(props) {
        super(props);
        this.handleChange = this.handleChange.bind(this);
        this.state = {
            classes: [],
            checkboxes: DAYS.reduce((options, option) => ({
                [option]: false,
                ...options,
            }),
                {}),
            classesSelected: {},
            size: { width: 1, height: 1 }
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
     * Add event listener for window resize
     */
    componentDidMount() {
        this.updateDimensions();
        window.addEventListener("resize", this.updateDimensions.bind(this));
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
        let keys = Object.keys(result)
        for (const name of keys) {
            cls.push(result[name]);
        }
        this.setState({ classes: cls });
    }

    /**
     * Master event listener for all changes to the form.
     *
     * @param {event} e
     */
    handleChange(e) {
        const target = e.target;
        const name = target.name;
        const val = target.value;
        console.log(name);

        // If this is a selection box for a day you want
        if (DAYS.includes(name)) {
            const day = name;
            this.setState({
                checkboxes: {
                    ...this.state.checkboxes,
                    [day]: !this.state.checkboxes[day]
                }
            }, this.handleUpdate);
        // If this is a selection box for a class, because classes have their name as their CRN
        } else if (!isNaN(name)) {
            if (!this.state.classesSelected[name]) {
                let resp = Home.getCRN(name);
                resp.then(result => {
                    this.setState({
                        classesSelected: {
                            ...this.state.classesSelected,
                            [name]: result
                        }
                    })
                }).catch(() => { console.log('fail') })
            } else {
                this.setState({
                    classesSelected: {
                        ...this.state.classesSelected,
                        [name]: !this.state.classesSelected[name]
                    }
                })
            }
        // Catches all other generic query updates
        } else {
            this.setState({ [name]: val }, this.handleUpdate);
        }
    }

    /**
     * Callback function to update search after the search state is updated.
     * If not used then it would search with outdated information.
     */
    handleUpdate() {
        let [search, start, end, days, crn, dept, year, term] = this.getApiState();
        let resp = this.masterQuery(search, crn, dept, days, start, end, year, term);
        resp.then(result => {
            this.apiResponseState(result);
        }).catch(() => { console.log('fail') })
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
     */
    getApiState() {
        let search = this.isNull(this.state.string_search);
        let start = this.isNull(this.state.time_start);
        let end = this.isNull(this.state.time_end);
        let days = this.isNull(this.getDaysState());
        let crn = this.isNull(this.state.crn);
        let dept = this.isNull(this.state.dept);
        let year = this.isNull(this.state.year);
        let term = this.isNull(this.state.term);
        console.log(days);
        return [search, start, end, days, crn, dept, year, term];
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
     */
    async masterQuery(search, crn, dept, days, start, end, year, term) {
        const response = await fetch(`http://localhost:5000/api/get/master/${search}/${crn}/${dept}/${days}/${start}/${end}/${year}/${term}`, {
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
    async getTime(start, end) {
        const response = await fetch(`http://localhost:5000/api/time/${start}/${end}`, {
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
    async getSearch(search) {
        const response = await fetch(`http://localhost:5000/api/search/${search}`, {
            method: 'GET',
        });
        return await response.json();
    }

    /**
     * Query the database based on the Course Registration Number.
     *
     * @param {number} crn
     */
    static async getCRN(crn) {
        const response = await fetch(`http://localhost:5000/api/crn/${crn}`, {
            method: 'GET',
        });
        return await response.json();
    }

    render() {
        return (
            <Router>
                <header>
                    <h2>Dalhousie Timetable Remastered</h2>

                    <h2><Link to={{
                        pathname: "/",
                    }}>Pick your classes</Link></h2>

                    <h2><Link to={{
                        pathname: "/faq",
                    }}>FAQ</Link></h2>

                    <h2><Link to={{
                        pathname: "/contribute",
                    }}>Contribute</Link></h2>
                </header>

                <div id='main'>
                    <Switch>
                        <Route exact path="/"
                            render={(props) => (<SearchState
                                handleChange={this.handleChange}
                                classes={this.state.classes}
                                classesSelected={this.state.classesSelected}
                                checkboxes={this.state.checkboxes}
                                size={this.state.size}
                                />)}/>

                        <Route exact path="/FAQ">

                            <p>Hello</p>
                        </Route>

                        <Route exact path="/Contribute">
                            <p>Any help is appreciated</p>
                        </Route>

                        <Route path="/share/:id" children={
                            <RenderTable
                                width={this.state.size.width}
                                height={this.state.size.height} />
                        } />

                    </Switch>
                </div>
            </Router>
        )
    }
}

/**
 * Intermediary function used by react-router to render DisplayState without setting the state of the form.
 *
 * @param {num} props.width Horizontal width of the users screen
 * @param {num} props.height Vertical height of the users screen
 */
function RenderTable(props) {
    // Get the dynamic portion of the URL
    let { id } = useParams();
    const [classes, setClasses] = useState({});

    useEffect(() => {
        async function getClass() {
            let all_crns = getClassesFromId(id);
            console.log(all_crns);
            let all_class_info = [];
            for (let crn of all_crns) {
                const cls_ = await Home.getCRN(crn);
                all_class_info.push(cls_);
            }

            let classesSelected = { ...classes };
            for (let class_info of all_class_info) {
                classesSelected = { ...classesSelected, [class_info['crn']]: class_info }
            }
            setClasses(classesSelected);
        }
        getClass();
    },
        [])

    return (
        <div>
            <h3>ID: {id}</h3>
            <DisplayState
                classes={classes}
                width={props.width}
                height={props.height} />

        </div>
    );
}

ReactDOM.render(
    <Home />,
    document.getElementById('root')
);