import React from 'react';
import './index.css';

export function CheckboxDay(props) {
    return (
        <div className='day-checkbox'>
            <input type='checkbox' name={props.day} onChange={props.handleChange} checked={props.checked}/>
            <label htmlFor={props.day}>{props.day}</label>
        </div>
    );
}

export function ClassInfo(props) {
    const d = props.data;
    return (
    <div className="class_" id={d.crn}>
        <input type='checkbox' name={d.crn} onChange={props.handleChange} checked={props.checked}/>
        CRN={d.crn} dept={d.department} name={d.name} start={d.start_time} end={d.end_time} days={d.dates}
    </div>
    );
}

export class DisplayState extends React.Component {
    constructor(props) {
        super(props);
        this.canvas = React.createRef();
        this.widthFactor = 0.65;
        this.heightFactor = 0.35;
    }

    /**
     * Initial generation of the component
     */
    componentDidMount() {
        let ctx = this.canvas.current.getContext('2d');
    }

    /**
     * Drawn every time the component updates
     */
    componentDidUpdate() {
        let ctx = this.canvas.current.getContext('2d');

        ctx.lineWidth = 5;
        ctx.strokeStyle = 'green';
        ctx.strokeRect(0, 0, this.props.width*this.widthFactor,
            this.props.height*this.heightFactor);


    }

    render() {
        const classes = [];
        console.log(this.props.classes)
        for (let crn in this.props.classes) {
            if (!!this.props.classes[crn]) {
                classes.push(this.props.classes[crn]);
            }
        }
        return (<div>
        {classes.map((cls) => {
            return cls['crn'];
        })}
        <canvas
            id="canvas"
            ref={this.canvas}
            width={this.props.width*this.widthFactor}
            height={this.props.height*this.heightFactor}
        />
        </div>
        );
    }
}