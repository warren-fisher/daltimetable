import React from 'react';
import './index.css';

/**
 * Class component to draw the entire table of classes. Receives props from SearchState or RenderTable.
 *
 * @param {obj} props.classes Object containing all selected classes
 * @param {num} props.width Horizontal width of the users screen
 * @param {num} props.height Vertical height of the users screen
 */
export class DisplayState extends React.Component {
    constructor(props) {
        super(props);
        this.canvas = React.createRef();
        this.widthFactor = 0.75;
        this.heightFactor = 0.5;
        // Pixel offsets for time / date text
        this.xOffset = 50;
        this.yOffset = 50;
    }

    /**
     * Initial generation of the component. Must draw the entire table because react-router
     * does not cause an inital update of the component when navigating back to 'pick your classes'.
     */
    componentDidMount() {
        this.drawAll();
    }

    /**
     * Drawn every time the component updates.
     */
    componentDidUpdate() {
        this.drawAll();
    }

    /**
     * Main function to draw all of the timetable.
     */
    drawAll() {
        let ctx = this.canvas.current.getContext('2d');
        // How much to offset the table for times/days
        const xOffset = 50;
        const yOffset = 50;
        // Width and Height of the entire table (does not include offset)
        const tWidth = this.props.width * this.widthFactor;
        const tHeight = this.props.height * this.heightFactor;
        // Width and height of the table (not including offset)
        const width = tWidth - xOffset;
        const height = tHeight - yOffset;

        // Reset to blank slate (erases any unselected classes)
        ctx.fillStyle = 'white';
        ctx.fillRect(0, 0, tWidth, tHeight);

        // Rectangular outline
        ctx.lineWidth = 6;
        ctx.strokeStyle = 'green';
        // Green line is 6px wide, so we must add +- 3px or +- 6px sometimes to align correctly
        ctx.strokeRect(xOffset, yOffset, width - 3, height - 3);

        // Vertical lines
        ctx.lineWidth = 1;
        // Light grey
        ctx.strokeStyle = '#b7b7b7';
        ctx.beginPath();

        // What to label each day
        const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
        // There are five horizontal spaces (so 4 lines)
        // We label every day, but skip the first line
        for (let i = 0; i < 5; i++) {
            let x = width * i / 5;
            let x_right = width * (i + 1) / 5;
            let x_center = ((x + xOffset) + (width * (i + 1) / 5)) / 2

            // The i = 0 line is the left hand side of table, already coloured in by outline
            if (i != 0) {
                ctx.moveTo(x + xOffset, yOffset + 3);
                ctx.lineTo(x + xOffset, tHeight - 6);
                ctx.stroke();
            }

            ctx.fillStyle = 'black';
            ctx.font = '2vw georgia';
            // For some reason x position of avg of LHS and center works well
            ctx.fillText(days[i], (x + x_center) / 2, yOffset / 2, x_right - x);
        }

        // Horizontal lines
        // There are 24 vertical spaces (so 23 lines)
        // We label all times from 9:00 to 20:00
        for (let i = 1; i < 24; i++) {
            let y = height * i / 24;
            ctx.moveTo(xOffset + 3, y + yOffset);
            ctx.lineTo(tWidth - 6, y + yOffset)
            ctx.stroke();

            const time = index => `${Math.floor((index + 1) / 2) + 8}:${((index + 1) % 2) * 30}`
            ctx.fillStyle = 'black';
            ctx.font = '1vw georgia';
            // Append a zero to the string if neccesary since the calculation returns 9:0 not 9:00
            let str = (i % 2) == 0 ? time(i) : time(i) + '0';
            ctx.fillText(str, 10, y + yOffset, xOffset - 10);
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
        // How much to offset the table for times/days
        const yOffset = this.xOffset;
        // Width and Height of the entire table (does not include offset)
        const tHeight = this.props.height * this.heightFactor;
        // Width and height of the table (not including offset)
        const height = tHeight - yOffset;

        const blockSize = height / 24;
        // Time in HH:MM format, so we dont care about the :
        const hr = time.slice(0, 2);
        const min = time.slice(3, 5);

        // Calculate what block the class is in
        // Subtract one because that is equivalent to 30 minutes, and the table
        // starts at 830 and not 8 like expected in (hr - 8)
        let blockNum = (hr - 8) * 2 + min / 30 - 1;
        let y = blockNum * blockSize + yOffset;

        return y;
    }

    /**
     * Calculate the starting and ending horizontal position based on the day.
     *
     * @param {char} day
     */
    dayX(day) {
        // How much to offset the table for times/days
        const xOffset = this.yOffset;
        // Width and Height of the entire table (does not include offset)
        const tWidth = this.props.width * this.widthFactor;
        // Width and height of the table (not including offset)
        const width = tWidth - xOffset;

        const blockSize = width / 5;
        const dayConv = {
            'M': 0,
            'T': 1,
            'W': 2,
            'R': 3,
            'F': 4,
        }

        let blockNum = dayConv[day];
        // Left side of day
        let xStart = blockNum * blockSize + xOffset;
        // Right side of day
        let xEnd = (blockNum + 1) * blockSize + xOffset;
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

        console.log(yStart, yEnd);

        ctx.lineWidth = 5;
        // Dark blue
        ctx.strokeStyle = '#0d5af9';

        // Each day has its own x position
        for (let day of cls.dates.split('')) {
            const [xStart, xEnd] = this.dayX(day);
            ctx.strokeRect(xStart + 3, yStart, xEnd - xStart - 6,
                yEnd - yStart);

            // Fill in middle
            // TODO: Fix cutting off weird spots
            ctx.fillStyle = 'white';
            ctx.fillRect(xStart + 3, yStart, xEnd - xStart - 6,
                yEnd - yStart)

            // Text
            // !TODO: allow for multiline text
            ctx.fillStyle = 'black';
            ctx.font = '1vw georgia';
            ctx.fillText(cls.name, xStart + 6, (yStart + yEnd) / 2);
        }
    }

    render() {
        const classes = [];
        console.log(this.props.classes)
        for (let crn in this.props.classes) {
            // Sometimes props.classes[crn] may be undefined, !!undefined === false
            if (!!this.props.classes[crn]) {
                classes.push(this.props.classes[crn]);
            }
        }
        return (<div>
            <canvas
                id="canvas"
                ref={this.canvas}
                width={this.props.width * this.widthFactor}
                height={this.props.height * this.heightFactor}
            />
        </div>
        );
    }
}