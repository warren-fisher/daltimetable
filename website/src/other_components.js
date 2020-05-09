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
        const width = this.props.width*this.widthFactor;
        const height = this.props.height*this.heightFactor;

        // Rectangular outline
        ctx.lineWidth = 5;
        ctx.strokeStyle = 'green';
        ctx.strokeRect(0, 0, width,
            height);

        // Vertical lines
        ctx.lineWidth = 1;
        ctx.strokeStyle = 'gray';
        ctx.beginPath();
        // There are four lines equally spaced
        for (let i = 1; i < 5; i++) {
            let x = width*i/5;
            ctx.moveTo(x, 0);
            ctx.lineTo(x, height);
            ctx.stroke();
        }

        // Horizontal lines
        // There are 24 lines equally spaced
        for (let i = 1; i < 24; i++) {
            let y = height*i/24;
            ctx.moveTo(0, y);
            ctx.lineTo(width, y)
            ctx.stroke();
        }

        let keys = Object.keys(this.props.classes);
        for (const name of keys) {
            this.drawClass(ctx, this.props.classes[name]);
        }
    }

    // Calculate based on a first block of 830
    timeY(time) {
        const blockSize = this.props.height * this.heightFactor / 24;
        const hr = time.slice(0, 2);
        const min = time.slice(2, 4);

        // Calculate what block the class is in
        // Subtract one because that is equivalent to 30 minutes, and the table
        // starts at 830 and not 8 like expected in (hr - 8)
        let blockNum = (hr - 8) * 2 + min / 30 - 1;
        let y = blockNum * blockSize;

        return y;
    }

    drawClass(ctx, cls) {
        const start = cls.start_time;
        const end = cls.end_time;

        let startY = this.timeY(start);
        let endY = this.timeY(end);

        ctx.lineWidth = 5;
        ctx.strokeStyle = 'yellow';
        ctx.strokeRect(0, startY, this.props.width*this.widthFactor,
            endY - startY);
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