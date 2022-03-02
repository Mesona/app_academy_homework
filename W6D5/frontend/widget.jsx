import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tabs from './tabs';

const tabInfo = [
  { title: 'one', content: 'I am the first', index: 0 },
  { title: 'two', content: 'Second pane here', index: 1 },
  { title: 'three', content: 'Third pane here', index: 2 }
];

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  ReactDOM.render(
    <div>
      {console.log(tabInfo[0].title)}
      <Clock />
      <br/>
      <Tabs tabInfo={tabInfo} />
    </div>, root);
})