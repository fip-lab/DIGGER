(define (domain call_of_duty)
  (:requirements :strips :typing)
  (:types
    game_character
    routes
    bomb
    pistol
    place
    state
    task
  )

  (:predicates
    ;;
    (location ?c - game_character ?p - place)

    ;;
    (focus ?c - game_character ?t - task)

    ;;
    (coverage ?r - routes ?s - state)

    ;;
    (appearance ?r - routes ?s - state)

    ;;
    (knowledge ?r - routes ?s - state)

    ;;
    (skill ?b - bomb ?s - state)

    ;;
    (pistol_location ?p - pistol ?s - state)

    ;;
    (availability ?p - pistol ?s - state)
  )

  ;;   1:
  (:action move_in
    :parameters (?c - game_character ?r - routes ?from - place ?to - place)
    :precondition (and
                    (location ?c ?from)
                    (coverage ?r uncovered)
                    (appearance ?r uncovered))
    :effect (and
             (location ?c ?to)
             (coverage ?r covered)
             (appearance ?r covered))
  )

  ;;   2:
  (:action find_hiding_spot
    :parameters (?c - game_character ?p - pistol ?ps - place)
    :precondition (and
                    (location ?c ?ps)
                    (pistol_location ?p concealed)
                    (availability ?p in_inventory))
    :effect (and
             (location ?c hidden)
             (pistol_location ?p exposed)
             (availability ?p equipped))
  )

  ;;   3:
  (:action investigate_routes
    :parameters (?c - game_character ?r - routes)
    :precondition (and
                    (location ?c hidden)
                    (focus ?c pulling_out_pistol)
                    (knowledge ?r uninvestigated))
    :effect (and
             (focus ?c investigating)
             (knowledge ?r investigated))
  )

  ;;   4:
  (:action wait_until_planting
    :parameters (?c - game_character ?b - bomb)
    :precondition (and
                    (focus ?c investigating)
                    (skill ?b unplanted))
    :effect (and
             (focus ?c waiting)
             (skill ?b planted))
  )

  ;;   5:
  (:action start_defusing
    :parameters (?c - game_character ?b - bomb)
    :precondition (and
                    (location ?c hidden)
                    (focus ?c waiting)
                    (skill ?b planted))
    :effect (and
             (location ?c now_at_bomb)
             (focus ?c defusing)
             (skill ?b defused))
  )
)
