(define (domain pipe_cleaner_bird)
  (:requirements :strips :typing)
  (:types
    pipe_cleaner tip_of_pipe_cleaner torso
  )
  (:predicates
    (position ?entity ?pos)
    (shape ?entity ?shape)
    (location ?entity ?loc)
    (width ?entity ?width)
    (weight ?entity ?weight)
  )

  (:action bend_to_form_legs
    :parameters (?p - pipe_cleaner)
    :precondition (and (position ?p straight) (location ?p completely_on_ground))
    :effect (and (position ?p bent) (location ?p partially_in_air))
  )

  (:action shape_to_form_body
    :parameters (?p - pipe_cleaner)
    :precondition (and (position ?p straight) (location ?p on_ground))
    :effect (and (position ?p bent) (location ?p on_pipe_cleaner))
  )

  (:action move_for_beak
    :parameters (?t - tip_of_pipe_cleaner)
    :precondition (and (shape ?t straight) (location ?t closer_to_tip))
    :effect (and (shape ?t shaped_to_form_beak) (location ?t now_away_from_tip))
  )

  (:action enlarge_torso
    :parameters (?t - torso)
    :precondition (and (width ?t thinner) (weight ?t lighter))
    :effect (and (width ?t now_wider) (weight ?t heavier))
  )
)