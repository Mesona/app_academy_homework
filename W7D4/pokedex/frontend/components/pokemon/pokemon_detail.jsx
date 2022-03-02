import React from 'react';
import PokemonIndex from './pokemon_index';

class PokemonDetail extends React.Component {
  componentDidMount() {
    this.props.requestPokemon(this.props.match.params.pokemonId);
  }
  render(){
    // const items = this.props.items.map(item => <PokemonIndexItem key={item.id} item={item} />);
    return(
      // {items}
      <ul>
        <li>{this.props.pokemon.name}</li>
      </ul>
    )
  }
}

export default PokemonDetail;