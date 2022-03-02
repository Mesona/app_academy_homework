import React from 'react';

class Tabs extends React.Component {
  constructor(props){
    super(props);
    this.state = {tabsIndex: 1};
    this.changeTab = this.changeTab.bind(this);
  }

  changeTab(newTabIndex){
    this.setState({ tabsIndex: newTabIndex });
  }

  render(){
    const thisTab = this.props.tabInfo[this.state.tabsIndex];
    return (
      <ul className="tabs-header">
        <li className="tab">
          <header onClick={() => this.changeTab(0)}><h1>{this.props.tabInfo[0].title}</h1></header>
        </li>
        <li className="tab">
          <header onClick={() => this.changeTab(1)}><h1>{this.props.tabInfo[1].title}</h1></header>
        </li>
        <li className="tab">
          <header onClick={() => this.changeTab(2)}><h1>{this.props.tabInfo[2].title}</h1></header>
        </li>
          <article className="tab-content">{thisTab.content}</article>
      </ul>
    )
  }

}

export default Tabs;