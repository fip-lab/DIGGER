(define (domain clean_home)
  (:requirements :strips :typing)

  (:types
    item room rug basket surface cleaner dish)

  (:predicates
    ;;
    (stray_item ?item - item)
    (in_basket ?item - item ?basket - basket)

    ;;
    (cleaned_room ?room - room)
    (cleaned_rug ?rug - rug)
    (cleaned_surface ?surface - surface)
    (empty ?basket - basket)
    (full ?basket - basket)
    (trash_disposed ?dish - dish)
    (organized ?item - item)

    ;;
    (dusty ?room - room)
    (dirty_rug ?rug - rug)
    (dirty_surface ?surface - surface)
  )

  ;;   1：
  (:action pickup_items
    :parameters (?item - item ?basket - basket)
    :precondition (and
                    (stray_item ?item)
                    (empty ?basket))
    :effect (and
              (in_basket ?item ?basket)
              (organized ?item)
              (full ?basket))
  )

  ;;   2：
  (:action dust_room
    :parameters (?room - room)
    :precondition (dusty ?room)
    :effect (and
              (cleaned_room ?room)
              (not (dusty ?room)))
  )

  ;;   3：
  (:action empty_trash
    :parameters (?basket - basket ?dish - dish)
    :precondition (full ?basket)
    :effect (and
              (empty ?basket)
              (trash_disposed ?dish))
  )

  ;;   4：
  (:action clean_surfaces
    :parameters (?surface - surface ?cleaner - cleaner)
    :precondition (dirty_surface ?surface)
    :effect (cleaned_surface ?surface)
  )

  ;;   5：
  (:action shake_rugs
    :parameters (?rug - rug)
    :precondition (dirty_rug ?rug)
    :effect (cleaned_rug ?rug)
  )

  ;;   6：
  (:action enjoy_clean_home
    :parameters ()
    :precondition ()
    :effect ()
  )
)
