(define (problem open_rusty_bolt_problem)
    (:domain rusty_bolt_problem)
    
    (:objects
        fizzy_drink1 - drink
        towel1 - towel
        old_bolt1 - bolt
        new_bolt1 - bolt
    )
    
    (:init
        (not (obtained fizzy_drink1))
        (clean towel1)
        (stuck old_bolt1)
        (in_package new_bolt1)
    )

    (:goal 
        (and
            (unstuck old_bolt1)
            (in_machine new_bolt1)
        )
    )
)