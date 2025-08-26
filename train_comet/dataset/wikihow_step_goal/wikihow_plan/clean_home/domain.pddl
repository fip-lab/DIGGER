(define (domain clean_home)
  (:requirements :strips :typing)

  (:types
    item room rug basket surface cleaner dish)

  (:predicates
    ;; 位置相关谓词
    (stray_item ?item - item)
    (in_basket ?item - item ?basket - basket)

    ;; 状态相关谓词
    (cleaned_room ?room - room)
    (cleaned_rug ?rug - rug)
    (cleaned_surface ?surface - surface)
    (empty ?basket - basket)
    (full ?basket - basket)
    (trash_disposed ?dish - dish)
    (organized ?item - item)

    ;; 初始脏乱状态
    (dusty ?room - room)
    (dirty_rug ?rug - rug)
    (dirty_surface ?surface - surface)
  )

  ;; 动作1：拾起并整理物品到垃圾桶
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

  ;; 动作2：清洁房间的灰尘
  (:action dust_room
    :parameters (?room - room)
    :precondition (dusty ?room)
    :effect (and
              (cleaned_room ?room)
              (not (dusty ?room)))
  )

  ;; 动作3：清空垃圾桶到垃圾袋
  (:action empty_trash
    :parameters (?basket - basket ?dish - dish)
    :precondition (full ?basket)
    :effect (and
              (empty ?basket)
              (trash_disposed ?dish))
  )

  ;; 动作4：使用喷雾清洁剂清洁表面
  (:action clean_surfaces
    :parameters (?surface - surface ?cleaner - cleaner)
    :precondition (dirty_surface ?surface)
    :effect (cleaned_surface ?surface)
  )

  ;; 动作5：摇动地毯和门垫以清洁
  (:action shake_rugs
    :parameters (?rug - rug)
    :precondition (dirty_rug ?rug)
    :effect (cleaned_rug ?rug)
  )

  ;; 动作6：享受干净的家
  (:action enjoy_clean_home
    :parameters ()
    :precondition ()
    :effect ()
  )
)
