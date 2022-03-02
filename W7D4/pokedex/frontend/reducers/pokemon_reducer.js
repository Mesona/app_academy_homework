import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions'

export const pokemonReducer = (state = {}, action) => {
  switch(action.type) {
    case(RECEIVE_ALL_POKEMON):
      let newState = action.pokemon;
      return newState;
    case (RECEIVE_POKEMON):
      let singlePokemon = action.pokemon;
      return singlePokemon;
    default:
      return state;
  }
}