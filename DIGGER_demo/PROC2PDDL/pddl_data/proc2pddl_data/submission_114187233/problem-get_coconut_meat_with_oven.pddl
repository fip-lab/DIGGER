
(define (problem get_coconut_meat_with_oven)
   (:domain open_a_coconut)

   (:objects
      npc - player
      counter fridge rack oven - location
      knife glass mallet - item
      coconut towel bag - wrappable
      coconut_juice coconut_meat coconut_shell - item
      north south east west up down - direction
)

   (:init
      (connected counter west fridge)
      (connected fridge east counter)
      (connected counter north rack)
      (connected rack south counter)
      (connected counter south oven)
      (connected oven north counter)
      (at towel rack)
      (at knife rack)
      (at bag counter)
      (at mallet counter)
      (at glass rack)
      (at coconut fridge)
      (at npc counter)
   )

   (:goal (and (inventory npc coconut_meat) (peeled coconut_meat) (burnt coconut)))
)
