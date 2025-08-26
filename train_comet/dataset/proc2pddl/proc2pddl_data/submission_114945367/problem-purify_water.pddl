(define (problem purify_water)
   (:domain survive_in_the_woods)

   (:objects
      npc - player
      waterfall camp path cliff - location
      in out north south east west up down - direction
      water - water
      cloth container- item
      bottle -container
   )

   (:init
   (connected camp west path)
   (connected path east camp)
   (connected path west cliff)
   (connected cliff east path)
   (connected cliff up waterfall)
   (connected waterfall down cliff)
   (at npc camp)
   (has_water_source waterfall)
   (inventory npc cloth)
   (inventory npc bottle)
   ;; 添加获取水的初始状态
   (at water waterfall)  ;; 假设水在 waterfall
)


   (:goal (and (inventory npc water) (strained water)))
)
