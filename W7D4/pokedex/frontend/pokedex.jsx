import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon, requestAllPokemon, receivePokemon, requestPokemon } from './actions/pokemon_actions';
import { fetchAllPokemon, fetchPokemon, fetchAllItems, fetchItem } from './util/api_utils';
import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selector';
import Root from './components/root';
import { receiveAllItems, requestAllItems, receiveItem, requestItem } from './actions/items_actions';



document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.fetchAllPokemon = fetchAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.receivePokemon = receivePokemon;
  window.requestPokemon = requestPokemon;
  window.fetchAllItems = fetchAllItems;
  window.receiveAllItems = receiveAllItems;
  window.receiveItem = receiveItem;
  window.requestAllItems = requestAllItems;
  window.requestItem = requestItem;
  window.fetchItem = fetchItem;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.selectAllPokemon = selectAllPokemon;
  window.fetchPokemon = fetchPokemon;
  ReactDOM.render(<Root store={store}/>, rootEl);
})