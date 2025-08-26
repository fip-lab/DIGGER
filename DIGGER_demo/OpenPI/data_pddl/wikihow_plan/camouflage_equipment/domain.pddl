;; PDDL Domain File: camouflage_equipment
(define (domain camouflage_equipment)
  (:requirements :strips :typing)
  (:types
    equipment rucksack helmet webbing weapon vehicle camouflage_net surface
  )

  (:predicates
    (laid_out ?e - equipment ?s - surface)               ; Equipment is laid out on a surface
    (organized ?e - equipment)                           ; Equipment is organized
    (camouflaged ?e - equipment)                         ; Equipment is camouflaged
    (carefully_disguised ?w - weapon)                    ; Weapon is carefully disguised
    (netted ?v - vehicle ?cn - camouflage_net)           ; Vehicle is netted with camouflage net
  )

  ;; Action 1: Lay out all equipment on a surface
  (:action lay_out_equipment
    :parameters (?e - equipment ?s - surface)
    :precondition (not (laid_out ?e ?s))
    :effect (laid_out ?e ?s)
  )

  ;; Action 2: Organize equipment
  (:action organize_equipment
    :parameters (?e - equipment ?s - surface)
    :precondition (and
      (laid_out ?e ?s)
      (not (organized ?e))
    )
    :effect (organized ?e)
  )
  (:action organize_rucksack
    :parameters (?e - equipment ?s - surface ?r - rucksack)
    :precondition (and
      (laid_out ?e ?s)
      (not (organized ?r))
    )
    :effect (organized ?r)
  )
  (:action organize_helmet
    :parameters (?e - equipment ?s - surface ?h - helmet)
    :precondition (and
      (laid_out ?e ?s)
      (not (organized ?h))
    )
    :effect (organized ?h)
  )
(:action organize_weapon
    :parameters (?e - equipment ?s - surface ?wep - weapon)
    :precondition (and
      (laid_out ?e ?s)
      (not (organized ?wep))
    )
    :effect (organized ?wep)
  )
  (:action organize_webbing
    :parameters (?e - equipment ?s - surface ?web - webbing)
    :precondition (and
      (laid_out ?e ?s)
      (not (organized ?web))
    )
    :effect (organized ?web)
  )
  ;; Action 3: Camouflage the rucksack
  (:action camouflage_rucksack
    :parameters (?r - rucksack)
    :precondition (and
      (organized ?r)
      (not (camouflaged ?r))
    )
    :effect (camouflaged ?r)
  )

  ;; Action 4: Camouflage the helmet
  (:action camouflage_helmet
    :parameters (?h - helmet)
    :precondition (and
      (organized ?h)
      (not (camouflaged ?h))
    )
    :effect (camouflaged ?h)
  )

  ;; Action 5: Camouflage the webbing
  (:action camouflage_webbing
    :parameters (?w - webbing)
    :precondition (and
      (organized ?w)
      (not (camouflaged ?w))
    )
    :effect (camouflaged ?w)
  )

  ;; Action 6: Carefully camouflage the weapon
  (:action camouflage_weapon
    :parameters (?wep - weapon)
    :precondition (and
      (organized ?wep)
      (not (camouflaged ?wep))
    )
    :effect (and
      (camouflaged ?wep)
      (carefully_disguised ?wep)
    )
  )

  ;; Action 7: Camouflage the vehicle with a camouflage net
  (:action camouflage_vehicle
    :parameters (?v - vehicle ?cn - camouflage_net)
    :precondition (not (netted ?v ?cn))
    :effect (netted ?v ?cn)
  )
)
