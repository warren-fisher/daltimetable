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
        this.widthFactor = 0.75;
        this.heightFactor = 0.5;
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

        // Reset to blank slate (erases any unselected classes)
        ctx.fillStyle = 'white';
        ctx.fillRect(0, 0, width, height);

        // Rectangular outline
        ctx.lineWidth = 5;
        ctx.strokeStyle = 'green';
        ctx.strokeRect(0, 0, width,
            height);

        // Vertical lines
        ctx.lineWidth = 1;
        ctx.strokeStyle = 'gray';
        ctx.beginPath();
        // There are five horizontal spaces (so 4 lines)
        for (let i = 1; i < 5; i++) {
            let x = width*i/5;
            ctx.moveTo(x, 0);
            ctx.lineTo(x, height);
            ctx.stroke();
        }

        // Horizontal lines
        // There are 24 vertical spaces (so 23 lines)
        for (let i = 1; i < 24; i++) {
            let y = height*i/24;
            ctx.moveTo(0, y);
            ctx.lineTo(width, y)
            ctx.stroke();
        }

        let keys = Object.keys(this.props.classes);
        for (const name of keys) {
            if (this.props.classes[name] === false) {
                continue;
            }
            this.drawClass(ctx, this.props.classes[name]);
        }
    }

    /**
     * Calculate a vertical location on the canvas where a time occurs.
     * Used for determining where to draw the time slot rectangle.
     *
     * @param {string} time
     */
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

    /**
     * Calculate the starting and ending horizontal position based on the day.
     *
     * @param {char} day
     */
    dayX(day) {
        const blockSize = this.props.width * this.widthFactor / 5;
        const dayConv = {
            'M': 0,
            'T': 1,
            'W': 2,
            'R': 3,
            'F': 4,
        }

        let blockNum = dayConv[day];
        // Left side of day
        let xStart = blockNum * blockSize;
        // Right side of day
        let xEnd = (blockNum + 1) * blockSize;
        return [xStart, xEnd];
    }

    /**
     * Draw a rectangle around the time a class occurs
     *
     * @param {canvas ctx object} ctx
     * @param {object} cls
     */
    drawClass(ctx, cls) {
        const start = cls.start_time;
        const end = cls.end_time;

        // Each class has a single time irrespective of day
        // so the y position is the same for all days
        let yStart = this.timeY(start);
        let yEnd = this.timeY(end);

        ctx.lineWidth = 3;
        ctx.strokeStyle = 'yellow';

        // Each day has its own x position
        for (let day of cls.dates.split('')) {
            const [xStart, xEnd] = this.dayX(day);
            ctx.strokeRect(xStart +3, yStart, xEnd - xStart -6,
                yEnd - yStart);

            // Fill in middle
            // TODO: Fix cutting off weird spots
            ctx.fillStyle = 'white';
            ctx.fillRect(xStart +2, yStart, xEnd - xStart - 5,
                yEnd - yStart)

            // Text
            // !TODO: allow for multiline text
            ctx.fillStyle = 'black';
            ctx.font = '1vw georgia';
            ctx.fillText(cls.name, xStart + 2, (yStart + yEnd)/2);
        }
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