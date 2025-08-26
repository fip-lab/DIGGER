(define (problem use_mic_in_team_fortress)
  (:domain team_fortress_mic_usage)

  (:objects
    mic - entity
    panel - entity
    voice - entity
    advice - entity
  )

  (:init
    (not (connected mic))
    (not (plugged-in mic))
    (not (functional mic))
    (not (tested mic))
    (not (visible panel))
    (not (open panel))
    (not (selected panel))
    (not (heard voice))
    (not (efficient voice))
    (not (possible advice))
  )

  (:goal
    (and
      (connected mic)
      (plugged-in mic)
      (functional mic)
      (tested mic)
      (visible panel)
      (open panel)
      (selected panel)
      (heard voice)
      (efficient voice)
      (possible advice)
    )
  )
)