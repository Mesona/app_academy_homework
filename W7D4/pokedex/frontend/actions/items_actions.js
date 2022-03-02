
export const RECEIVE_ALL_ITEMS = 'RECEIVE_ALL_ITEMS';
export const REQUEST_ALL_ITEMS = 'REQUEST_ALL_ITEMS';
export const RECEIVE_ITEM = 'RECEIVE_ITEM';
export const REQUEST_ITEM = 'REQUEST_ITEM';

import * as APIUtil from '../util/api_utils';

export const receiveAllItems = items => ({
  type: RECEIVE_ALL_ITEMS,
  items
})

export const requestAllItems = () => (dispatch) => {
  return APIUtil.fetchAllItems()
    .then(items => { dispatch(receiveAllItems(items)) });
}

export const receiveItem = item => ({
  type: RECEIVE_ITEM,
  item
})

export const requestItem = (item) => (dispatch, getState) => {
  return APIUtil.fetchItem(item)
    .then(item => { dispatch(receiveItem(item)) });
}
