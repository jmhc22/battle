$(document).ready( () => {
  console.log('loaded')

  $.get('/api/battle', (data) => {
    console.log(data)
  })

  $('.attack-button').click(() => {
    const move = event.target.id
    $.post('/api/battle', `{ "attack": "${move}" }`, (data) => {
      console.log(data)
    })
  })
})
