import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {num1: '', num2: '', result: 0};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.sum = this.sum.bind(this);
    this.subtract = this.subtract.bind(this);
    this.divide = this.divide.bind(this);
    this.multiply = this.multiply.bind(this);
  }

  setNum1(e) {
    let newNum1 = e.target.value;
    this.setState( {num1: newNum1});
  }

  setNum2(e) {
    let newNum2 = e.target.value;
    this.setState( {num2: newNum2});
  }

  sum(e) {
    e.preventDefault();
    let result = Number(this.state.num1) + Number(this.state.num2);
    this.setState( {result: result});
  }

  subtract(e) {
    e.preventDefault();
    let result = Number(this.state.num1) - Number(this.state.num2);
    this.setState( {result: result});
  }

  divide(e) {
    e.preventDefault();
    let result = Number(this.state.num1) / Number(this.state.num2);
    this.setState( {result: result});
  }

  multiply(e) {
    e.preventDefault();
    let result = Number(this.state.num1) * Number(this.state.num2);
    this.setState( {result: result});
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1> 

        <input onChange={this.setNum1} value={this.state.num1}/> 
        <input onChange={this.setNum2} value={this.state.num2}/> 
        <br/>
        <button onClick={this.sum}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;