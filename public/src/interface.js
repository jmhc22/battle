$(document).ready( () => {
  console.log('loaded')




  $.get('/api/battle', (data) => {
    console.log(data)
  })

  $('.attack-button').click(() => {
    const move = event.target.id
    attackAnimation(move)
    $.post('/api/battle', `{ "attack": "${move}" }`, (data) => {
      console.log(data)
    })
  })

  const attackAnimation = (move) => {
    $('#attack-space').html(`<img id="attack-img" src="images/p1-${move}-attack.png">`)
    setTimeout(() => {
      $('#attack-img').fadeOut('slow')
    }, 500);
  }
})
