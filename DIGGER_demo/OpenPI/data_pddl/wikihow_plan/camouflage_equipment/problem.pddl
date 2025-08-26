;; PDDL Problem File: camouflage_task
(define (problem camouflage_task)
  (:domain camouflage_equipment)
  (:objects
    my_equipment - equipment
    my_rucksack - rucksack
    my_helmet - helmet
    my_webbing - webbing
    my_weapon - weapon
    my_vehicle - vehicle
    my_camouflage_net - camouflage_net
    ground_surface - surface
  )

  (:init
    ;; Initial state: Equipment exists but is not laid out, organized, or camouflaged
    (not (laid_out my_equipment ground_surface))
    (not (organized my_rucksack))
    (not (organized my_helmet))
    (not (organized my_webbing))
    (not (organized my_weapon))
    (not (camouflaged my_rucksack))
    (not (camouflaged my_helmet))
    (not (camouflaged my_webbing))
    (not (camouflaged my_weapon))
    (not (carefully_disguised my_weapon))
    (not (netted my_vehicle my_camouflage_net))
  )

  (:goal
    (and
      ;; All equipment is laid out on the ground surface
      (laid_out my_equipment ground_surface)

      ;; Equipment is organized
      (organized my_rucksack)
      (organized my_helmet)
      (organized my_webbing)
      (organized my_weapon)

      ;; Camouflage has been applied to all relevant equipment
      (camouflaged my_rucksack)
      (camouflaged my_helmet)
      (camouflaged my_webbing)
      (camouflaged my_weapon)
      (carefully_disguised my_weapon)

      ;; Vehicle has been camouflaged with the camouflage net
      (netted my_vehicle my_camouflage_net)
    )
  )
)
