import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  // store.dispatch = addLoggingToDispatch(store);
  // store = applyMiddleware(store, addLoggingToDispatch);
  
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

// const addLoggingToDispatch = (store) => {
//   let localStoreDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     localStoreDispatch(action);
//     console.log(store.getState());
//   };
// };

// function addLoggingToDispatch(store) {
//   return function (next) {
//     return function (action) {
//       console.log(store.getState());
//       console.log(action);
//       localStoreDispatch(action);
//       console.log(store.getState());
//     };
//   };
// };

// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };

// const applyMiddleware = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//
//   return Object.assign({}, store, { dispatch });
// }