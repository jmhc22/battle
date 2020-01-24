$(document).ready( () => {
  let currentPlayer = 'p1'
  let defending_player = 'p2'

  $('.attack-button').click(() => {
    const move = event.target.id
    attackAnimation(move)
    $.post('/api/battle', `{ "attack": "${move}" }`, (data) => {
      const outcome = JSON.parse(data).outcome
      $('#gameplay-box').html(`<h2 class="gp-text">${outcome}</h2><a class="ok" id="poischeck">OK</a>`)
      setTimeout(() => { gameOverCheck() }, 1000)
    })
  })

  $('#poischeck').click(() => {
    $.get('/api/poison', (data) => {
      const outcome = JSON.parse(data).outcome
      $('#gameplay-box').html(`<h2 class="gp-text">${outcome}</h2><a class="ok" id="nextturn">OK</a>`)
      setTimeout(() => { gameOverCheck() }, 1000)
    })
  })

  $('#nextturn').click(() => {
    $.get('/api/switch', (data) => {
      const outcome = JSON.parse(data).outcome
      $('#gameplay-box').html(`<h2 class="gp-text">${outcome}</h2><a class="ok" id="nextturn">OK</a>`)
      setTimeout(() => { gameOverCheck() }, 1000)
    })
  })

  const attackAnimation = (move) => {
    $('#attack-space').html(`<img id="attack-img" src="images/${currentPlayer}-${move}-attack.png">`)
    setTimeout(() => {
      $('#attack-img').fadeOut('slow')
    }, 500)
  }

  const gameOverCheck = () => {
    $.get('/api/gameover', (data) => {
      if(JSON.parse(data).gameover) {
        window.location.replace('lose')
      }
    })
  }
})
