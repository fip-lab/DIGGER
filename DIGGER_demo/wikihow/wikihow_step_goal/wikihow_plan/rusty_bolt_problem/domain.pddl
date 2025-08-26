(define (domain rusty_bolt_problem)
    (:requirements :strips :typing)
    (:types entity drink towel bolt)
    
    (:predicates 
        (obtained ?x - drink)
        (on_bolt ?x - drink)
        (on_towel ?x - drink)
        (clean ?x - towel)
        (dirty ?x - towel)
        (stuck ?x - bolt)
        (unstuck ?x - bolt)
        (in_package ?x - bolt)
        (in_machine ?x - bolt)
    )

    (:action obtain_fizzy_drink
        :parameters (?d - drink)
        :precondition (not (obtained ?d))
        :effect (obtained ?d)
    )

    (:action pour_fizzy_drink
        :parameters (?d - drink ?b - bolt)
        :precondition (and (obtained ?d) (stuck ?b))
        :effect (and (on_bolt ?d) (not (obtained ?d)))
    )

    (:action wipe_clean
        :parameters (?t - towel ?d - drink)
        :precondition (and (on_bolt ?d) (clean ?t))
        :effect (and (on_towel ?d) (dirty ?t))
    )

    (:action dissolve_rust
        :parameters (?b - bolt ?d - drink)
        :precondition (and (on_towel ?d) (stuck ?b))
        :effect (and (unstuck ?b) (not (stuck ?b)))
    )
    
    (:action replace_bolt
        :parameters (?b_old - bolt ?b_new - bolt)
        :precondition (and (unstuck ?b_old) (in_package ?b_new))
        :effect (and (in_machine ?b_new) (not (in_package ?b_new)))
    )
)