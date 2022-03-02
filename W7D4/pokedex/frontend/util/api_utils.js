

export const fetchAllPokemon = () => {
  return(
    $.ajax({
      method: 'GET',
      url: 'api/pokemon'
    })
  )
}

export const fetchPokemon = (pokemon) => {
  return(
    $.ajax({
      method: 'GET',
      url: `api/pokemon/${pokemon}`,
    })
  )
}

export const fetchAllItems= () => {
  return (
    $.ajax({
      method: 'GET',
      url: 'api/items'
    })
  )
}

export const fetchItem = (item) => {
  return (
    $.ajax({
      method: 'GET',
      url: `api/item/${item}`,
    })
  )
}