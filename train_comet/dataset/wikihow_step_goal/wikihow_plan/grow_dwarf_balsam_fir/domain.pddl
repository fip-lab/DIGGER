(define (domain grow_dwarf_balsam_fir)
  (:requirements :strips :typing)

  (:types
    plant
    container
    soil
    location
  )

  (:predicates
    ;; 可用性
    (available_plant_at ?p - plant ?loc - location)
    (available_container_at ?c - container ?loc - location)
    (available_soil_at ?s - soil ?loc - location)

    ;; 持有状态
    (has_plant ?p - plant)
    (has_container ?c - container)
    (has_soil ?s - soil)

    ;; 种植状态
    (planted_in ?p - plant ?c - container)

    ;; 植物状态
    (established ?p - plant)
    (needs_repotting ?p - plant)
    (watered ?p - plant)

    ;; 容器状态
    (clean ?c - container)
    (dirty ?c - container)
    (full ?c - container)
    (empty ?c - container)
  )

  ;; 选择植物
  (:action choose_plant
    :parameters (?p - plant ?loc - location)
    :precondition (available_plant_at ?p ?loc)
    :effect (and
              (has_plant ?p)
              (not (available_plant_at ?p ?loc))
            )
  )

  ;; 选择容器
  (:action choose_container
    :parameters (?c - container ?loc - location)
    :precondition (available_container_at ?c ?loc)
    :effect (and
              (has_container ?c)
              (not (available_container_at ?c ?loc))
            )
  )

  ;; 选择土壤
  (:action choose_soil
    :parameters (?s - soil ?loc - location)
    :precondition (available_soil_at ?s ?loc)
    :effect (and
              (has_soil ?s)
              (not (available_soil_at ?s ?loc))
            )
  )

  ;; 将冷杉种植到容器中
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

  ;; 养护植物（浇水）
  (:action water_plant
    :parameters (?p - plant ?c - container)
    :precondition (planted_in ?p ?c) ;; 这里假设容器已知
    :effect (watered ?p)
  )

  ;; 确立植物
  (:action establish_plant
    :parameters (?p - plant ?c - container)
    :precondition (and
                    (planted_in ?p ?c)
                    (watered ?p)
                  )
    :effect (established ?p)
  )

  ;; 移栽植物
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
