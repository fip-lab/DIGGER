(define (domain photography_learning)
  (:requirements :strips :typing)
  (:types
    entity
  )
  
  (:predicates
    (studio_setup ?s - entity)
    (reflector_appropriate ?r - entity)
    (lens_closeup ?l - entity)
    (light_diffused ?li - entity)
    (experiment_started ?e - entity)
  )

  (:action create_small_studio
    :parameters (?s - entity)
    :precondition (and)
    :effect (and (studio_setup ?s))
  )

  (:action have_appropriate_reflectors
    :parameters (?r - entity)
    :precondition (and)
    :effect (and (reflector_appropriate ?r))
  )

  (:action have_closeup_lens
    :parameters (?l - entity)
    :precondition (and)
    :effect (and (lens_closeup ?l))
  )

  (:action diffuse_light
    :parameters (?li - entity)
    :precondition (and)
    :effect (and (light_diffused ?li))
  )

  (:action start_experimenting
    :parameters (?e - entity)
    :precondition (and)
    :effect (and (experiment_started ?e))
  )
)