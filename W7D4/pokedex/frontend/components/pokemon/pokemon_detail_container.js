import { connect } from 'react-redux';
import { selectAllItems } from '../../reducers/selector';
import { requestPokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = (state, ownProps) => ({
  pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
});

const mapDispatchToProps = dispatch => ({
  requestPokemon: id => dispatch(requestPokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);