import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {date: Date()};
    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    let intervalId = setInterval(this.tick, 1000);
    this.setState({intervalId: intervalId});
  }

  componentWillUnmount() {
    clearInterval(this.state.intervalId);
  }

  tick() {
    this.setState({date: Date()});
  }

  render() {
    return (
      <div className="clock-box">
        <h1 className="clock-title">Clock</h1>
        <br />
        <div className="clock-border">
          <section className="clock-fields">
            <ul>
              <li>Date</li>
              <li>Time</li>
            </ul>
          </section>
          <section className="clock-values">
            <ul>
                <li>{this.state.date.slice(0, 15)}</li>
                <li>{this.state.date.slice(15, 25)} PST</li>
            </ul>
          </section>
        </div>
      </div>
    )
  }

}

export default Clock