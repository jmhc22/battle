$(document).ready( () => {
  let currentPlayer = 'p1'
  let defending_player = 'p2'
  $('.ok').hide()
  $('.para-status').hide()
  $('.sleep-status').hide()
  $('.pois-status').hide()


  $('.attack-button').click(() => {
    $('#move-selector').hide()
    const move = event.target.id
    executeAttack(move)
  })

  $('#compturn').click(() => {
    $('#compturn').hide()
    $.get('/api/compturn', (data) => {
      const move = JSON.parse(data).move
      executeAttack(move)
    })
  })

  $('#poischeck').click(() => {
    $('#poischeck').hide()
    $.get('/api/poison', (data) => {
      const outcome = JSON.parse(data).outcome
      if(outcome){
        console.log(outcome)
        $('#gp-text').text(outcome)
        setTimeout(() => {
          gameOverCheck()
          $('#nextturn').show()
        }, 800)
      } else {
        switchTurns()
      }
    })
  })

  $('#nextturn').click(() => {
    $('#nextturn').hide()
    switchTurns()
  })

  const executeAttack = (move) => {
    $.post('/api/battle', `{ "attack": "${move}" }`, (data) => {
      const resp = JSON.parse(data)
      $('#gp-text').text(resp.outcome)
      if(resp.move) { attackAnimation(resp.move) }
      setTimeout(() => {
        gameOverCheck()
        $('#poischeck').show()
      }, 800)
    })
  }

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

  const switchTurns = () => {
    $.get('/api/switch', (data) => {
      const playerIsComputer = JSON.parse(data).computer
      if(playerIsComputer) {
        $('#gp-text').text("Computer's turn.")
        $('#compturn').show()
      }else{
        $('#gp-text').text("Player 1's turn.")
        $('#move-selector').show()
      }
    })
  }
})
