(define (domain grow_dwarf_balsam_fir)
  (:requirements :strips :typing)

  (:types
    plant
    container
    soil
    location
  )

  (:predicates
    ;;
    (available_plant_at ?p - plant ?loc - location)
    (available_container_at ?c - container ?loc - location)
    (available_soil_at ?s - soil ?loc - location)

    ;;
    (has_plant ?p - plant)
    (has_container ?c - container)
    (has_soil ?s - soil)

    ;;
    (planted_in ?p - plant ?c - container)

    ;;
    (established ?p - plant)
    (needs_repotting ?p - plant)
    (watered ?p - plant)

    ;;
    (clean ?c - container)
    (dirty ?c - container)
    (full ?c - container)
    (empty ?c - container)
  )

  ;;
  (:action choose_plant
    :parameters (?p - plant ?loc - location)
    :precondition (available_plant_at ?p ?loc)
    :effect (and
              (has_plant ?p)
              (not (available_plant_at ?p ?loc))
            )
  )

  ;;
  (:action choose_container
    :parameters (?c - container ?loc - location)
    :precondition (available_container_at ?c ?loc)
    :effect (and
              (has_container ?c)
              (not (available_container_at ?c ?loc))
            )
  )

  ;;
  (:action choose_soil
    :parameters (?s - soil ?loc - location)
    :precondition (available_soil_at ?s ?loc)
    :effect (and
              (has_soil ?s)
              (not (available_soil_at ?s ?loc))
            )
  )

  ;;
  (:action plant_fir
    :parameters (?p - plant ?c - container ?s - soil)
    :precondition (and
                    (has_plant ?p)
                    (has_container ?c)
                    (has_soil ?s)
                    (clean ?c)
                  )
    :effect (and
              (planted_in ?p ?c)
              (not (has_plant ?p))
              (not (has_container ?c))
              (not (has_soil ?s))
              (dirty ?c)
              (watered ?p)
            )
  )

  ;;     （  ）
  (:action water_plant
    :parameters (?p - plant ?c - container)
    :precondition (planted_in ?p ?c) ;;
    :effect (watered ?p)
  )

  ;;
  (:action establish_plant
    :parameters (?p - plant ?c - container)
    :precondition (and
                    (planted_in ?p ?c)
                    (watered ?p)
                  )
    :effect (established ?p)
  )

  ;;
  (:action re_pot
    :parameters (?p - plant ?c_old - container ?c_new - container)
    :precondition (and
                    (planted_in ?p ?c_old)
                    (established ?p)
                    (needs_repotting ?p)
                    (clean ?c_new)
                  )
    :effect (and
              (planted_in ?p ?c_new)
              (dirty ?c_old)
              (not (planted_in ?p ?c_old))
            )
  )
)
