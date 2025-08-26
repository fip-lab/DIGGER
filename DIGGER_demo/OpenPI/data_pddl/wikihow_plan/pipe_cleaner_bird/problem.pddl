(define (problem make_pipe_cleaner_bird)
  (:domain pipe_cleaner_bird)
  (:objects
    pc1 pc2 - pipe_cleaner
    tip - tip_of_pipe_cleaner
    torso - torso
  )
  (:init
    (position pc1 straight)
    (location pc1 completely_on_ground)

    (position pc2 straight)
    (location pc2 on_ground)

    (shape tip straight)
    (location tip closer_to_tip)

    (width torso thinner)
    (weight torso lighter)
  )
  (:goal
    (and
      (position pc1 bent)
      (location pc1 partially_in_air)

      (position pc2 bent)
      (location pc2 on_pipe_cleaner)

      (shape tip shaped_to_form_beak)
      (location tip now_away_from_tip)

      (width torso now_wider)
      (weight torso heavier)
    )
  )
)