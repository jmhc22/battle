$(document).ready( () => {
  let currentPlayer = 'p1'
  let defendingPlayer = 'p2'
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
        $('#gp-text').text(outcome)
        conditionRefresh()
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
      const response = JSON.parse(data)
      $('#gp-text').text(response.outcome)
      if(response.move) {
        attackAnimation(response.move)
        conditionRefresh()
      }
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
    $.get('/api/switch', (response) => {
      const resp = JSON.parse(response)
      currentPlayer = resp.current
      defendingPlayer = resp.defending
      conditionRefresh()
      if(resp.computer) {
        $('#gp-text').text("Computer's turn.")
        $('#compturn').show()
      }else{
        $('#gp-text').text(`${resp.cur_name}'s turn, pick a move:`)
        $('#move-selector').show()
      }
    })
  }

  const conditionRefresh = () => {
    $.get('/api/conditions', (res) => {
      stats = JSON.parse(res)
      console.log(stats)
      console.log(defendingPlayer)
      $(`#${defendingPlayer}-paralysed`).toggle(stats.par)
      $(`#${defendingPlayer}-sleeping`).toggle(stats.sle)
      $(`#${defendingPlayer}-poisoned`).toggle(stats.poi)
      $(`#${defendingPlayer}-hp`).text(stats.hitpoints)
    })
  }
})
